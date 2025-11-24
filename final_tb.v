`include "final.v"
`timescale 1ps/1ps

module ULA_tb;
    reg clk, pr, clr;
    reg [0:7]a, b;
    reg [0:2]sel_in;
    wire [0:8]out;

    final uut(a, b, sel_in, out);

    initial begin
        $dumpfile("final_tb.vcd");
        $dumpvars(0, final_tb);

        a = 8'd10;
        b = 8'd5;
        sel_in = 3'd0;
        #5;
        sel_in = 3'd1;
        #5;
        sel_in = 3'd2;
        #5;
        sel_in = 3'd3;
        #5;
        b = 8'd10;
        #5;
        b = 8'd5;
        sel_in = 3'd4;
        #2;
        a = 8'd5;
        b = 8'd10;
        #3;
        a = 8'd10;
        b = 8'd5;
        sel_in = 3'd5;
        #2;
        a = 8'd5;
        b = 8'd10;
        #3;
        a = 8'd10;
        b = 8'd5;
        sel_in = 3'd6;
        #5;
        sel_in = 3'd7;
        #10;

        $finish;
    end

    initial begin
        clk = 0;
        forever clk = ~clk;
    end


endmodule