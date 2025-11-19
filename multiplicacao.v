module multiplicacao(in1, in2, out);
    input [0:7]in1, in2;
    output [0:15]out;

    assign out = in1 * in2;
    
endmodule