module h_sub(in1, in2, out, borrow);
    input in1, in2;
    output out, borrow;
    wire not_in1, not_in1in2;

    not(not_in1, in1);
    and(not_in1in2, not_in1, in2);

    xor(out, in1, in2);
    assign borrow = not_in1in2;
    
endmodule

module f_sub(in1, in2, bin, out, bout);
    input in1, in2, bin;
    output out, bout;
    wire not_in1, not_in1bin, not_in1in2, in2bin;

    not(not_in1, in1);
    and(not_in1bin, not_in1, bin);
    and(not_in1in2, not_in1, in2);
    and(in2bin, in2, bin);

    xor(out, in1, in2, bin);
    or(bout, not_in1bin, not_in1in2, in2bin);

endmodule

module subtracao(in1, in2, out);
    input [0:7]in1, in2;
    output [0:8]out;
    wire [0:6]borrows;

    h_sub hs(in1[7], in2[7], out[8], borrows[6]);

    generate
        genvar i;
        for (i = 6; i > 0; i = i - 1) f_sub fs(in1[i], in2[i], borrows[i], out[i + 1], borrows[i - 1]);
    endgenerate

    f_sub fs(in1[0], in2[0], borrows[0], out[1], out[0]);

endmodule

/*
TABELA VERDADE DO MEIO SUBTRATOR
in1 in2  out borrow
0   0    0   0
0   1    1   1
1   0    1   0
1   1    0   0

out = ~in1*in2 + in1*~in2
out = in1⊕in2

borrow = ~in1*in2

TABELA VERDADE DO SUBTRATOR COMPLETO
in1 in2 bin  out bout
0   0   0    0   0
0   0   1    1   1
0   1   0    1   1    
0   1   1    0   1
1   0   0    1   0
1   0   1    0   0
1   1   0    0   0
1   1   1    1   1

out = ~in1*~in2*bin + ~in1*in2*~bin + in1*~in2*~bin + in1*in2*bin
out = ~in1(in2⊕bin) + in1(in2⊙bin)
out = in1⊕in2⊕bin

bout = ~in1*~in2*bin + ~in1*in2*~bin + ~in1*in2*bin + in1*in2*bin
bout = ~in1*bin + ~in1*in2 + in2*bin

*/