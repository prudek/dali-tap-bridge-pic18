# DALI Sniffer / Control Device Terminal Bridge

Firmware for the `PIC18F47K42` Curiosity Nano that focuses on two things:

1. sniffing the DALI bus and streaming diagnostic events to the terminal
2. sending DALI commands and raw 16-bit / 24-bit frames from the terminal

It is intentionally a minimal runtime. This branch focuses on the sniffer/CD
runtime, while the full Control Gear / lamp application remains in the base
repository.

## What It Does

- receives DALI traffic on `UART1` (`RC2/RC3`)
- uses `UART2` (`RD0/RD1`) as the debug terminal at `115200 8N1`
- reports raw forward and backward frame events
- exposes terminal commands for sniffer control, diagnostics, and DALI TX
- supports `dali arc short`, `dali arc broadcast`, `send 16`, and `send 24`

## Terminal Commands

- `help`
- `gvr`
- `ping`
- `status`
- `uptime`
- `led on`
- `led off`
- `led blink`
- `dali status`
- `dali stats`
- `sniffer on`
- `sniffer off`
- `sniffer status`
- `dali arc short <addr> <level>`
- `dali arc broadcast <level>`
- `send 16 <b0> <b1>`
- `send 24 <b0> <b1> <b2>`

Raw byte arguments accept decimal or `0x`-prefixed hex.

## Build

From the project directory:

```powershell
make -f nbproject\Makefile-default.mk SUBPROJECTS= .build-conf
```

If MPLABX needs the bundled make executable, use the full path noted in
`AGENTS.md`.

## Documentation

- [Hardware](docs/hardware.md)
- [Terminal](docs/terminal.md)
- [Release gate](docs/release-gate.md)
- [NOTICE](NOTICE)
- [LICENSE](LICENSE)

## Repository Layout

- `DALI_CG_PIC18F47K42.X`: MPLAB X project and MCC-generated configuration
- `dali_library`: runtime source for diagnostics, terminal, and DALI control
- `docs`: public documentation for the sniffer/CD branch
