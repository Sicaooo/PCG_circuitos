module h_adder(in1, in2, out, carry);
    input in1, in2;
    output out, carry;
    
    xor(out, in1, in2);
    and(carry, in1, in2);

endmodule

module adder(in1, in2, carryin, out, carryout);
    input in1, in2, carryin;
    output out, carryout;
    wire in1in2, in1cin, in2cin;

    and(in1in2, in1, in2);
    and(in1cin, in1, carryin);
    and(in2cin, in2, carryin);

    xor(out, in1, in2, carryin);
    or(carryout, in1in2, in1cin, in2cin);

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
