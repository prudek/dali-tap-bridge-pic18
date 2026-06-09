/*
 * Project-local source for the DALI sniffer / Control Device terminal bridge.
 * Repository license and third-party notice policy are finalized separately.
 */

#include <string.h>
#include <stdlib.h>

#include "board_diag.h"
#include "dali_diag.h"
#include "dali_diag_terminal.h"
#include "dali_cg_frameHandler.h"
#include "debug_console.h"
#include "debug_uart2.h"

#define DEBUG_CONSOLE_LINE_BUFFER_SIZE 64u
#define DEBUG_CONSOLE_FW_VERSION "1.0.1"
#define DEBUG_CONSOLE_DALI_ARC_PREFIX "dali arc "
#define DEBUG_CONSOLE_DALI_SEND_PREFIX "send "
#define DEBUG_CONSOLE_DALI_ARC_TIMEOUT_MS 1000u

static uint8_t debugConsoleLineBuffer[DEBUG_CONSOLE_LINE_BUFFER_SIZE];
static uint8_t debugConsoleLineLength;
static uint8_t debugConsoleSkipNextLf;
static volatile uint8_t debugConsoleDaliInitialized;
static volatile uint8_t debugConsoleMainLoopActive;
static volatile uint32_t debugConsoleMainLoopIterations;

static void debug_console_handle_command(const char *command);
static void debug_console_write_uint32(uint32_t value);
static void debug_console_write_hex8(uint8_t value);
static void debug_console_write_hex16(uint16_t value);
static void debug_console_write_hex24(uint32_t value);
static void debug_console_stream_sniffer(void);
static uint8_t debug_console_try_handle_dali_arc_command(const char *command);
static uint8_t debug_console_try_handle_dali_send_command(const char *command);
static uint8_t debug_console_parse_u8(const char *token, uint8_t maxValue, uint8_t *valueOut);
static uint8_t debug_console_send_dali_arc_frame(uint8_t addressByte, uint8_t level);
static uint8_t debug_console_send_dali_raw16(uint8_t byte0, uint8_t byte1);
static uint8_t debug_console_send_dali_raw24(uint8_t byte0, uint8_t byte1, uint8_t byte2);
static void debug_uart2_smoke_test_service(void);

void debug_console_initialize(void)
{
    debug_uart2_initialize();
    debugConsoleLineLength = 0;
    debugConsoleSkipNextLf = 0;
    debugConsoleDaliInitialized = 0;
    debugConsoleMainLoopActive = 0;
    debugConsoleMainLoopIterations = 0;
}

void debug_console_set_dali_initialized(uint8_t initialized)
{
    debugConsoleDaliInitialized = initialized;
}

void debug_console_mark_main_loop(void)
{
    debugConsoleMainLoopActive = 1;
    debugConsoleMainLoopIterations++;
}

void debug_console_write_banner(void)
{
#if DEBUG_CONSOLE_SMOKE_TEST
    return;
#else
    debug_uart2_write_string("\r\nPIC18F47K42 Curiosity Nano debug console ready\r\n");
    debug_uart2_write_string("UART2: 115200 8N1\r\n");
    debug_uart2_write_string("Commands: help, gvr, ping, status, uptime, led on, led off, led blink, dali status, dali stats, sniffer on, sniffer off, sniffer status, dali arc short <addr> <level>, dali arc broadcast <level>, send 16 <b0> <b1>, send 24 <b0> <b1> <b2>\r\n");
    debug_uart2_write_string("Raw bytes accept decimal or 0x-prefixed hex\r\n> ");
#endif
}

void debug_console_service(void)
{
#if DEBUG_CONSOLE_SMOKE_TEST
    debug_uart2_smoke_test_service();
    return;
#else
    uint8_t rxData;

    debug_console_stream_sniffer();

    while(debug_uart2_read_byte(&rxData) != 0u)
    {
        if((debugConsoleSkipNextLf != 0u) && (rxData == '\n'))
        {
            debugConsoleSkipNextLf = 0;
            continue;
        }

        if((rxData == '\r') || (rxData == '\n'))
        {
            debugConsoleSkipNextLf = (uint8_t)(rxData == '\r');

            if(debugConsoleLineLength > 0u)
            {
                debugConsoleLineBuffer[debugConsoleLineLength] = '\0';
                debug_uart2_write_string("\r\n");
                debug_console_handle_command((const char *)debugConsoleLineBuffer);
                debugConsoleLineLength = 0;
            }
            debug_uart2_write_string("> ");
        }
        else if((rxData == 0x08u) || (rxData == 0x7Fu))
        {
            if(debugConsoleLineLength > 0u)
            {
                debugConsoleLineLength--;
            }
        }
        else if(debugConsoleLineLength < (DEBUG_CONSOLE_LINE_BUFFER_SIZE - 1u))
        {
            debugConsoleLineBuffer[debugConsoleLineLength] = rxData;
            debugConsoleLineLength++;
            debug_uart2_write_char((char)rxData);
        }
    }

    debug_uart2_service();
#endif
}

static void debug_console_write_uint32(uint32_t value)
{
    char digits[10];
    uint8_t index;

    if(value == 0u)
    {
        debug_uart2_write_char('0');
        return;
    }

    index = 0u;
    while((value > 0u) && (index < sizeof(digits)))
    {
        digits[index] = (char)('0' + (value % 10u));
        value /= 10u;
        index++;
    }

    while(index > 0u)
    {
        index--;
        debug_uart2_write_char(digits[index]);
    }
}

static void debug_console_write_hex8(uint8_t value)
{
    const char *hex = "0123456789ABCDEF";

    debug_uart2_write_char(hex[(value >> 4) & 0x0Fu]);
    debug_uart2_write_char(hex[value & 0x0Fu]);
}

static void debug_console_write_hex16(uint16_t value)
{
    debug_console_write_hex8((uint8_t)(value >> 8));
    debug_console_write_hex8((uint8_t)value);
}

static void debug_console_write_hex24(uint32_t value)
{
    debug_console_write_hex8((uint8_t)((value >> 16) & 0xFFu));
    debug_console_write_hex8((uint8_t)((value >> 8) & 0xFFu));
    debug_console_write_hex8((uint8_t)(value & 0xFFu));
}

static void debug_console_stream_sniffer(void)
{
    tdali_sniffer_event event;

    while(dali_diag_pop_sniffer_event(&event) != 0u)
    {
        debug_uart2_write_string("sniffer ts_ms=");
        debug_console_write_uint32(event.uptime_ms);

        switch(event.frame_type)
        {
            case DALI_SNIFFER_FRAME_RX_FORWARD_16:
                debug_uart2_write_string(" dir=rx_forward16 raw=0x");
                debug_console_write_hex16((uint16_t)(event.raw & 0x0000FFFFu));
                break;

            case DALI_SNIFFER_FRAME_RX_FORWARD_24:
                debug_uart2_write_string(" dir=rx_forward24 raw=0x");
                debug_console_write_hex24(event.raw & 0x00FFFFFFu);
                break;

            case DALI_SNIFFER_FRAME_RX_BACKWARD_8:
                debug_uart2_write_string(" dir=rx_backward raw=0x");
                debug_console_write_hex8((uint8_t)(event.raw & 0x000000FFu));
                break;

            case DALI_SNIFFER_FRAME_TX_FORWARD_16_LOCAL:
                debug_uart2_write_string(" dir=tx_forward16_local raw=0x");
                debug_console_write_hex16((uint16_t)(event.raw & 0x0000FFFFu));
                break;

            case DALI_SNIFFER_FRAME_TX_FORWARD_24_LOCAL:
                debug_uart2_write_string(" dir=tx_forward24_local raw=0x");
                debug_console_write_hex24(event.raw & 0x00FFFFFFu);
                break;

            default:
                debug_uart2_write_string(" dir=unknown raw=0x");
                debug_console_write_hex8((uint8_t)(event.raw & 0x000000FFu));
                break;
        }

        debug_uart2_write_string("\r\n");
    }
}

static void debug_uart2_smoke_test_service(void)
{
    static uint32_t lastPrintMs;
    uint32_t uptimeMs;

    uptimeMs = board_diag_get_uptime_ms();

    if((uptimeMs - lastPrintMs) >= 1000u)
    {
        lastPrintMs = uptimeMs;
        debug_uart2_write_blocking_char('H');
        debug_uart2_write_blocking_char('e');
        debug_uart2_write_blocking_char('l');
        debug_uart2_write_blocking_char('l');
        debug_uart2_write_blocking_char('o');
        debug_uart2_write_blocking_char(' ');
        debug_uart2_write_blocking_char('W');
        debug_uart2_write_blocking_char('o');
        debug_uart2_write_blocking_char('r');
        debug_uart2_write_blocking_char('l');
        debug_uart2_write_blocking_char('d');
        debug_uart2_write_blocking_char('\r');
        debug_uart2_write_blocking_char('\n');
    }
}

static uint8_t debug_console_try_handle_dali_arc_command(const char *command)
{
    char commandCopy[DEBUG_CONSOLE_LINE_BUFFER_SIZE];
    char *token;
    uint8_t shortAddress;
    uint8_t level;
    uint8_t addressByte;
    char *addressToken;
    char *levelToken;
    char *tail;

    if(command == 0)
    {
        return 0u;
    }

    if(strncmp(command, DEBUG_CONSOLE_DALI_ARC_PREFIX, strlen(DEBUG_CONSOLE_DALI_ARC_PREFIX)) != 0)
    {
        return 0u;
    }

#if !defined(DALI_ROLE_CONTROL_DEVICE)
    (void)commandCopy;
    (void)token;
    (void)shortAddress;
    (void)level;
    (void)addressByte;
    (void)addressToken;
    (void)levelToken;
    (void)tail;
    debug_uart2_write_string("error unavailable in control gear build\r\n");
    return 1u;
#else
    shortAddress = 0u;
    level = 0u;
    addressByte = 0u;
    strncpy(commandCopy, command, sizeof(commandCopy) - 1u);
    commandCopy[sizeof(commandCopy) - 1u] = '\0';

    token = strtok(commandCopy, " ");
    if((token == 0) || (strcmp(token, "dali") != 0))
    {
        debug_uart2_write_string("error invalid syntax\r\n");
        return 1u;
    }

    token = strtok(0, " ");
    if((token == 0) || (strcmp(token, "arc") != 0))
    {
        debug_uart2_write_string("error invalid syntax\r\n");
        return 1u;
    }

    token = strtok(0, " ");
    if(token == 0)
    {
        debug_uart2_write_string("error usage: dali arc short <addr> <level> | dali arc broadcast <level>\r\n");
        return 1u;
    }

    if(strcmp(token, "short") == 0)
    {
        addressToken = strtok(0, " ");
        levelToken = strtok(0, " ");
        tail = strtok(0, " ");

        if((addressToken == 0) || (levelToken == 0) || (tail != 0))
        {
            debug_uart2_write_string("error usage: dali arc short <addr> <level>\r\n");
            return 1u;
        }

        if(debug_console_parse_u8(addressToken, 63u, &shortAddress) == 0u)
        {
            debug_uart2_write_string("error addr out of range (0..63)\r\n");
            return 1u;
        }

        if(debug_console_parse_u8(levelToken, 255u, &level) == 0u)
        {
            debug_uart2_write_string("error level out of range (0..255)\r\n");
            return 1u;
        }

        addressByte = (uint8_t)(shortAddress << 1);
        (void)debug_console_send_dali_arc_frame(addressByte, level);
        return 1u;
    }

    if(strcmp(token, "broadcast") == 0)
    {
        levelToken = strtok(0, " ");
        tail = strtok(0, " ");

        if((levelToken == 0) || (tail != 0))
        {
            debug_uart2_write_string("error usage: dali arc broadcast <level>\r\n");
            return 1u;
        }

        if(debug_console_parse_u8(levelToken, 255u, &level) == 0u)
        {
            debug_uart2_write_string("error level out of range (0..255)\r\n");
            return 1u;
        }

        (void)debug_console_send_dali_arc_frame(0xFEu, level);
        return 1u;
    }

    debug_uart2_write_string("error usage: dali arc short <addr> <level> | dali arc broadcast <level>\r\n");
    return 1u;
#endif
}

static uint8_t debug_console_try_handle_dali_send_command(const char *command)
{
    char commandCopy[DEBUG_CONSOLE_LINE_BUFFER_SIZE];
    char *token;
    char *byte0Token;
    char *byte1Token;
    char *byte2Token;
    char *tail;
    uint8_t byte0;
    uint8_t byte1;
    uint8_t byte2;

    if(command == 0)
    {
        return 0u;
    }

    if(strncmp(command, DEBUG_CONSOLE_DALI_SEND_PREFIX, strlen(DEBUG_CONSOLE_DALI_SEND_PREFIX)) != 0)
    {
        return 0u;
    }

#if !defined(DALI_ROLE_CONTROL_DEVICE)
    (void)commandCopy;
    (void)token;
    (void)byte0Token;
    (void)byte1Token;
    (void)byte2Token;
    (void)tail;
    (void)byte0;
    (void)byte1;
    (void)byte2;
    debug_uart2_write_string("error unavailable in control gear build\r\n");
    return 1u;
#else
    byte0 = 0u;
    byte1 = 0u;
    byte2 = 0u;
    strncpy(commandCopy, command, sizeof(commandCopy) - 1u);
    commandCopy[sizeof(commandCopy) - 1u] = '\0';

    token = strtok(commandCopy, " ");
    if((token == 0) || (strcmp(token, "send") != 0))
    {
        debug_uart2_write_string("error invalid syntax\r\n");
        return 1u;
    }

    token = strtok(0, " ");
    if(token == 0)
    {
        debug_uart2_write_string("error usage: send 16 <b0> <b1> | send 24 <b0> <b1> <b2>\r\n");
        return 1u;
    }

    if(strcmp(token, "16") == 0)
    {
        byte0Token = strtok(0, " ");
        byte1Token = strtok(0, " ");
        tail = strtok(0, " ");

        if((byte0Token == 0) || (byte1Token == 0) || (tail != 0))
        {
            debug_uart2_write_string("error usage: send 16 <b0> <b1>\r\n");
            return 1u;
        }

        if((debug_console_parse_u8(byte0Token, 255u, &byte0) == 0u) ||
           (debug_console_parse_u8(byte1Token, 255u, &byte1) == 0u))
        {
            debug_uart2_write_string("error byte out of range (0..255)\r\n");
            return 1u;
        }

        (void)debug_console_send_dali_raw16(byte0, byte1);
        return 1u;
    }

    if(strcmp(token, "24") == 0)
    {
        byte0Token = strtok(0, " ");
        byte1Token = strtok(0, " ");
        byte2Token = strtok(0, " ");
        tail = strtok(0, " ");

        if((byte0Token == 0) || (byte1Token == 0) || (byte2Token == 0) || (tail != 0))
        {
            debug_uart2_write_string("error usage: send 24 <b0> <b1> <b2>\r\n");
            return 1u;
        }

        if((debug_console_parse_u8(byte0Token, 255u, &byte0) == 0u) ||
           (debug_console_parse_u8(byte1Token, 255u, &byte1) == 0u) ||
           (debug_console_parse_u8(byte2Token, 255u, &byte2) == 0u))
        {
            debug_uart2_write_string("error byte out of range (0..255)\r\n");
            return 1u;
        }

        (void)debug_console_send_dali_raw24(byte0, byte1, byte2);
        return 1u;
    }

    debug_uart2_write_string("error usage: send 16 <b0> <b1> | send 24 <b0> <b1> <b2>\r\n");
    return 1u;
#endif
}

static uint8_t debug_console_parse_u8(const char *token, uint8_t maxValue, uint8_t *valueOut)
{
    char *endPtr;
    unsigned long parsedValue;

    if((token == 0) || (valueOut == 0) || (*token == '\0'))
    {
        return 0u;
    }

    endPtr = 0;
    parsedValue = strtoul(token, &endPtr, 0);
    if((*endPtr != '\0') || (parsedValue > maxValue))
    {
        return 0u;
    }

    *valueOut = (uint8_t)parsedValue;
    return 1u;
}

static uint8_t debug_console_send_dali_arc_frame(uint8_t addressByte, uint8_t level)
{
#if defined(DALI_ROLE_CONTROL_DEVICE)
    uint32_t startedMs;
    uint8_t sent;

    startedMs = board_diag_get_uptime_ms();
    do
    {
        sent = idali_sendForwardFrame16(addressByte, level);
        if(sent != 0u)
        {
            debug_uart2_write_string("ok\r\n");
            return 1u;
        }
    } while((board_diag_get_uptime_ms() - startedMs) < DEBUG_CONSOLE_DALI_ARC_TIMEOUT_MS);

    debug_uart2_write_string("error timeout\r\n");
    return 0u;
#else
    (void)addressByte;
    (void)level;
    debug_uart2_write_string("error unavailable in control gear build\r\n");
    return 0u;
#endif
}

static uint8_t debug_console_send_dali_raw16(uint8_t byte0, uint8_t byte1)
{
#if defined(DALI_ROLE_CONTROL_DEVICE)
    uint32_t startedMs;
    uint8_t sent;

    startedMs = board_diag_get_uptime_ms();
    do
    {
        sent = idali_sendForwardFrame16(byte0, byte1);
        if(sent != 0u)
        {
            debug_uart2_write_string("ok raw=0x");
            debug_console_write_hex16(((uint16_t)byte0 << 8) | (uint16_t)byte1);
            debug_uart2_write_string("\r\n");
            return 1u;
        }
    } while((board_diag_get_uptime_ms() - startedMs) < DEBUG_CONSOLE_DALI_ARC_TIMEOUT_MS);

    debug_uart2_write_string("error timeout\r\n");
    return 0u;
#else
    (void)byte0;
    (void)byte1;
    debug_uart2_write_string("error unavailable in control gear build\r\n");
    return 0u;
#endif
}

static uint8_t debug_console_send_dali_raw24(uint8_t byte0, uint8_t byte1, uint8_t byte2)
{
#if defined(DALI_ROLE_CONTROL_DEVICE)
    uint32_t startedMs;
    uint8_t sent;

    startedMs = board_diag_get_uptime_ms();
    do
    {
        sent = idali_sendForwardFrame24(byte0, byte1, byte2);
        if(sent != 0u)
        {
            debug_uart2_write_string("ok raw=0x");
            debug_console_write_hex24(((uint32_t)byte0 << 16) |
                                      ((uint32_t)byte1 << 8) |
                                      (uint32_t)byte2);
            debug_uart2_write_string("\r\n");
            return 1u;
        }
    } while((board_diag_get_uptime_ms() - startedMs) < DEBUG_CONSOLE_DALI_ARC_TIMEOUT_MS);

    debug_uart2_write_string("error timeout\r\n");
    return 0u;
#else
    (void)byte0;
    (void)byte1;
    (void)byte2;
    debug_uart2_write_string("error unavailable in control gear build\r\n");
    return 0u;
#endif
}

static void debug_console_handle_command(const char *command)
{
    tdali_diag_terminal_context diagTerminalContext;

    diagTerminalContext.dali_initialized = debugConsoleDaliInitialized;
    diagTerminalContext.main_loop_active = debugConsoleMainLoopActive;
    diagTerminalContext.current_uptime_ms = board_diag_get_uptime_ms();

    if(dali_diag_terminal_try_handle_command(command, &diagTerminalContext, debug_uart2_write_char) != 0u)
    {
        return;
    }

    if(debug_console_try_handle_dali_arc_command(command) != 0u)
    {
        return;
    }

    if(debug_console_try_handle_dali_send_command(command) != 0u)
    {
        return;
    }

    if(strcmp(command, "help") == 0)
    {
        debug_uart2_write_string("help, gvr, ping, status, uptime, led on, led off, led blink, sniffer on, sniffer off, sniffer status, dali arc short <addr> <level>, dali arc broadcast <level>, send 16 <b0> <b1>, send 24 <b0> <b1> <b2>, ");
        dali_diag_terminal_write_command_summary(debug_uart2_write_char);
        debug_uart2_write_string("\r\n");
    }
    else if(strcmp(command, "gvr") == 0)
    {
        debug_uart2_write_string("version=");
        debug_uart2_write_string(DEBUG_CONSOLE_FW_VERSION);
        debug_uart2_write_string("\r\n");
    }
    else if(strcmp(command, "ping") == 0)
    {
        debug_uart2_write_string("pong\r\n");
    }
    else if(strcmp(command, "status") == 0)
    {
        debug_uart2_write_string("alive=yes uptime_ms=");
        debug_console_write_uint32(board_diag_get_uptime_ms());
        debug_uart2_write_string(" led_mode=");

        switch(board_diag_get_led_mode())
        {
            case BOARD_DIAG_LED_MODE_OFF:
                debug_uart2_write_string("off_dali");
                break;

            case BOARD_DIAG_LED_MODE_ON:
                debug_uart2_write_string("on");
                break;

            default:
                debug_uart2_write_string("heartbeat");
                break;
        }

        debug_uart2_write_string(" debug_uart=ready dali_initialized=");
        debug_uart2_write_string((debugConsoleDaliInitialized != 0u) ? "yes" : "no");
        debug_uart2_write_string(" sniffer=");
        debug_uart2_write_string((dali_diag_get_sniffer_enabled() != 0u) ? "on" : "off");
        debug_uart2_write_string("\r\n");
    }
    else if(strcmp(command, "uptime") == 0)
    {
        debug_uart2_write_string("uptime_ms=");
        debug_console_write_uint32(board_diag_get_uptime_ms());
        debug_uart2_write_string("\r\n");
    }
    else if(strcmp(command, "led on") == 0)
    {
        board_diag_set_led_mode(BOARD_DIAG_LED_MODE_ON);
        debug_uart2_write_string("led=on\r\n");
    }
    else if(strcmp(command, "led off") == 0)
    {
        board_diag_set_led_mode(BOARD_DIAG_LED_MODE_OFF);
        debug_uart2_write_string("led=off\r\n");
    }
    else if(strcmp(command, "led blink") == 0)
    {
        board_diag_set_led_mode(BOARD_DIAG_LED_MODE_HEARTBEAT);
        debug_uart2_write_string("led=heartbeat\r\n");
    }
    else if(strcmp(command, "sniffer on") == 0)
    {
        dali_diag_set_sniffer_enabled(1u);
        debug_uart2_write_string("sniffer=on uart2_baud=115200\r\n");
    }
    else if(strcmp(command, "sniffer off") == 0)
    {
        dali_diag_set_sniffer_enabled(0u);
        debug_uart2_write_string("sniffer=off\r\n");
    }
    else if(strcmp(command, "sniffer status") == 0)
    {
        debug_uart2_write_string("sniffer=");
        debug_uart2_write_string((dali_diag_get_sniffer_enabled() != 0u) ? "on" : "off");
        debug_uart2_write_string(" queued=");
        debug_console_write_uint32(dali_diag_get_sniffer_queue_count());
        debug_uart2_write_string(" dropped=");
        debug_console_write_uint32(dali_diag_get_sniffer_dropped_events());
        debug_uart2_write_string("\r\n");
    }
    else
    {
        debug_uart2_write_string("unknown command\r\n");
    }
}
