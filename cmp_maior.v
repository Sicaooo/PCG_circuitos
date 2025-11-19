module cmp_maior(in1, in2, out);
    input [0:7]in1, in2;
    output out;
    wire xn0, xn1, xn2, xn3, xn4, xn5, xn6, xn7;

    xnor(xn0, in1[0], in2[0]);
    xnor(xn1, in1[1], in2[1]);
    xnor(xn2, in1[2], in2[2]);
    xnor(xn3, in1[3], in2[3]);
    xnor(xn4, in1[4], in2[4]);
    xnor(xn5, in1[5], in2[5]);
    xnor(xn6, in1[6], in2[6]);
    xnor(xn7, in1[7], in2[7]);

    


endmodule
