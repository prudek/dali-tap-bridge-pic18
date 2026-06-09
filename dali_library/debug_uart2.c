/*
 * Project-local source for the DALI sniffer / Control Device terminal bridge.
 * Repository license and third-party notice policy are finalized separately.
 */

#include "mcc.h"

#include "debug_uart2.h"

#define DEBUG_UART2_RX_BUFFER_SIZE 64u
#define DEBUG_UART2_TX_BUFFER_SIZE 128u

static volatile uint8_t debugUart2RxHead;
static volatile uint8_t debugUart2RxTail;
static volatile uint8_t debugUart2TxHead;
static volatile uint8_t debugUart2TxTail;
static volatile uint8_t debugUart2RxOverflow;
static volatile uint8_t debugUart2RxBuffer[DEBUG_UART2_RX_BUFFER_SIZE];
static volatile uint8_t debugUart2TxBuffer[DEBUG_UART2_TX_BUFFER_SIZE];

static void debug_uart2_start_tx_if_ready(void);
static uint8_t debug_uart2_is_tx_ready(void);

void debug_uart2_initialize(void)
{
    debugUart2RxHead = 0;
    debugUart2RxTail = 0;
    debugUart2TxHead = 0;
    debugUart2TxTail = 0;
    debugUart2RxOverflow = 0;

    PIE6bits.U2RXIE = 0;
    PIE6bits.U2TXIE = 0;
    U2RXB = 0x00;
    U2TXB = 0x00;
    U2P1L = 0x00;
    U2P2L = 0x00;
    U2P3L = 0x00;

    /* Match the working UART2 bring-up from the standalone
     * pic18f47k42-cnano-uart2-smoketest3.X reference project. */
    U2CON0 = 0xB0;
    U2CON1 = 0x80;
    U2CON2 = 0x00;
    /* Fosc = 32 MHz, BRGS = 1 (high speed), target baud = 115200. */
    U2BRGL = 0x44;
    U2BRGH = 0x00;
    U2FIFO = 0x2E;
    U2UIR = 0x00;
    U2ERRIR = 0x80;
    U2ERRIE = 0x00;

    PIR6bits.U2RXIF = 0;
    PIR6bits.U2TXIF = 0;

    PIE6bits.U2RXIE = 1;
}

void debug_uart2_service(void)
{
    debug_uart2_start_tx_if_ready();
}

void debug_uart2_receive_isr(void)
{
    uint8_t nextHead;
    uint8_t rxData;

    rxData = U2RXB;
    nextHead = debugUart2RxHead + 1u;
    if(nextHead >= DEBUG_UART2_RX_BUFFER_SIZE)
    {
        nextHead = 0;
    }

    if(nextHead == debugUart2RxTail)
    {
        debugUart2RxOverflow = 1;
    }
    else
    {
        debugUart2RxBuffer[debugUart2RxHead] = rxData;
        debugUart2RxHead = nextHead;
    }

    PIR6bits.U2RXIF = 0;
}

void debug_uart2_write_char(char c)
{
    uint8_t nextHead;

    for(;;)
    {
        nextHead = debugUart2TxHead + 1u;
        if(nextHead >= DEBUG_UART2_TX_BUFFER_SIZE)
        {
            nextHead = 0;
        }

        if(nextHead != debugUart2TxTail)
        {
            break;
        }

        /* Drain queued data until there is room for the next character.
         * This keeps long terminal responses streaming instead of truncating. */
        debug_uart2_service();
    }

    debugUart2TxBuffer[debugUart2TxHead] = (uint8_t)c;
    debugUart2TxHead = nextHead;
    debug_uart2_service();
}

void debug_uart2_write_string(const char *text)
{
    while(*text != '\0')
    {
        debug_uart2_write_char(*text);
        text++;
    }
}

void debug_uart2_write_blocking_char(uint8_t value)
{
    while(debug_uart2_is_tx_ready() == 0u)
    {
        ;
    }

    U2TXB = value;
}

uint8_t debug_uart2_read_byte(uint8_t *value)
{
    if(debugUart2RxHead == debugUart2RxTail)
    {
        return 0u;
    }

    *value = debugUart2RxBuffer[debugUart2RxTail];
    debugUart2RxTail++;
    if(debugUart2RxTail >= DEBUG_UART2_RX_BUFFER_SIZE)
    {
        debugUart2RxTail = 0;
    }

    return 1u;
}

static void debug_uart2_start_tx_if_ready(void)
{
    while((debugUart2TxHead != debugUart2TxTail) && (debug_uart2_is_tx_ready() != 0u))
    {
        U2TXB = debugUart2TxBuffer[debugUart2TxTail];
        debugUart2TxTail++;
        if(debugUart2TxTail >= DEBUG_UART2_TX_BUFFER_SIZE)
        {
            debugUart2TxTail = 0;
        }
    }
}

static uint8_t debug_uart2_is_tx_ready(void)
{
    return (uint8_t)((U2FIFObits.TXBF == 0u) && (U2CON0bits.TXEN != 0u));
}
