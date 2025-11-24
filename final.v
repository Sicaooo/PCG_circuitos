`include "ULA.v"
//pr_A, pr_B, clr_A, clr_B, pr_out, clr_out
module final(in_A, in_B, clk, pr_A, pr_B, clr_A, clr_B, pr_out, clr_out, sel_in, out);
    input clk, pr_A, pr_B, clr_A, clr_B, pr_out, clr_out;
    input [0:7]in_A, in_B;
    input [0:2]sel_in;
    output[0:7]out;

    wire [0:7]regA, regB, regOUT;
    registrador reg_A(in_A, clk, pr_A, clr_A, regA);
    registrador reg_B(in_B, clk, pr_B, clr_B, regB);
    
    ULA ula(regA, regB, sel_in, regOUT);
   
    registrador reg_out(regOUT, clk, pr_out, clr_out, out);

endmodule