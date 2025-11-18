module h_sub(in1, in2, out, borrow);
    input in1, in2;
    output out, borrow;
    wire not_in1, not_in1in2;

    not(not_in1, in1);
    and(not_in1in2, not_in1, in2);

    xor(out, in1, in2);
    assign borrow = not_in1in2;
    
endmodule

module sub(in1, in2, bin, out, bout);
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