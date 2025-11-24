module cmp_maior(in1, in2, out);
    input [0:7]in1, in2;
    output [0:8]out;

    wire result;
    wire [0:6]ig;
    wire [0:7]m;
    wire [0:7]n_in2;
    wire [1:7]ver;

    //Portas not para ~in2
    not(n_in2[0], in2[0]);
    not(n_in2[1], in2[1]);
    not(n_in2[2], in2[2]);
    not(n_in2[3], in2[3]);
    not(n_in2[4], in2[4]);
    not(n_in2[5], in2[5]);
    not(n_in2[6], in2[6]);
    not(n_in2[7], in2[7]);

    //Verificacao se os bits in1 e in2 são iguais
    xnor(ig[0], in1[0], in2[0]);
    xnor(ig[1], in1[1], in2[1]);
    xnor(ig[2], in1[2], in2[2]);
    xnor(ig[3], in1[3], in2[3]);
    xnor(ig[4], in1[4], in2[4]);
    xnor(ig[5], in1[5], in2[5]);
    xnor(ig[6], in1[6], in2[6]);

    //Portas pra verificar se o bit de in1 é maior que o de in2
    and(m[0], in1[0], n_in2[0]);
    and(m[1], in1[1], n_in2[1]);
    and(m[2], in1[2], n_in2[2]);
    and(m[3], in1[3], n_in2[3]);
    and(m[4], in1[4], n_in2[4]);
    and(m[5], in1[5], n_in2[5]);
    and(m[6], in1[6], n_in2[6]);
    and(m[7], in1[7], n_in2[7]);

    //Verificações pra quando os bits mais significativos são iguais
    and(ver[1], ig[0], m[1]);
    and(ver[2], ig[0], ig[1], m[2]);
    and(ver[3], ig[0], ig[1], ig[2], m[3]);
    and(ver[4], ig[0], ig[1], ig[2], ig[3], m[4]);
    and(ver[5], ig[0], ig[1], ig[2], ig[3], ig[4], m[5]);
    and(ver[6], ig[0], ig[1], ig[2], ig[3], ig[4], ig[5], m[6]);
    and(ver[7], ig[0], ig[1], ig[2], ig[3], ig[4], ig[5], ig[6], m[7]);

    or(result, m[0], ver[1], ver[2], ver[3], ver[4], ver[5], ver[6], ver[7]);

    assign out = {8'b0, result};
endmodule

/*
LÓGICA
A = 010
B = 001

A0 > B0 OU (A0 == B0 E A1 > B1) OU (A0 == B0 E A1 == B1 E A2 > B2)


*/