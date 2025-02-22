	// verilator_coverage annotation
	`include "./AdamRiscv/define.vh"
	
	module imm_gen (
 112150	    input wire[31:0]  inst,
%000129	    output wire[31:0] imm_o
	);
	assign imm_o = (inst[6:0] == `ItypeL || inst[6:0] == `ItypeA || inst[6:0] == `ItypeJ )? {{20{inst[31]}},inst[31:20]} :
	               (inst[6:0] == `Stype)? {{20{inst[31]}},inst[31:25],inst[11:7]} :
	               (inst[6:0] == `Btype)? {{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0} :
	               (inst[6:0] == `UtypeL || inst[6:0] == `UtypeU)? {inst[31:12],12'b0} :
	               (inst[6:0] == `Jtype)? {{12{inst[31]}},inst[19:12],inst[20],inst[30:21],1'b0} :
	               (inst[6:0] == `Mtype)? (
	               (inst[14:12] ==  `M_LD)? {{20{inst[31]}}, inst[31:20]} : 
	               (inst[14:12] ==  `M_ST)? {{20{inst[31]}}, inst[31:25], inst[11:7]} : 32'b0) : 32'b0;               
	
	always @(imm_o) begin
 003297	    if (inst[6:0] == `Btype)
	        $display("imm_branch : ",{{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0});
	end
	
	
	endmodule
	
