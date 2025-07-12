# Summary: Ibex DV Directory Guide for PyUVM + Spike Cosimulation

## Quick Answer

For your PyUVM testbench doing cosimulation of Ibex and Spike, the most relevant directories in `ibex/dv/` are:

1. **`cosim/`** - Core Spike cosimulation infrastructure ⭐⭐⭐⭐⭐
2. **`uvm/core_ibex/`** - Reference UVM implementation with Spike ⭐⭐⭐⭐
3. **`verilator/simple_system_cosim/`** - Working cosimulation example ⭐⭐⭐⭐

## Directory Relevance Summary

| Directory | Relevance | Purpose | Key for PyUVM+Spike? |
|-----------|-----------|---------|----------------------|
| `cosim/` | ⭐⭐⭐⭐⭐ | Spike cosimulation API and implementation | **YES** - Core infrastructure you'll use |
| `uvm/` | ⭐⭐⭐⭐ | UVM testbench with cosimulation | **YES** - Reference implementation |
| `verilator/simple_system_cosim/` | ⭐⭐⭐⭐ | Working cosimulation example | **YES** - Complete working example |
| `cs_registers/` | ⭐⭐ | Register testing with DPI | Useful for register tests |
| `riscv_compliance/` | ⭐⭐ | Compliance testing setup | Useful for system architecture |
| `formal/` | ⭐ | Formal verification with Sail | Not directly relevant |

## Files to Study First

### 1. Core Cosimulation Interface
- `cosim/cosim.h` - Abstract interface you need to implement/wrap
- `cosim/spike_cosim.h/.cc` - Spike implementation of the interface
- `cosim/cosim_dpi.*` - DPI wrapper example

### 2. Working Examples
- `verilator/simple_system_cosim/README.md` - Complete build/run instructions
- `verilator/simple_system_cosim/simple_system_cosim.cc` - Usage example
- `uvm/core_ibex/README.md` - UVM setup with Spike

### 3. Reference Implementation
- `examples/pyuvm_spike_example.py` - PyUVM structure example (created for you)

## Key Integration Points

Your PyUVM testbench will need to:

1. **Wrap Spike API**: Create Python bindings for `SpikeCosim` class
2. **Monitor Instructions**: Detect when Ibex retires instructions
3. **Check Against Spike**: Call `spike.step()` for each retired instruction
4. **Synchronize Memory**: Keep Ibex and Spike memory in sync
5. **Handle CSRs**: Synchronize Control/Status Register writes
6. **Memory Access Checking**: Verify data memory transactions

## Next Steps

1. **Study the working example**: Build and run `simple_system_cosim`
2. **Understand the API**: Read `cosim/cosim.h` interface thoroughly
3. **Create Python bindings**: Use ctypes, pybind11, or SWIG to wrap Spike
4. **Integrate with PyUVM**: Follow the pattern in `examples/pyuvm_spike_example.py`

## Documentation Created

This exploration created three documentation files for you:

1. **`README_DV_DIRECTORIES.md`** - Comprehensive guide to all directories
2. **`PYUVM_SPIKE_INTEGRATION_GUIDE.md`** - Technical implementation details
3. **`examples/pyuvm_spike_example.py`** - Complete PyUVM structure example

These provide everything you need to understand the existing infrastructure and build your PyUVM + Spike cosimulation testbench.