module reg_ex_mem(
    input  wire clk,
    input  wire rst,
    input  wire[31:0] ex_regs_data2,
    input  wire[31:0] ex_alu_o,
    input  wire[127:0]ex_matrix_o,
    input  wire[4:0]  ex_rd,
    input  wire       ex_mem_read,
    input  wire       ex_mem2reg,
    input  wire       ex_mem_write,
    input  wire[1:0]  ex_w_select,
    input  wire       ex_rs2_r_select,
    input  wire[2:0]  ex_func3_code, 

    //forwarding
    input wire[4:0]   ex_rs2,
    output reg[4:0]   me_rs2,

    output reg[31:0]  me_regs_data2,
    output reg[31:0]  me_alu_o,
    output reg[127:0] me_matrix_o,
    output reg[4:0]   me_rd,
    output reg        me_mem_read,
    output reg        me_mem2reg,
    output reg        me_mem_write,
    output reg[1:0]   me_w_select,
    output reg        me_rs2_r_select,
    output reg[2:0]   me_func3_code
);

always @(posedge clk) begin
    if (!rst)begin
        me_regs_data2  <= 0;         
        me_alu_o       <= 0;     
        me_rd          <= 0; 
        me_mem_read    <= 0;     
        me_mem2reg     <= 0;     
        me_mem_write   <= 0;         
        me_w_select    <= 0;
        me_rs2_r_select<= 0;
        me_rs2         <= 0;   
        me_func3_code  <= 0;    
        me_matrix_o    <= 0;
    end 
    else begin  
        me_regs_data2  <= ex_regs_data2;         
        me_alu_o       <= ex_alu_o;     
        me_matrix_o    <= ex_matrix_o;
        me_rd          <= ex_rd; 
        me_mem_read    <= ex_mem_read;     
        me_mem2reg     <= ex_mem2reg;     
        me_mem_write   <= ex_mem_write;         
        me_w_select    <= ex_w_select;
        me_rs2_r_select<= ex_rs2_r_select;
        me_rs2         <= ex_rs2;    
        me_func3_code  <= ex_func3_code; 
    end

    $display("me_alu_o: %h",me_alu_o);
    $display("me_matrix_o: %h",me_matrix_o);

end

endmodule