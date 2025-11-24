`include "final.v"
`timescale 1ps/1ps

module final_tb;
    reg [0:7]a, b;
    reg clk, pr, clr, pr_A, pr_B, clr_A, clr_B, pr_out, clr_out;
    reg [0:2]sel_in;
    wire [0:8]out;

    final uut(
        .in_A(a),
        .pr_A(pr_A),
        .clr_A(clr_A),
        .in_B(b),
        .pr_B(pr_B),
        .clr_B(clr_B),
        .clk(clk),
        .sel_in(sel_in),
        .out(out),
        .pr_out(pr_out),
        .clr_out(clr_out)
    );

    initial begin
        $dumpfile("final_tb.vcd");
        $dumpvars(0, final_tb);
        pr_A = 0;
        pr_B = 0;
        pr_out = 0;
        clr_A = 1;
        clr_B = 1;
        clr_out = 1;
        a = 8'd10;
        b = 8'd5;
        sel_in = 3'd0; // a + b
        #6;
        clr_A = 0;
        clr_B = 0;
        clr_out = 0;
        #15;
        sel_in = 3'd1; // a - b
        #15;
        sel_in = 3'd2; // a * b
        #15;
        sel_in = 3'd3; // a == b
        #15;
        sel_in = 3'd4; // a > b
        #15;
        sel_in = 3'd5; // a < b
        #15;
        sel_in = 3'd6; // a & b
        #15;
        sel_in = 3'd7; // a | b
        #20;
        $finish;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


endmodule