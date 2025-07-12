# PyUVM + Spike Cosimulation Implementation Guide

This guide provides specific technical details for implementing PyUVM testbench wrappers around Spike source code for Ibex cosimulation.

## Core Architecture

```
PyUVM Testbench
    ↓
Python Spike Wrapper (You implement this)
    ↓
C++ SpikeCosim Class (ibex/dv/cosim/spike_cosim.cc)
    ↓
Spike ISA Simulator (lowRISC fork)
```

## Key Files to Study

### 1. Cosimulation Interface (`dv/cosim/cosim.h`)

This abstract base class defines the essential interface you need to implement or wrap:

```cpp
class Cosim {
public:
    // Memory management
    virtual void add_memory(uint32_t base_addr, size_t size) = 0;
    virtual bool backdoor_write_mem(uint32_t addr, size_t len, const uint8_t *data_in) = 0;
    virtual bool backdoor_read_mem(uint32_t addr, size_t len, uint8_t *data_out) = 0;
    
    // Instruction execution checking
    virtual bool step(uint32_t write_reg, uint32_t write_reg_data, uint32_t pc,
                      bool sync_trap, bool suppress_reg_write) = 0;
    
    // Architectural state synchronization
    virtual void set_mip(uint32_t pre_mip, uint32_t post_mip) = 0;
    virtual void set_mcycle(uint64_t mcycle) = 0;
    virtual void set_csr(const int csr_num, const uint32_t new_val) = 0;
    
    // Memory access verification
    virtual void notify_dside_access(const DSideAccessInfo &access_info) = 0;
    virtual void set_iside_error(uint32_t addr) = 0;
    
    // Error handling
    virtual const std::vector<std::string> &get_errors() = 0;
    virtual unsigned int get_insn_cnt() = 0;
};
```

### 2. Spike Implementation (`dv/cosim/spike_cosim.h/.cc`)

The `SpikeCosim` class implements this interface. Key constructor parameters:

```cpp
SpikeCosim(const std::string &isa_string,      // e.g., "rv32imc"
           uint32_t start_pc,                   // Initial PC value
           uint32_t start_mtvec,                // Initial mtvec CSR
           const std::string &trace_log_path,   // Spike trace output
           bool secure_ibex,                    // Security features
           bool icache_en,                      // ICache enabled
           uint32_t pmp_num_regions,            // PMP regions
           uint32_t pmp_granularity,            // PMP granularity
           uint32_t mhpm_counter_num,           // Performance counters
           uint32_t dm_start_addr,              // Debug module start
           uint32_t dm_end_addr);               // Debug module end
```

### 3. DPI Integration Example (`dv/cosim/cosim_dpi.cc`)

Shows how to create a C interface for SystemVerilog DPI calls:

```cpp
extern "C" {
    void spike_cosim_set_mip(uint32_t pre_mip, uint32_t post_mip);
    void spike_cosim_step(uint32_t write_reg, uint32_t write_reg_data, 
                          uint32_t pc, uint8_t sync_trap);
    // ... other DPI functions
}
```

## Implementation Approaches

### Approach 1: Python ctypes Wrapper

Create a Python wrapper using ctypes to call C++ functions:

```python
import ctypes
from ctypes import c_uint32, c_bool, c_char_p, POINTER

class SpikeWrapper:
    def __init__(self, lib_path):
        self.lib = ctypes.CDLL(lib_path)
        self._setup_function_signatures()
        self.cosim_ptr = self.lib.create_spike_cosim(...)
    
    def _setup_function_signatures(self):
        # Define function signatures
        self.lib.spike_step.argtypes = [ctypes.c_void_p, c_uint32, c_uint32, c_uint32, c_bool, c_bool]
        self.lib.spike_step.restype = c_bool
        # ... other functions
    
    def step(self, write_reg, write_reg_data, pc, sync_trap, suppress_reg_write):
        return self.lib.spike_step(self.cosim_ptr, write_reg, write_reg_data, 
                                   pc, sync_trap, suppress_reg_write)
```

### Approach 2: Pybind11 Wrapper

Create a more elegant Python binding using pybind11:

```cpp
// spike_python_wrapper.cpp
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include "spike_cosim.h"

namespace py = pybind11;

PYBIND11_MODULE(spike_cosim_py, m) {
    py::class_<DSideAccessInfo>(m, "DSideAccessInfo")
        .def_readwrite("store", &DSideAccessInfo::store)
        .def_readwrite("data", &DSideAccessInfo::data)
        .def_readwrite("addr", &DSideAccessInfo::addr)
        .def_readwrite("be", &DSideAccessInfo::be)
        .def_readwrite("error", &DSideAccessInfo::error);
    
    py::class_<SpikeCosim>(m, "SpikeCosim")
        .def(py::init<const std::string&, uint32_t, uint32_t, const std::string&, 
                      bool, bool, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>())
        .def("add_memory", &SpikeCosim::add_memory)
        .def("step", &SpikeCosim::step)
        .def("set_mip", &SpikeCosim::set_mip)
        .def("notify_dside_access", &SpikeCosim::notify_dside_access)
        .def("get_errors", &SpikeCosim::get_errors)
        .def("get_insn_cnt", &SpikeCosim::get_insn_cnt);
}
```

### Approach 3: SWIG Interface

Use SWIG to generate Python bindings:

```swig
// spike_cosim.i
%module spike_cosim
%{
#include "spike_cosim.h"
%}

%include "stdint.i"
%include "std_string.i"
%include "std_vector.i"

%template(StringVector) std::vector<std::string>;

%include "spike_cosim.h"
```

## PyUVM Integration Pattern

Here's how to integrate the Spike wrapper into your PyUVM testbench:

```python
import pyuvm
from spike_cosim_py import SpikeCosim, DSideAccessInfo

class SpikeScoreboard(pyuvm.uvm_scoreboard):
    def __init__(self, name, parent):
        super().__init__(name, parent)
        self.spike = SpikeCosim(
            isa_string="rv32imc",
            start_pc=0x80000000,
            start_mtvec=0x80000100,
            trace_log_path="spike_trace.log",
            secure_ibex=False,
            icache_en=True,
            pmp_num_regions=4,
            pmp_granularity=0,
            mhpm_counter_num=8,
            dm_start_addr=0x1a110000,
            dm_end_addr=0x1a117fff
        )
        
        # Add system memory
        self.spike.add_memory(0x80000000, 0x40000)  # 256KB main memory
        
    async def run_phase(self, phase):
        await super().run_phase(phase)
        # Monitor transactions and compare with Spike
        
    def check_instruction_retire(self, write_reg, write_reg_data, pc, sync_trap):
        """Called when Ibex retires an instruction"""
        success = self.spike.step(write_reg, write_reg_data, pc, sync_trap, False)
        if not success:
            errors = self.spike.get_errors()
            self.logger.error(f"Spike mismatch: {errors}")
            
    def check_memory_access(self, addr, data, be, is_store, error):
        """Called when Ibex performs memory access"""
        access_info = DSideAccessInfo()
        access_info.store = is_store
        access_info.addr = addr
        access_info.data = data
        access_info.be = be
        access_info.error = error
        
        self.spike.notify_dside_access(access_info)

class IbexSpikeMonitor(pyuvm.uvm_monitor):
    def __init__(self, name, parent, spike_scoreboard):
        super().__init__(name, parent)
        self.spike_sb = spike_scoreboard
        
    async def run_phase(self, phase):
        while True:
            # Wait for instruction retirement
            await self.wait_for_signal("instr_retire")
            
            # Extract retirement information
            write_reg = self.get_signal_value("rf_waddr_wb_o")
            write_reg_data = self.get_signal_value("rf_wdata_wb_o")
            pc = self.get_signal_value("pc_wb_o")
            sync_trap = self.get_signal_value("exception_o")
            
            # Check against Spike
            self.spike_sb.check_instruction_retire(write_reg, write_reg_data, pc, sync_trap)
```

## Memory Synchronization Strategy

Keep Ibex and Spike memory synchronized:

```python
class MemorySynchronizer:
    def __init__(self, spike_wrapper):
        self.spike = spike_wrapper
        
    def load_program(self, elf_file, base_addr):
        """Load ELF file into both Ibex and Spike memory"""
        # Parse ELF and extract segments
        segments = self.parse_elf(elf_file)
        
        for segment in segments:
            # Write to Spike memory
            self.spike.backdoor_write_mem(
                segment.addr, 
                len(segment.data), 
                segment.data
            )
            
            # Also write to Ibex memory via testbench
            self.write_ibex_memory(segment.addr, segment.data)
            
    def sync_memory_write(self, addr, data):
        """Synchronize memory write to Spike"""
        self.spike.backdoor_write_mem(addr, len(data), data)
```

## CSR Synchronization

Keep Control and Status Registers synchronized:

```python
class CSRSynchronizer:
    def __init__(self, spike_wrapper):
        self.spike = spike_wrapper
        
    def sync_csr_write(self, csr_addr, value):
        """Synchronize CSR write to Spike"""
        self.spike.set_csr(csr_addr, value)
        
    def sync_mcycle(self, cycle_count):
        """Synchronize cycle counter"""
        self.spike.set_mcycle(cycle_count)
        
    def sync_interrupts(self, mip_pre, mip_post):
        """Synchronize interrupt state"""
        self.spike.set_mip(mip_pre, mip_post)
```

## Build System Integration

Modify your build system to compile and link Spike:

```makefile
# Makefile additions for Spike integration
SPIKE_ROOT = /path/to/spike/install
PKG_CONFIG_PATH += $(SPIKE_ROOT)/lib/pkgconfig

SPIKE_CFLAGS = $(shell pkg-config --cflags riscv-riscv)
SPIKE_LIBS = $(shell pkg-config --libs riscv-riscv)

# For pybind11 wrapper
spike_cosim_py.so: spike_python_wrapper.cpp
	$(CXX) -O3 -Wall -shared -std=c++11 -fPIC \
		$(SPIKE_CFLAGS) \
		`python3 -m pybind11 --includes` \
		spike_python_wrapper.cpp \
		$(SPIKE_LIBS) \
		-o spike_cosim_py`python3-config --extension-suffix`
```

## Error Handling and Debugging

Implement robust error handling:

```python
class SpikeErrorHandler:
    def __init__(self, spike_wrapper):
        self.spike = spike_wrapper
        
    def check_and_report_errors(self):
        errors = self.spike.get_errors()
        if errors:
            for error in errors:
                self.logger.error(f"Spike cosimulation error: {error}")
            self.spike.clear_errors()
            return False
        return True
        
    def get_simulation_stats(self):
        return {
            'instructions_executed': self.spike.get_insn_cnt(),
            'errors': self.spike.get_errors()
        }
```

This implementation guide provides the technical foundation for creating Python wrappers around the existing Spike cosimulation infrastructure in the Ibex repository.