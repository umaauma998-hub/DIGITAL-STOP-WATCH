# Digital Stopwatch using Verilog

## Overview

A Digital Stopwatch is a sequential digital system used to measure elapsed time. This project implements a simple digital stopwatch using Verilog HDL.

The stopwatch counts time in the format **MM:SS:MS**, where minutes, seconds, and milliseconds are displayed separately.

The project includes the Verilog design, testbench, and simulation results.

## Features

- Digital stopwatch implementation using Verilog HDL
- Start/Stop control
- Reset functionality
- Minute, second, and millisecond counters
- Automatic rollover of counters
- Synthesizable RTL design
- Testbench for functional verification
- Simulation waveform

## Stopwatch Format

```text
MM : SS : MS
```

Where:

- `MM` = Minutes
- `SS` = Seconds
- `MS` = Centiseconds / smaller time unit used for simulation

## Inputs

| Signal | Description |
|--------|-------------|
| `clk` | System clock |
| `rst` | Reset signal |
| `start_stop` | Starts or stops the stopwatch |

## Outputs

| Signal | Description |
|--------|-------------|
| `minutes` | Minute count |
| `seconds` | Second count |
| `milliseconds` | Millisecond count |

## Working Principle

When `start_stop` is HIGH, the stopwatch starts counting.

When `start_stop` is LOW, the stopwatch pauses.

When `rst` is HIGH, all counters are reset to zero.

The counters increment in the following order:

```text
Milliseconds → Seconds → Minutes
```

When the maximum value of one counter is reached, it rolls over and increments the next counter.

## Block Diagram

```text
             ┌───────────────┐
Clock ──────►│               │
Reset ──────►│    Digital    │
Start/Stop ─►│   Stopwatch   │
             │               │
             └───────┬───────┘
                     │
             ┌───────┼────────┐
             ▼       ▼        ▼
          Minutes  Seconds  Milliseconds
```

## Files

- `digital_stopwatch.v` - RTL design
- `digital_stopwatch_tb.v` - Testbench
- `simulation/` - Simulation results and waveform

## Tools Used

- Verilog HDL
- ModelSim
- Vivado Simulator
- Icarus Verilog
- GTKWave (optional)

## Applications

- Digital clocks
- Timing systems
- Sports timing
- Embedded systems
- FPGA-based counters
- Time measurement systems

## Expected Result

```text
00:00:00
00:00:01
00:00:02
...
00:00:59
00:01:00
...
```

## Conclusion

The Digital Stopwatch demonstrates the use of counters, sequential logic, clock-driven timing, reset control, and start/stop functionality using Verilog HDL.