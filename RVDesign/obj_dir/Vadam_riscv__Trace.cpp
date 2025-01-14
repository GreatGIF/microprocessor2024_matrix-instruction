// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vadam_riscv__Syms.h"


//======================

void Vadam_riscv::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vadam_riscv* t=(Vadam_riscv*)userthis;
    Vadam_riscv__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
	t->traceChgThis (vlSymsp, vcdp, code);
    }
}

//======================


void Vadam_riscv::traceChgThis(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vadam_riscv* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 1U))))) {
	    vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
	}
	vlTOPp->traceChgThis__4(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vadam_riscv::traceChgThis__2(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vadam_riscv* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+1,(vlTOPp->adam_riscv__DOT__br_ctrl));
	vcdp->chgBus  (c+2,(vlTOPp->adam_riscv__DOT__br_addr),32);
	vcdp->chgBit  (c+3,(vlTOPp->adam_riscv__DOT__stall));
	vcdp->chgBus  (c+4,(vlTOPp->adam_riscv__DOT__if_inst),32);
	vcdp->chgBus  (c+5,(vlTOPp->adam_riscv__DOT__w_regs_data),32);
	vcdp->chgBus  (c+6,(vlTOPp->adam_riscv__DOT__id_regs_data1),32);
	vcdp->chgBus  (c+7,(vlTOPp->adam_riscv__DOT__id_regs_data2),32);
	vcdp->chgArray(c+8,(vlTOPp->adam_riscv__DOT__id_matrix_data),128);
	vcdp->chgBus  (c+12,(vlTOPp->adam_riscv__DOT__id_imm),32);
	vcdp->chgBit  (c+13,(vlTOPp->adam_riscv__DOT__id_br));
	vcdp->chgBit  (c+14,(vlTOPp->adam_riscv__DOT__id_mem_read));
	vcdp->chgBit  (c+15,(vlTOPp->adam_riscv__DOT__id_mem2reg));
	vcdp->chgBus  (c+16,(vlTOPp->adam_riscv__DOT__id_alu_op),3);
	vcdp->chgBit  (c+17,(vlTOPp->adam_riscv__DOT__id_mem_write));
	vcdp->chgBus  (c+18,(vlTOPp->adam_riscv__DOT__id_alu_src1),2);
	vcdp->chgBus  (c+19,(vlTOPp->adam_riscv__DOT__id_alu_src2),2);
	vcdp->chgBit  (c+20,(vlTOPp->adam_riscv__DOT__id_br_addr_mode));
	vcdp->chgBus  (c+21,(vlTOPp->adam_riscv__DOT__id_w_select),2);
	vcdp->chgBit  (c+22,(vlTOPp->adam_riscv__DOT__id_rs2_r_select));
	vcdp->chgBus  (c+23,(vlTOPp->adam_riscv__DOT__ex_regs_data2_st),32);
	vcdp->chgBus  (c+24,(vlTOPp->adam_riscv__DOT__ex_alu_o),32);
	vcdp->chgArray(c+25,(vlTOPp->adam_riscv__DOT__ex_matrix_o),128);
	vcdp->chgBus  (c+29,(vlTOPp->adam_riscv__DOT__forwardA),2);
	vcdp->chgBus  (c+30,(vlTOPp->adam_riscv__DOT__forwardB),2);
	vcdp->chgBus  (c+31,(vlTOPp->adam_riscv__DOT__forwardM),2);
	vcdp->chgBus  (c+32,(vlTOPp->adam_riscv__DOT__me_mem_data),32);
	vcdp->chgBit  (c+33,((1U & ((IData)(vlTOPp->adam_riscv__DOT__u_forwarding__DOT__hazard_data_w)
				     ? 1U : 0U))));
	vcdp->chgBit  (c+34,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__br));
	vcdp->chgBit  (c+35,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__mem_read));
	vcdp->chgBit  (c+36,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__mem2reg));
	vcdp->chgBus  (c+37,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__alu_op),3);
	vcdp->chgBit  (c+38,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__mem_write));
	vcdp->chgBus  (c+39,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__alu_src1),2);
	vcdp->chgBus  (c+40,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__alu_src2),2);
	vcdp->chgBit  (c+41,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__rs2_r_select));
	vcdp->chgBus  (c+42,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__w_select_o),2);
	vcdp->chgBit  (c+43,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__wb_hazard_a));
	vcdp->chgBit  (c+44,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__wb_hazard_b));
	vcdp->chgBus  (c+45,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__w_matrix[0]),32);
	vcdp->chgBus  (c+46,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__w_matrix[1]),32);
	vcdp->chgBus  (c+47,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__w_matrix[2]),32);
	vcdp->chgBus  (c+48,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__w_matrix[3]),32);
	vcdp->chgBus  (c+49,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__alu_ctrl),4);
	vcdp->chgBus  (c+50,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__op_A),32);
	vcdp->chgBus  (c+51,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__op_A_pre),32);
	vcdp->chgBus  (c+52,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__op_B),32);
	vcdp->chgBus  (c+53,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__op_B_pre),32);
	vcdp->chgArray(c+54,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__op_M),128);
	vcdp->chgBit  (c+58,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__br_mark));
	vcdp->chgBus  (c+59,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__br_addr_op_A),32);
	vcdp->chgBus  (c+60,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__u_alu__DOT__unnamedblk1__DOT__i),32);
	vcdp->chgBus  (c+61,(vlTOPp->adam_riscv__DOT__u_stage_ex__DOT__u_alu__DOT__unnamedblk1__DOT__j),32);
	vcdp->chgBus  (c+62,(vlTOPp->adam_riscv__DOT__u_stage_mem__DOT__w_data_mem),32);
	vcdp->chgBus  (c+63,(vlTOPp->adam_riscv__DOT__u_stage_mem__DOT__r_data_mem),32);
	vcdp->chgBit  (c+64,(vlTOPp->adam_riscv__DOT__u_forwarding__DOT__ex_hazard_a));
	vcdp->chgBit  (c+65,(vlTOPp->adam_riscv__DOT__u_forwarding__DOT__ex_hazard_b));
	vcdp->chgBit  (c+66,(vlTOPp->adam_riscv__DOT__u_forwarding__DOT__ex_hazard_m));
	vcdp->chgBit  (c+67,(vlTOPp->adam_riscv__DOT__u_forwarding__DOT__mem_hazard_a));
	vcdp->chgBit  (c+68,(vlTOPp->adam_riscv__DOT__u_forwarding__DOT__mem_hazard_b));
	vcdp->chgBit  (c+69,(vlTOPp->adam_riscv__DOT__u_forwarding__DOT__mem_hazard_m));
	vcdp->chgBit  (c+70,(vlTOPp->adam_riscv__DOT__u_forwarding__DOT__hazard_data_w));
    }
}

void Vadam_riscv::traceChgThis__3(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vadam_riscv* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+71,(vlTOPp->adam_riscv__DOT__if_pc),32);
	vcdp->chgBus  (c+72,(vlTOPp->adam_riscv__DOT__id_inst),32);
	vcdp->chgBus  (c+73,(vlTOPp->adam_riscv__DOT__id_pc),32);
	vcdp->chgBus  (c+74,(vlTOPp->adam_riscv__DOT__w_select),2);
	vcdp->chgBus  (c+75,(vlTOPp->adam_riscv__DOT__w_regs_addr),5);
	vcdp->chgArray(c+76,(vlTOPp->adam_riscv__DOT__wb_matrix_o),128);
	vcdp->chgBus  (c+80,((7U & (vlTOPp->adam_riscv__DOT__id_inst 
				    >> 0xcU))),3);
	vcdp->chgBit  (c+81,((1U & (vlTOPp->adam_riscv__DOT__id_inst 
				    >> 0x1eU))));
	vcdp->chgBus  (c+82,((0x1fU & (vlTOPp->adam_riscv__DOT__id_inst 
				       >> 7U))),5);
	vcdp->chgBus  (c+83,((0x1fU & (vlTOPp->adam_riscv__DOT__id_inst 
				       >> 0xfU))),5);
	vcdp->chgBus  (c+84,((0x1fU & (vlTOPp->adam_riscv__DOT__id_inst 
				       >> 0x14U))),5);
	vcdp->chgBus  (c+85,(vlTOPp->adam_riscv__DOT__ex_rs1),5);
	vcdp->chgBus  (c+86,(vlTOPp->adam_riscv__DOT__ex_rs2),5);
	vcdp->chgBus  (c+87,(vlTOPp->adam_riscv__DOT__ex_pc),32);
	vcdp->chgBus  (c+88,(vlTOPp->adam_riscv__DOT__ex_regs_data1),32);
	vcdp->chgBus  (c+89,(vlTOPp->adam_riscv__DOT__ex_regs_data2),32);
	vcdp->chgArray(c+90,(vlTOPp->adam_riscv__DOT__ex_matrix_data),128);
	vcdp->chgBus  (c+94,(vlTOPp->adam_riscv__DOT__ex_imm),32);
	vcdp->chgBus  (c+95,(vlTOPp->adam_riscv__DOT__ex_func3_code),3);
	vcdp->chgBit  (c+96,(vlTOPp->adam_riscv__DOT__ex_func7_code));
	vcdp->chgBus  (c+97,(vlTOPp->adam_riscv__DOT__ex_rd),5);
	vcdp->chgBit  (c+98,(vlTOPp->adam_riscv__DOT__ex_br));
	vcdp->chgBit  (c+99,(vlTOPp->adam_riscv__DOT__ex_mem_read));
	vcdp->chgBit  (c+100,(vlTOPp->adam_riscv__DOT__ex_mem2reg));
	vcdp->chgBus  (c+101,(vlTOPp->adam_riscv__DOT__ex_alu_op),3);
	vcdp->chgBit  (c+102,(vlTOPp->adam_riscv__DOT__ex_mem_write));
	vcdp->chgBus  (c+103,(vlTOPp->adam_riscv__DOT__ex_alu_src1),2);
	vcdp->chgBus  (c+104,(vlTOPp->adam_riscv__DOT__ex_alu_src2),2);
	vcdp->chgBit  (c+105,(vlTOPp->adam_riscv__DOT__ex_br_addr_mode));
	vcdp->chgBus  (c+106,(vlTOPp->adam_riscv__DOT__ex_w_select),2);
	vcdp->chgBit  (c+107,(vlTOPp->adam_riscv__DOT__ex_rs2_r_select));
	vcdp->chgBus  (c+108,(vlTOPp->adam_riscv__DOT__me_rs2),5);
	vcdp->chgBus  (c+109,(vlTOPp->adam_riscv__DOT__me_regs_data2),32);
	vcdp->chgBus  (c+110,(vlTOPp->adam_riscv__DOT__me_alu_o),32);
	vcdp->chgArray(c+111,(vlTOPp->adam_riscv__DOT__me_matrix_o),128);
	vcdp->chgBus  (c+115,(vlTOPp->adam_riscv__DOT__me_rd),5);
	vcdp->chgBit  (c+116,(vlTOPp->adam_riscv__DOT__me_mem_read));
	vcdp->chgBit  (c+117,(vlTOPp->adam_riscv__DOT__me_mem2reg));
	vcdp->chgBit  (c+118,(vlTOPp->adam_riscv__DOT__me_mem_write));
	vcdp->chgBus  (c+119,(vlTOPp->adam_riscv__DOT__me_w_select),2);
	vcdp->chgBit  (c+120,(vlTOPp->adam_riscv__DOT__me_rs2_r_select));
	vcdp->chgBus  (c+121,(vlTOPp->adam_riscv__DOT__me_func3_code),3);
	vcdp->chgBus  (c+122,(vlTOPp->adam_riscv__DOT__wb_mem_data),32);
	vcdp->chgBus  (c+123,(vlTOPp->adam_riscv__DOT__wb_alu_o),32);
	vcdp->chgBit  (c+124,(vlTOPp->adam_riscv__DOT__wb_mem2reg));
	vcdp->chgBus  (c+125,(vlTOPp->adam_riscv__DOT__u_stage_if__DOT__u_pc__DOT__pc_next),32);
	vcdp->chgBit  (c+126,((0x67U != (0x7fU & vlTOPp->adam_riscv__DOT__id_inst))));
	vcdp->chgBus  (c+127,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[0]),32);
	vcdp->chgBus  (c+128,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[1]),32);
	vcdp->chgBus  (c+129,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[2]),32);
	vcdp->chgBus  (c+130,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[3]),32);
	vcdp->chgBus  (c+131,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[4]),32);
	vcdp->chgBus  (c+132,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[5]),32);
	vcdp->chgBus  (c+133,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[6]),32);
	vcdp->chgBus  (c+134,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[7]),32);
	vcdp->chgBus  (c+135,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[8]),32);
	vcdp->chgBus  (c+136,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[9]),32);
	vcdp->chgBus  (c+137,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[10]),32);
	vcdp->chgBus  (c+138,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[11]),32);
	vcdp->chgBus  (c+139,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[12]),32);
	vcdp->chgBus  (c+140,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[13]),32);
	vcdp->chgBus  (c+141,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[14]),32);
	vcdp->chgBus  (c+142,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[15]),32);
	vcdp->chgBus  (c+143,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[16]),32);
	vcdp->chgBus  (c+144,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[17]),32);
	vcdp->chgBus  (c+145,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[18]),32);
	vcdp->chgBus  (c+146,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[19]),32);
	vcdp->chgBus  (c+147,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[20]),32);
	vcdp->chgBus  (c+148,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[21]),32);
	vcdp->chgBus  (c+149,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[22]),32);
	vcdp->chgBus  (c+150,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[23]),32);
	vcdp->chgBus  (c+151,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[24]),32);
	vcdp->chgBus  (c+152,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[25]),32);
	vcdp->chgBus  (c+153,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[26]),32);
	vcdp->chgBus  (c+154,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[27]),32);
	vcdp->chgBus  (c+155,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[28]),32);
	vcdp->chgBus  (c+156,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[29]),32);
	vcdp->chgBus  (c+157,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[30]),32);
	vcdp->chgBus  (c+158,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__regs_file[31]),32);
	vcdp->chgBus  (c+159,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__matrix_file[0]),32);
	vcdp->chgBus  (c+160,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__matrix_file[1]),32);
	vcdp->chgBus  (c+161,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__matrix_file[2]),32);
	vcdp->chgBus  (c+162,(vlTOPp->adam_riscv__DOT__u_stage_id__DOT__u_regs__DOT__matrix_file[3]),32);
	vcdp->chgBit  (c+163,((1U & ((IData)(vlTOPp->adam_riscv__DOT__w_select) 
				     >> 1U))));
	vcdp->chgBus  (c+164,((0x7fU & vlTOPp->adam_riscv__DOT__id_inst)),7);
	vcdp->chgBus  (c+165,((3U & (IData)(vlTOPp->adam_riscv__DOT__me_func3_code))),2);
    }
}

void Vadam_riscv::traceChgThis__4(Vadam_riscv__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vadam_riscv* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+166,(vlTOPp->clk));
	vcdp->chgBit  (c+167,(vlTOPp->rst));
    }
}
