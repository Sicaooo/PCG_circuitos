module cmp_ou(in1, in2, out);
    input [0:7]in1, in2;
    output [0:7]out;

    generate
        genvar i;
        for (i = 7; i >= 0; i = i - 1) or(out[i], in1[i], in2[i]);
    endgenerate
endmodule