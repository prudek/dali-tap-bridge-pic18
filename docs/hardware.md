# Hardware

This branch targets the `PIC18F47K42 Curiosity Nano` platform.

## Signal Mapping

- `UART1` is the DALI transport
- `RC2` is `UART1 TX`
- `RC3` is `UART1 RX`
- `UART2` is the debug terminal
- `RD0` is `UART2 TX`
- `RD1` is `UART2 RX`
- `RE0` is the board diagnostic LED

## Electrical Notes

- The firmware expects a DALI physical front-end between the MCU and the bus.
- The receive path is expected to present the inverted logic convention used by
  the existing DALI HAL.
- The transmit path must drive the bus through a proper DALI driver stage.
- `UART2` should remain isolated from the DALI bus.

## Terminal Transport

- baud rate: `115200`
- data bits: `8`
- parity: `none`
- stop bits: `1`

## Practical Notes

- The terminal is meant for command entry and diagnostic output.
- The sniffer stream is emitted over the same terminal link.
- The firmware can emit raw forward and backward frame observations, so an
  external terminal log is often enough for basic bring-up.
