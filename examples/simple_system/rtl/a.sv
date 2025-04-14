// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Simple Ibex instantiation with separate instruction and data memory interfaces.

module ibex_simple_system
  import ibex_pkg::*;
(
  input  logic        clk_i,
  input  logic        rst_ni,
  input  logic        test_en_i,

  input  logic        irq_software_i,
  input  logic        irq_timer_i,
  input  logic        irq_external_i,

  // RVFI tracing ports
  output logic [31:0] rvfi_insn_o,
  output logic        rvfi_valid_o,
  output logic [63:0] rvfi_order_o,
  output logic        rvfi_trap_o,
  output logic        rvfi_halt_o,
  output logic        rvfi_intr_o,
  output logic [1:0]  rvfi_mode_o,
  output logic [1:0]  rvfi_ixl_o,
  output logic [4:0]  rvfi_rs1_addr_o,
  output logic [4:0]  rvfi_rs2_addr_o,
  output logic [4:0]  rvfi_rd_addr_o,
  output logic [31:0] rvfi_rs1_rdata_o,
  output logic [31:0] rvfi_rs2_rdata_o,
  output logic [31:0] rvfi_rd_wdata_o,
  output logic [31:0] rvfi_pc_rdata_o,
  output logic [31:0] rvfi_pc_wdata_o,
  output logic [31:0] rvfi_mem_addr_o,
  output logic [3:0]  rvfi_mem_rmask_o,
  output logic [3:0]  rvfi_mem_wmask_o,
  output logic [31:0] rvfi_mem_rdata_o,
  output logic [31:0] rvfi_mem_wdata_o,

  output logic        instr_req_o,
  input  logic        instr_gnt_i,
  input  logic        instr_rvalid_i,
  output logic [31:0] instr_addr_o,
  input  logic [31:0] instr_rdata_i,

  output logic        data_req_o,
  input  logic        data_gnt_i,
  input  logic        data_rvalid_i,
  output logic        data_we_o,
  output logic [3:0]  data_be_o,
  output logic [31:0] data_addr_o,
  output logic [31:0] data_wdata_o,
  input  logic [31:0] data_rdata_i
);

  ibex_top_tracing #(
    .DmHaltAddr       (32'h1A110800),
    .DmExceptionAddr  (32'h1A110808),
    .RVFI             (1'b1)  // enable RVFI tracing
  ) u_ibex_top (
    .clk_i              (clk_i),
    .rst_ni             (rst_ni),
    .test_en_i          (test_en_i),

    .hart_id_i          (32'h00000000),
    .boot_addr_i        (32'h00000000),

    .instr_req_o        (instr_req_o),
    .instr_gnt_i        (instr_gnt_i),
    .instr_rvalid_i     (instr_rvalid_i),
    .instr_addr_o       (instr_addr_o),
    .instr_rdata_i      (instr_rdata_i),

    .data_req_o         (data_req_o),
    .data_gnt_i         (data_gnt_i),
    .data_rvalid_i      (data_rvalid_i),
    .data_we_o          (data_we_o),
    .data_be_o          (data_be_o),
    .data_addr_o        (data_addr_o),
    .data_wdata_o       (data_wdata_o),
    .data_rdata_i       (data_rdata_i),

    .irq_software_i     (irq_software_i),
    .irq_timer_i        (irq_timer_i),
    .irq_external_i     (irq_external_i),
    .irq_fast_i         (15'b0),
    .irq_nm_i           (1'b0),

    .debug_req_i        (1'b0),

    // RVFI connections
    .rvfi_valid_o       (rvfi_valid_o),
    .rvfi_order_o       (rvfi_order_o),
    .rvfi_insn_o        (rvfi_insn_o),
    .rvfi_trap_o        (rvfi_trap_o),
    .rvfi_halt_o        (rvfi_halt_o),
    .rvfi_intr_o        (rvfi_intr_o),
    .rvfi_mode_o        (rvfi_mode_o),
    .rvfi_ixl_o         (rvfi_ixl_o),
    .rvfi_rs1_addr_o    (rvfi_rs1_addr_o),
    .rvfi_rs2_addr_o    (rvfi_rs2_addr_o),
    .rvfi_rd_addr_o     (rvfi_rd_addr_o),
    .rvfi_rs1_rdata_o   (rvfi_rs1_rdata_o),
    .rvfi_rs2_rdata_o   (rvfi_rs2_rdata_o),
    .rvfi_rd_wdata_o    (rvfi_rd_wdata_o),
    .rvfi_pc_rdata_o    (rvfi_pc_rdata_o),
    .rvfi_pc_wdata_o    (rvfi_pc_wdata_o),
    .rvfi_mem_addr_o    (rvfi_mem_addr_o),
    .rvfi_mem_rmask_o   (rvfi_mem_rmask_o),
    .rvfi_mem_wmask_o   (rvfi_mem_wmask_o),
    .rvfi_mem_rdata_o   (rvfi_mem_rdata_o),
    .rvfi_mem_wdata_o   (rvfi_mem_wdata_o)
  );

endmodule
