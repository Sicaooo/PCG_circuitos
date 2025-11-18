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

/*
TABELA VERDADE DO MEIO SOMADOR
in1 in2 out carry
0   0   0   0
0   1   1   0
1   0   1   0
1   1   0   1

out = in1⊕in2
carry = in1 * in2

TABLEA VERDADE DO SOMADOR COMPLETO
in1 in2 cin  out cout
0   0   0    0   0
0   0   1    1   0
0   1   0    1   0
0   1   1    0   1
1   0   0    1   0
1   0   1    0   1
1   1   0    0   1
1   1   1    1   1

out = ~in1*~in2*cin + ~in1*in2*~cin + in1*~in2*~cin + in1*in2*cin
out = ~in(~in2*cin + in2*~cin) + in1(~in2*~cin + in2*cin)
out = ~in1*in2⊕cin + in1*in2⊙cin
out = in1⊕in2⊕cin

cout = ~in1*in2*cin + in1*~in2*cin + in1*in2*~cin + in1*in2*cin
cout = in1*cin + in1*in2 + in2*cin

*/
