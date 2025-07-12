# Ibex DV Directory Structure Guide

This document explains what each directory in the `ibex/dv` directory means and identifies which components are most relevant for PyUVM testbenches performing cosimulation between Ibex and Spike.

## Directory Overview

### 1. `cosim/` - **🎯 HIGHLY RELEVANT for PyUVM + Spike Cosimulation**

This directory contains the core cosimulation infrastructure for running Spike alongside Ibex RTL.

**Key Files:**
- `cosim.h` - Abstract base class defining the cosimulation interface
- `spike_cosim.h/.cc` - Concrete implementation for Spike cosimulation
- `cosim_dpi.h/.cc/.svh` - DPI (Direct Programming Interface) wrapper for SystemVerilog

**What it provides:**
- Memory management interface (`add_memory`, `backdoor_write_mem`, `backdoor_read_mem`)
- Instruction stepping with register and PC checking (`step()`)
- Interrupt and exception handling (`set_mip`, `set_nmi`, `set_debug_req`)
- Memory transaction verification (`notify_dside_access`, `set_iside_error`)
- CSR synchronization (`set_csr`, `set_mcycle`)

**Relevance for PyUVM:**
This is the **core infrastructure** you'll use. The `cosim.h` interface defines exactly what your PyUVM testbench needs to communicate with Spike. You can either:
1. Use the existing DPI wrapper (`cosim_dpi.*`) to interface with Python
2. Create Python bindings for the `SpikeCosim` class directly
3. Study the interface to understand what data needs to be exchanged between Ibex and Spike

### 2. `uvm/` - **🎯 HIGHLY RELEVANT for PyUVM Reference**

Contains UVM-based verification environments that already implement cosimulation.

**Subdirectories:**
- `core_ibex/` - Complete UVM testbench for Ibex core with Spike cosimulation
- `icache/` - ICache-specific UVM verification
- `bus_params_pkg/` - Bus parameter packages

**Key Files in `core_ibex/`:**
- `README.md` - Setup instructions for UVM + Spike cosimulation
- `env/` - UVM environment components
- `scripts/` - Python scripts for test management
- `tb/` - Testbench top-level files

**Relevance for PyUVM:**
- **Reference implementation**: Shows how UVM testbenches integrate with Spike cosimulation
- **Build scripts**: Demonstrates how to compile and link Spike libraries
- **Test structure**: Examples of how to structure verification tests with cosimulation
- **Environment setup**: Required tools and configurations (Xcelium, Spike, RISC-V toolchain)

### 3. `verilator/simple_system_cosim/` - **🎯 HIGHLY RELEVANT for Implementation Examples**

Contains a complete working example of Ibex + Spike cosimulation using Verilator.

**Key Files:**
- `README.md` - Complete build and run instructions
- `simple_system_cosim.cc` - C++ top-level for cosimulation
- `ibex_simple_system_cosim_checker.sv` - SystemVerilog checker module

**What it demonstrates:**
- How to build Spike with required flags (`--enable-commitlog --enable-misaligned`)
- How to link Spike libraries into a simulator
- How to run instruction-by-instruction comparison
- Memory access verification between Ibex and Spike
- Performance counter handling

**Relevance for PyUVM:**
- **Working reference**: Complete example you can run and study
- **Build process**: Shows exactly how to compile and link Spike
- **API usage**: Demonstrates how to use the cosim interface in practice

### 4. `cs_registers/` - **⚠️ MODERATELY RELEVANT for Register Testing**

A C++ testbench specifically for testing Control/Status (CS) registers in Ibex.

**Key Components:**
- `tb/` - Testbench top-level files
- `driver/` - Components to generate random register transactions
- `env/` - Signal generation and driving
- `model/` - Register state model and checking functions

**What it provides:**
- DPI-based methodology for RTL-C++ communication
- Random register transaction generation
- Register state modeling and checking

**Relevance for PyUVM:**
- **DPI methodology**: Shows another approach to RTL-software communication
- **Register testing**: Useful if you need to verify CSR behavior in your PyUVM tests
- **Testbench structure**: Example of driver/monitor/model pattern

### 5. `riscv_compliance/` - **⚠️ MODERATELY RELEVANT for Compliance Testing**

Infrastructure for running RISC-V compliance tests on Ibex.

**Key Components:**
- `ibex_riscv_compliance.cc` - C++ simulation wrapper
- `README.md` - Instructions for running compliance tests
- System memory map and test utility interface

**What it provides:**
- Complete system simulation for compliance testing
- Memory-mapped test control interface
- Test signature dumping mechanism

**Relevance for PyUVM:**
- **System architecture**: Example of how to structure a complete test system
- **Memory mapping**: Reference for system-level memory organization
- **Test utilities**: Ideas for test control and result extraction

### 6. `formal/` - **❌ NOT DIRECTLY RELEVANT for PyUVM Cosimulation**

End-to-end formal verification proving trace equivalence between Ibex and the Sail model.

**What it does:**
- Uses Cadence Jasper for formal verification
- Proves Ibex implementation matches RISC-V specification (via Sail)
- Complex formal property checking with 1000+ properties

**Why it's not directly relevant:**
- Uses formal methods, not simulation-based verification
- Targets Sail model, not Spike simulator
- Requires specialized formal verification tools (Jasper)

However, it could be **indirectly useful** for understanding:
- Ibex implementation details
- RISC-V specification compliance requirements
- Property-based verification approaches

## Quick Start Guide for PyUVM + Spike Cosimulation

Based on this directory structure, here's your recommended path:

### 1. Start with `verilator/simple_system_cosim/`
- Follow the README to build and run the working example
- Study `simple_system_cosim.cc` to understand the API usage
- Understand the build process and Spike compilation flags

### 2. Study `cosim/` interface
- Read `cosim.h` to understand the abstract interface
- Examine `spike_cosim.h/.cc` for Spike-specific implementation
- Look at `cosim_dpi.*` for DPI integration examples

### 3. Reference `uvm/core_ibex/`
- Study the UVM environment structure
- Look at how they integrate cosimulation into UVM tests
- Check their build scripts and tool requirements

### 4. Develop your PyUVM wrapper
You'll likely need to create Python bindings for the Spike cosimulation. Consider:
- Using `ctypes` or `pybind11` to wrap the C++ `SpikeCosim` class
- Creating a Python interface that matches the `cosim.h` abstract interface
- Integrating this into your PyUVM environment as a reference model

### Key Integration Points
- **Memory synchronization**: Use `backdoor_write_mem`/`backdoor_read_mem` to keep Spike memory in sync
- **Instruction stepping**: Call `step()` for each retired instruction from Ibex
- **Memory access checking**: Use `notify_dside_access()` to verify data memory transactions
- **CSR synchronization**: Use `set_csr()` and `set_mcycle()` to keep architectural state synchronized
- **Exception/interrupt handling**: Use `set_mip()`, `set_nmi()`, etc. for exception scenarios

## Required Dependencies

For PyUVM + Spike cosimulation, you'll need:
1. **Spike simulator** (lowRISC's ibex_cosim branch)
2. **RISC-V toolchain** for compiling test programs
3. **pkg-config** for library linking
4. **Python environment** with PyUVM
5. **C++ compiler** for building Spike and any wrapper code

The existing infrastructure provides excellent starting points and reference implementations for all these components.