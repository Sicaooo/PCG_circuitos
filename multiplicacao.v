module h_adder(in1, in2, out, carry);
    input in1, in2;
    output out, carry;
    
    xor(out, in1, in2);
    and(carry, in1, in2);

endmodule

module f_adder(in1, in2, carryin, out, carryout);
    input in1, in2, carryin;
    output out, carryout;
    wire in1in2, in1cin, in2cin;

    and(in1in2, in1, in2);
    and(in1cin, in1, carryin);
    and(in2cin, in2, carryin);

    xor(out, in1, in2, carryin);
    or(carryout, in1in2, in1cin, in2cin);

endmodule

module adicao(in1, in2, out);
    input [0:7] in1, in2;
    output [0:8] out;
    wire [0:6] carrys;

    h_adder ha(in1[7], in2[7], out[8], carrys[6]);

    generate
        genvar i;
        for (i = 6; i > 0; i = i - 1) f_adder fa(in1[i], in2[i], carrys[i], out[i + 1], carrys[i - 1]);
    endgenerate

    f_adder fa7(in1[0], in2[0], carrys[0], out[1], out[0]);

endmodule

module mult(in1, in2, out);
    input [0:7]in1;
    input in2;
    output [0:7]out;

    generate
        genvar i;
        for (i = 0; i < 8; i = i + 1) and(out[i], in1[i], in2);
    endgenerate
endmodule

module multiplicacao(in1, in2, out);
    input [0:7]in1, in2;
    output [0:15]out;
    wire [0:15]temp1;
    wire [0:14]temp2;

    generate
        genvar i;
        for (i = 7; i >= 0; i = i - 1) begin
            assign temp1 = out;
            mult m(in1, in2[i]);
            adicao a(temp1, temp2, out);
        end
    endgenerate

endmodule