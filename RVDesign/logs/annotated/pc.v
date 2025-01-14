	// verilator_coverage annotation
	module pc(
 020000	    input  wire         clk,
 006570	    input  wire         br_ctrl, //br
 020103	    input  wire[31:0]   br_addr,
%000001	    input  wire         rst,
 013244	    output reg[31:0]    pc_o,
	    //hazard detection
%000008	    input  wire         pc_stall
	    );
	
 013253	reg [31:0] pc_next;
	
	always @(posedge clk) begin
 000100	    if (!rst)begin
	        pc_o    <= 0;
	    end
 003284	    else if (br_ctrl) begin
	        pc_o <= br_addr;
	        $display("-----------------------");
	        $display("PC_o = BR_addr: %h", pc_o);
	    end
%000004	    else if (pc_stall) begin
	        pc_o <= pc_o;
	        $display("-----------------------");
	        $display("PC_o = stall: %h", pc_o);
	    end
 006612	    else begin
	        pc_o <= pc_next;
	        $display("-----------------------");
	        $display("PC_O = PC_next: %h", pc_o);
	    end
	end
	
	always @(posedge clk) begin
 000100	    if (!rst)begin
	        pc_next  <= 4;
	    end
 003284	    else if (br_ctrl) begin
	        pc_next <= br_addr + 4;
	        //$display("PC_next = BR_addr: %h", pc_next);
	    end
%000004	    else if (pc_stall) begin
	        pc_next <= pc_next;
	        // $strobe("PC_next = stall: %h", pc_next);
	    end
 006612	    else begin
	        pc_next <= pc_next + 4;
	    end
	end
	
	endmodule
	
