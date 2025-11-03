module decoder(in, out);
    input [0:2]in;
    output [0:7]out;
    wire s0, s1, s2, s3, s4, s5, s6, s7;

    and nnn(s0, ~in[0], ~in[1], ~in[2]);
    and nnp(s1, ~in[0], ~in[1], in[2]);
    and npn(s2, ~in[0], in[1], ~in[2]);
    and npp(s3, ~in[0], in[1], in[2]);
    and pnn(s4, in[0], ~in[1], ~in[2]);
    and pnp(s5, in[0], ~in[1], in[2]);
    and ppn(s6, in[0], in[1], ~in[2]);
    and ppp(s7, in[0], in[1], in[2]);

    assign out[0] = s0;
    assign out[1] = s1;
    assign out[2] = s2;
    assign out[3] = s3;
    assign out[4] = s4;
    assign out[5] = s5;
    assign out[6] = s6;
    assign out[7] = s7;

endmodule