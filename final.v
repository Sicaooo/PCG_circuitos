`include "ULA.v"

module final(in_A, in_B, clk, pr_A, pr_B, clr_A, clr_B, sel_in, out);
    input clk, pr_A, clr_A, pr_B, clr_B;
    input [0:7]in_A, in_B;
    input [0:2]sel_in;
    output[0:8]out;


endmodule