# Terminal

This firmware exposes a small command surface over `UART2`.

## Command Summary

- `help` prints the command summary
- `gvr` prints the firmware version
- `ping` replies with `pong`
- `status` prints runtime status, LED mode, and sniffer state
- `uptime` prints uptime in milliseconds
- `led on` forces the board LED on
- `led off` turns the board LED off
- `led blink` restores heartbeat mode
- `dali status` prints a diagnostics snapshot
- `dali stats` prints counters and recent DALI event history
- `sniffer on` enables the sniffer stream
- `sniffer off` disables the sniffer stream
- `sniffer status` reports sniffer state and queue usage
- `dali arc short <addr> <level>` sends a short-address direct arc command
- `dali arc broadcast <level>` sends a broadcast direct arc command
- `send 16 <b0> <b1>` sends a raw 16-bit frame
- `send 24 <b0> <b1> <b2>` sends a raw 24-bit frame

## Raw Frame Syntax

The raw send commands treat arguments as bytes:

- decimal values are accepted
- `0x`-prefixed hex values are accepted
- each argument must fit in `0..255`

## Output Shape

Sniffer lines are printed in a machine-friendly format, for example:

- `rx_forward16`
- `rx_forward24`
- `rx_backward`
- `tx_forward16_local`
- `tx_forward24_local`

That keeps terminal logs usable for both manual inspection and script-based
parsing.
