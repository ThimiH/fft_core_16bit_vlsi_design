# FFT Core 16-bit VLSI Design

VLSI design and full digital implementation of a 16-bit, 16-point Fast Fourier Transform (FFT) core using industry-standard Synopsys tools.

## Project Overview

This project implements a complete digital VLSI design flow for a 16-point FFT processor with 16-bit data width. The design uses a radix-2 decimation-in-time (DIT) FFT algorithm with butterfly computation units and includes comprehensive verification through multiple design stages.

## Design Specifications

- **FFT Points**: 16-point
- **Data Width**: 16-bit (real and imaginary components)
- **Algorithm**: Radix-2 Decimation-in-Time (DIT)
- **Technology**: Sky130 PDK (sky130_fd_sc_hd)
- **Operating Conditions**: Typical-Typical, 25°C, 1.8V

## Architecture

### Top-Level Module (`fft_top`)
- **Input Ports**: 
  - `clk`: System clock
  - `reset`: Asynchronous reset
  - `in_real[15:0]`: Real input data
  - `in_imag[15:0]`: Imaginary input data
  - `in_stall`: Input stall signal
- **Output Ports**:
  - `out_real_F[15:0]`: Real output data
  - `out_imag_F[15:0]`: Imaginary output data
  - `out_push_F`: Output valid signal

### Key Components

1. **FFT Control State Machine (`fft_ctrl_sm`)**
   - Manages FFT computation stages
   - Controls memory addressing and data flow
   - Handles butterfly computation scheduling

2. **Butterfly Unit (`butterfly`)**
   - Performs complex multiplication and addition
   - Implements radix-2 butterfly operations
   - Supports pipelined computation

3. **Memory System (`mem_32x16`)**
   - 32x16 dual-port memory for data storage
   - Supports simultaneous read/write operations

4. **Address Generation Units**
   - `read_addr_lut`: Read address lookup table
   - Generates bit-reversed and sequential addresses

5. **Twiddle Factor LUT (`w_lut`)**
   - Stores precomputed twiddle factors
   - Supports all FFT stages

## Directory Structure

```
fft_core_16bit_vlsi_design/
├── README.md                    # This file
├── LICENSE                      # Project license
├── .gitignore                   # Git ignore rules
├── constraints/                 # Timing and design constraints
│   └── fft_top.sdc             # Synopsys Design Constraints
├── rtl/                         # RTL source files
│   ├── fft_top.v               # Top-level FFT module
│   └── modules/                # Sub-modules
│       ├── butterfly.v         # Butterfly computation unit
│       ├── fft_ctrl_sm.v       # FFT control state machine
│       ├── mem_32x16.v         # Dual-port memory
│       ├── read_addr_lut.v     # Address generation LUT
│       └── w_lut.v             # Twiddle factor LUT
├── tb/                          # Testbenches
│   └── fft_top_tb.v            # Top-level testbench
├── libs/                        # Technology libraries
│   └── sky130_fd_sc_hd/        # Sky130 standard cell library
├── netlists/                    # Generated netlists and constraints
│   ├── fft_netlist.v           # Synthesized netlist
│   ├── fft.sdf                 # Standard Delay Format file
│   ├── fft_constraints.sdc     # Post-synthesis constraints
│   └── fft_top.ddc             # Design database
├── dc/                          # Design Compiler flow
│   ├── scripts/
│   │   └── compile.tcl         # Synthesis script
│   ├── reports/                # Synthesis reports
│   ├── command.log             # DC command log
│   └── alib-52/                # Compiled libraries
├── icc2/                        # IC Compiler II (P&R)
│   ├── scripts/                # P&R scripts
│   ├── outputs/                # Layout outputs
│   ├── fft_top_lib/            # Design library
│   └── *.svf                   # Setup verification files
├── pt/                          # PrimeTime (STA)
│   └── scripts/
│       └── pt_script.tcl       # Static timing analysis script
├── formality/                   # Formality (LEC)
│   ├── scripts/
│   │   └── formality_verify.tcl # Logic equivalence checking
│   └── reports/                # Verification reports
│       ├── formality_status.rpt
│       ├── formality_matched_points.rpt
│       ├── formality_passing_points.rpt
│       └── formality_setup_status.rpt
├── vcs/                         # VCS simulation
│   └── output/                 # Simulation outputs
├── pp/                          # Post-processing utilities
└── misc/                        # Miscellaneous files
```

## Design Flow

### 1. RTL Design and Verification
- RTL implementation in Verilog
- Functional verification using VCS simulator
- Testbench validation with comprehensive test vectors

### 2. Logic Synthesis (Design Compiler)
```bash
cd dc/scripts
dc_shell -f compile.tcl
```
- Technology mapping to Sky130 standard cells
- Timing optimization and constraint checking
- Power and area optimization

### 3. Logic Equivalence Checking (Formality)
```bash
cd formality/scripts
fm_shell -f formality_verify.tcl
```
- Verification of RTL vs. netlist equivalence
- Comprehensive point matching analysis

### 4. Static Timing Analysis (PrimeTime)
```bash
cd pt/scripts
pt_shell -f pt_script.tcl
```
- Setup and hold timing verification
- Clock analysis and path reporting
- Slack analysis and timing violations

### 5. Place and Route (IC Compiler II)
- Physical design implementation
- Clock tree synthesis
- Routing and DRC/LVS checking

## Key Features

- **Pipelined Architecture**: Multi-stage pipeline for high throughput
- **Memory Efficient**: Optimized memory usage with dual-port RAM
- **Scalable Design**: Modular architecture for easy modifications
- **Industry Standards**: Follows standard VLSI design methodologies

## Verification Results

### Formality Results
- **Status**: PASS ✅
- **Matched Points**: 3000+ verification points
- **Passing Points**: All critical paths verified
- **Equivalence**: RTL and netlist are functionally equivalent

### Timing Analysis
- **Setup Time**: Meeting all timing constraints
- **Hold Time**: No violations detected
- **Clock Frequency**: Target frequency achieved
- **Critical Paths**: Optimized for performance

## Technology Details

- **Process Node**: Sky130 (130nm)
- **Standard Cells**: sky130_fd_sc_hd
- **Operating Voltage**: 1.8V
- **Temperature**: 25°C (typical)
- **Process Corner**: Typical-Typical (TT)

## Usage

### Running Simulation
```bash
cd vcs
vcs -full64 +acc +vpi -sverilog -debug_access+all \
    ../rtl/fft_top.v ../rtl/modules/*.v ../tb/fft_top_tb.v
./simv
```

### Synthesis
```bash
cd dc/scripts
dc_shell -f compile.tcl
```

### Verification
```bash
cd formality/scripts
fm_shell -f formality_verify.tcl
```

## Reports and Analysis

Key reports generated during the design flow:

- **Synthesis Reports**: Timing, area, power analysis
- **Verification Reports**: Logic equivalence checking results
- **STA Reports**: Setup/hold analysis, clock reports
- **Physical Reports**: Placement, routing, and DRC results

## Future Enhancements

- Support for larger FFT sizes (32, 64, 128 points)
- Floating-point arithmetic implementation
- Power optimization techniques
- Advanced pipelining strategies

## Tools and Versions

- **Synopsys Design Compiler**: Latest version
- **Synopsys IC Compiler II**: Latest version
- **Synopsys PrimeTime**: Latest version
- **Synopsys Formality**: Latest version
- **Synopsys VCS**: T-2022.06-SP2-8

## License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

## Author

FFT Core 16-bit VLSI Design Project

## Acknowledgments

- Sky130 PDK development team
- Synopsys tool documentation and support
- Open-source VLSI community contributions
