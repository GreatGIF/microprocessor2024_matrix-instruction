// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vadam_riscv_H_
#define _Vadam_riscv_H_

#include "verilated_heavy.h"
#include "verilated_cov.h"

class Vadam_riscv__Syms;
class VerilatedVcd;

//----------

VL_MODULE(Vadam_riscv) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG8(adam_riscv__DOT__br_ctrl,0,0);
    VL_SIG8(adam_riscv__DOT__stall,0,0);
    VL_SIG8(adam_riscv__DOT__w_select,1,0);
    VL_SIG8(adam_riscv__DOT__w_regs_addr,4,0);
    VL_SIG8(adam_riscv__DOT__id_br,0,0);
    VL_SIG8(adam_riscv__DOT__id_mem_read,0,0);
    VL_SIG8(adam_riscv__DOT__id_mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT__id_alu_op,2,0);
    VL_SIG8(adam_riscv__DOT__id_mem_write,0,0);
    VL_SIG8(adam_riscv__DOT__id_alu_src1,1,0);
    VL_SIG8(adam_riscv__DOT__id_alu_src2,1,0);
    VL_SIG8(adam_riscv__DOT__id_br_addr_mode,0,0);
    VL_SIG8(adam_riscv__DOT__id_w_select,1,0);
    VL_SIG8(adam_riscv__DOT__id_rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT__ex_rs1,4,0);
    VL_SIG8(adam_riscv__DOT__ex_rs2,4,0);
    VL_SIG8(adam_riscv__DOT__ex_func3_code,2,0);
    VL_SIG8(adam_riscv__DOT__ex_func7_code,0,0);
    VL_SIG8(adam_riscv__DOT__ex_rd,4,0);
    VL_SIG8(adam_riscv__DOT__ex_br,0,0);
    VL_SIG8(adam_riscv__DOT__ex_mem_read,0,0);
    VL_SIG8(adam_riscv__DOT__ex_mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT__ex_alu_op,2,0);
    VL_SIG8(adam_riscv__DOT__ex_mem_write,0,0);
    VL_SIG8(adam_riscv__DOT__ex_alu_src1,1,0);
    VL_SIG8(adam_riscv__DOT__ex_alu_src2,1,0);
    VL_SIG8(adam_riscv__DOT__ex_br_addr_mode,0,0);
    VL_SIG8(adam_riscv__DOT__ex_w_select,1,0);
    VL_SIG8(adam_riscv__DOT__ex_rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT__forwardA,1,0);
    VL_SIG8(adam_riscv__DOT__forwardB,1,0);
    VL_SIG8(adam_riscv__DOT__forwardM,1,0);
    VL_SIG8(adam_riscv__DOT__me_rs2,4,0);
    VL_SIG8(adam_riscv__DOT__me_rd,4,0);
    VL_SIG8(adam_riscv__DOT__me_mem_read,0,0);
    VL_SIG8(adam_riscv__DOT__me_mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT__me_mem_write,0,0);
    VL_SIG8(adam_riscv__DOT__me_w_select,1,0);
    VL_SIG8(adam_riscv__DOT__me_rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT__me_func3_code,2,0);
    VL_SIG8(adam_riscv__DOT__wb_rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT__wb_mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__br,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__mem_read,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__alu_op,2,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__mem_write,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__alu_src1,1,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__alu_src2,1,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__w_select_o,1,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__wb_hazard_a,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__wb_hazard_b,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_ex__DOT__alu_ctrl,3,0);
    VL_SIG8(adam_riscv__DOT__u_stage_ex__DOT__br_mark,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT__ex_hazard_a,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT__ex_hazard_b,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT__ex_hazard_m,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT__mem_hazard_a,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT__mem_hazard_b,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT__mem_hazard_m,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT__hazard_data_w,0,0);
    VL_SIG(adam_riscv__DOT__br_addr,31,0);
    VL_SIG(adam_riscv__DOT__if_pc,31,0);
    VL_SIG(adam_riscv__DOT__if_inst,31,0);
    VL_SIG(adam_riscv__DOT__id_inst,31,0);
    VL_SIG(adam_riscv__DOT__id_pc,31,0);
    VL_SIG(adam_riscv__DOT__w_regs_data,31,0);
    VL_SIG(adam_riscv__DOT__id_regs_data1,31,0);
    VL_SIG(adam_riscv__DOT__id_regs_data2,31,0);
    VL_SIGW(adam_riscv__DOT__id_matrix_data,127,0,4);
    VL_SIG(adam_riscv__DOT__id_imm,31,0);
    VL_SIG(adam_riscv__DOT__ex_pc,31,0);
    VL_SIG(adam_riscv__DOT__ex_regs_data1,31,0);
    VL_SIG(adam_riscv__DOT__ex_regs_data2,31,0);
    VL_SIG(adam_riscv__DOT__ex_regs_data2_st,31,0);
    VL_SIGW(adam_riscv__DOT__ex_matrix_data,127,0,4);
    VL_SIG(adam_riscv__DOT__ex_imm,31,0);
    VL_SIG(adam_riscv__DOT__ex_alu_o,31,0);
    VL_SIGW(adam_riscv__DOT__ex_matrix_o,127,0,4);
    VL_SIG(adam_riscv__DOT__me_regs_data2,31,0);
    VL_SIG(adam_riscv__DOT__me_alu_o,31,0);
    VL_SIGW(adam_riscv__DOT__me_matrix_o,127,0,4);
    VL_SIG(adam_riscv__DOT__me_mem_data,31,0);
    VL_SIG(adam_riscv__DOT__wb_mem_data,31,0);
    VL_SIG(adam_riscv__DOT__wb_alu_o,31,0);
    VL_SIGW(adam_riscv__DOT__wb_matrix_o,127,0,4);
    VL_SIG(adam_riscv__DOT__u_stage_if__DOT__u_pc__DOT__pc_next,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT__op_A,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT__op_A_pre,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT__op_B,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT__op_B_pre,31,0);
    VL_SIGW(adam_riscv__DOT__u_stage_ex__DOT__op_M,127,0,4);
    VL_SIGW(adam_riscv__DOT__u_stage_ex__DOT__op_M_pre,127,0,4);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT__br_addr_op_A,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT__u_alu__DOT__unnamedblk1__DOT__i,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT__u_alu__DOT__unnamedblk1__DOT__j,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_mem__DOT__w_data_mem,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_mem__DOT__r_data_mem,31,0);
    VL_SIG8(adam_riscv__DOT__u_stage_if__DOT__inst_memory__DOT__inst[1024],7,0);
    VL_SIG(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[32],31,0);
    VL_SIG(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__matrix_file[4],31,0);
    VL_SIG(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__w_matrix[4],31,0);
    VL_SIG8(adam_riscv__DOT__u_stage_mem__DOT__u_data_memory__DOT__data[1024],7,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    VL_SIG8(adam_riscv__DOT____Vtogcov__clk,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__rst,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__br_ctrl,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__stall,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__w_select,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__w_regs_addr,4,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_func7_code,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_br,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_mem_read,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_alu_op,2,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_mem_write,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_alu_src1,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_alu_src2,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_br_addr_mode,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_w_select,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__id_rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_rs1,4,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_rs2,4,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_func3_code,2,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_func7_code,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_rd,4,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_br,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_mem_read,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_alu_op,2,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_mem_write,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_alu_src1,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_alu_src2,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_br_addr_mode,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_w_select,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__ex_rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__forwardA,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__forwardB,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__forwardM,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__me_rs2,4,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__me_rd,4,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__me_mem_read,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__me_mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__me_mem_write,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__me_w_select,1,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__me_rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__me_func3_code,2,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__forward_data,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__wb_rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT____Vtogcov__wb_mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__br,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__mem_read,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__mem2reg,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__alu_op,2,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__mem_write,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__alu_src1,1,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__alu_src2,1,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__br_addr_mode,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__rs2_r_select,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT____Vtogcov__w_select_o,1,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT____Vtogcov__wb_hazard_a,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT____Vtogcov__wb_hazard_b,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT____Vtogcov__wb_hazard_m,0,0);
    VL_SIG8(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__alu_ctrl,3,0);
    VL_SIG8(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__br_mark,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT____Vtogcov__ex_hazard_a,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT____Vtogcov__ex_hazard_b,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT____Vtogcov__ex_hazard_m,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT____Vtogcov__mem_hazard_a,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT____Vtogcov__mem_hazard_b,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT____Vtogcov__mem_hazard_m,0,0);
    VL_SIG8(adam_riscv__DOT__u_forwarding__DOT____Vtogcov__hazard_data_w,0,0);
    VL_SIG8(__Vclklast__TOP__clk,0,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__br_addr,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__if_pc,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__if_inst,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__id_inst,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__id_pc,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__w_regs_data,31,0);
    VL_SIGW(adam_riscv__DOT____Vtogcov__w_matrix_data,127,0,4);
    VL_SIG(adam_riscv__DOT____Vtogcov__id_regs_data1,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__id_regs_data2,31,0);
    VL_SIGW(adam_riscv__DOT____Vtogcov__id_matrix_data,127,0,4);
    VL_SIG(adam_riscv__DOT____Vtogcov__id_imm,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__ex_pc,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__ex_regs_data1,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__ex_regs_data2,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__ex_regs_data2_st,31,0);
    VL_SIGW(adam_riscv__DOT____Vtogcov__ex_matrix_data,127,0,4);
    VL_SIG(adam_riscv__DOT____Vtogcov__ex_imm,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__ex_alu_o,31,0);
    VL_SIGW(adam_riscv__DOT____Vtogcov__ex_matrix_o,127,0,4);
    VL_SIG(adam_riscv__DOT____Vtogcov__me_regs_data2,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__me_alu_o,31,0);
    VL_SIGW(adam_riscv__DOT____Vtogcov__me_matrix_o,127,0,4);
    VL_SIG(adam_riscv__DOT____Vtogcov__me_mem_data,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__wb_mem_data,31,0);
    VL_SIG(adam_riscv__DOT____Vtogcov__wb_alu_o,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_if__DOT__u_pc__DOT____Vtogcov__pc_next,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__op_A,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__op_A_pre,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__op_B,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__op_B_pre,31,0);
    VL_SIGW(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__op_M,127,0,4);
    VL_SIGW(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__op_M_pre,127,0,4);
    VL_SIG(adam_riscv__DOT__u_stage_ex__DOT____Vtogcov__br_addr_op_A,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_mem__DOT____Vtogcov__w_data_mem,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_mem__DOT____Vtogcov__r_data_mem,31,0);
    VL_SIG(__Vm_traceActivity,31,0);
    VL_SIG(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT____Vtogcov__matrix_file[4],31,0);
    VL_SIG(adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT____Vtogcov__w_matrix[4],31,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vadam_riscv__Syms* __VlSymsp;  // Symbol table
  private:
    // Coverage
    void __vlCoverInsert(uint32_t* countp, bool enable, const char* filenamep, int lineno, int column,
	const char* hierp, const char* pagep, const char* commentp);
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
  public:
    
    // CONSTRUCTORS
  private:
    Vadam_riscv& operator= (const Vadam_riscv&);  ///< Copying not allowed
    Vadam_riscv(const Vadam_riscv&);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    Vadam_riscv(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vadam_riscv();
    /// Trace signals in the model; called by application code
    void trace (VerilatedVcdC* tfp, int levels, int options=0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vadam_riscv__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vadam_riscv__Syms* symsp, bool first);
  private:
    static QData _change_request(Vadam_riscv__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__3(Vadam_riscv__Syms* __restrict vlSymsp);
  private:
    void _configure_coverage(Vadam_riscv__Syms* __restrict vlSymsp, bool first);
    void _ctor_var_reset();
  public:
    static void _eval(Vadam_riscv__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(Vadam_riscv__Syms* __restrict vlSymsp);
    static void _eval_settle(Vadam_riscv__Syms* __restrict vlSymsp);
    static void _initial__TOP__2(Vadam_riscv__Syms* __restrict vlSymsp);
    static void _sequent__TOP__4(Vadam_riscv__Syms* __restrict vlSymsp);
    static void _settle__TOP__1(Vadam_riscv__Syms* __restrict vlSymsp);
    static void _settle__TOP__5(Vadam_riscv__Syms* __restrict vlSymsp);
    static void traceChgThis(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__4(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis__1(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInitThis(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInitThis__1(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInit (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg  (VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(128);

#endif // guard
