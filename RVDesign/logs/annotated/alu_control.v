	// verilator_coverage annotation
	`include "./AdamRiscv/define.vh"
	
	module alu_control(
 019770	    input wire[2:0] alu_op,
 000041	    input wire[2:0] func3_code, 
%000007	    input wire      func7_code,  //func7_code = func7[5] = [inst[30]]
 026326	    output reg[3:0] alu_ctrl_r
	);
	
	always @(*) begin
	    case(alu_op)
 003400	        3'b000: //`ItypeL,`Stype,`UtypeL、`UtypeU
	            alu_ctrl_r = `ADD;
	
 003292	        3'b001:begin //`Btype
	            case (func3_code)
 003284	                `B_BEQ:  alu_ctrl_r = `SUB;
%000008	                `B_BNE:  alu_ctrl_r = `NOTEQ;
%000000	                `B_BLT:  alu_ctrl_r = `SLT;
%000000	                `B_BGE:  alu_ctrl_r = `SGE;
%000000	                `B_BLTU: alu_ctrl_r = `SLTU;
%000000	                `B_BGEU: alu_ctrl_r = `SGEU;
%000000	                default: alu_ctrl_r = 4'b1111;
	            endcase
	        end
	
%000000	        3'b010:begin //`Rtype
	            case ({func3_code,func7_code})
%000000	                `R_ADD  :   alu_ctrl_r = `ADD  ;
%000000	                `R_SUB  :   alu_ctrl_r = `SUB  ;
%000000	                `R_SLL  :   alu_ctrl_r = `SLL  ;
%000000	                `R_SLT  :   alu_ctrl_r = `SLT  ;
%000000	                `R_SLTU :   alu_ctrl_r = `SLTU ;
%000000	                `R_XOR  :   alu_ctrl_r = `XOR  ;
%000000	                `R_SRL  :   alu_ctrl_r = `SRL  ;
%000000	                `R_SRA  :   alu_ctrl_r = `SRA  ;
%000000	                `R_OR   :   alu_ctrl_r = `OR   ;
%000000	                `R_AND  :   alu_ctrl_r = `AND  ;
%000000	                default: alu_ctrl_r = 4'b1111;
	            endcase
	        end
	
 000010	        3'b011:begin //`ItypeA
	            case (func3_code)
%000009	                `I_ADDI  :  alu_ctrl_r = `ADD  ;//,`I_JALR  
%000001	                `I_SLLI  :  alu_ctrl_r = (func7_code == 0)? `SLL :4'b1111 ;
%000000	                `I_SLTI  :  alu_ctrl_r = `SLT ; 
%000000	                `I_SLTIU :  alu_ctrl_r = `SLTU ;
%000000	                `I_XORI  :  alu_ctrl_r = `XOR ;  
%000000	                `I_SRLI  :  alu_ctrl_r = (func7_code == 0)? `SRL : (func7_code == 1)? `SRA : 4'b1111 ; //,`I_SRAI  
%000000	                `I_ORI   :  alu_ctrl_r = `OR ;
%000000	                `I_ANDI  :  alu_ctrl_r = `AND ; 
%000000	                default: alu_ctrl_r = 4'b1111;
	            endcase
	        end
	
%000001	        3'b100:begin //`ItypeJ,`Jtype
	            alu_ctrl_r = `JUMP;
	        end
	
 000013	        3'b101:begin //`Mtype
	            case (func3_code)
%000002	                `M_LD   :   alu_ctrl_r = `ADD  ;
%000004	                `M_ST   :   alu_ctrl_r = `ADD  ;
%000004	                `M_MVTR :   alu_ctrl_r = `ADD  ;
%000002	                `M_MVTM :   alu_ctrl_r = `ADD  ;
%000001	                `M_MOPA :   alu_ctrl_r = `MOPA ;
%000000	                default: alu_ctrl_r = 4'b1111;
	            endcase
	        end
 003285	        default   : alu_ctrl_r = 4'b1111;
	
	    /*
	        `OP_LS    : alu_ctrl_r = `ADD;  //load,store : alu_mode is add
	        `OP_Br    : alu_ctrl_r = `SUB;  //beq : alu_mode is subtract
	        `OP_R_ADD : alu_ctrl_r = `ADD;  //Rtype 
	        `OP_R_SUB : alu_ctrl_r = `SUB;  //Rtype 
	        `OP_R_SLL : alu_ctrl_r = `SLL;  //Rtype 
	        `OP_R_SLT : alu_ctrl_r = `SLT;  //Rtype 
	        `OP_R_SLTU: alu_ctrl_r = `SLTU; //Rtype
	        `OP_R_XOR : alu_ctrl_r = `XOR;  //Rtype 
	        `OP_R_SRL : alu_ctrl_r = `SRL;  //Rtype
	        `OP_R_SRA : alu_ctrl_r = `SRA;  //Rtype 
	        `OP_R_OR  : alu_ctrl_r = `OR;   //Rtype
	        `OP_R_AND : alu_ctrl_r = `AND;  //Rtype 
	*/
	    endcase
	end
	
	endmodule
	
