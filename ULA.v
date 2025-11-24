`include "registrador.v"
`include "decoder.v"
`include "buffer.v"
`include "adicao.v"
`include "subtracao.v"
`include "multiplicacao.v"
`include "cmp_igual.v"
`include "cmp_maior.v"
`include "cmp_menor.v"
`include "cmp_e.v"
`include "cmp_ou.v"

module ULA(a, b, sel_in, out);
    input [0:2]sel_in;
    input [0:7]a, b;

    output [0:8]out;

    wire [0:8]soma_out;
    wire [0:8]sub_out;
    wire [0:8]mult_out;
    wire [0:8]cmpi_out;
    wire [0:8]cmpma_out;
    wire [0:8]cmpme_out;
    wire [0:8]cmpe_out;
    wire [0:8]cmpou_out;

    wire [0:7]sel_out;

    decoder dec(sel_in, sel_out);

    adicao ad(a, b, soma_out);
    buffer bf1(soma_out, out, sel_out[0]);

    subtracao sub(a, b, sub_out);
    buffer bf2(sub_out, out, sel_out[1]);

    multiplicacao mult(a, b, mult_out);
    buffer bf3(mult_out, out, sel_out[2]);

    cmp_igual cmpi(a, b, cmpi_out);
    buffer bf4(cmpi_out, out, sel_out[3]);

    cmp_maior cmpma(a, b, cmpma_out);
    buffer bf5(cmpma_out, out, sel_out[4]);

    cmp_menor cmpme(a, b, cmpme_out);
    buffer bf6(cmpme_out, out, sel_out[5]);

    cmp_e cmpe(a, b, cmpe_out);
    buffer bf7(cmpe_out, out, sel_out[6]);

    cmp_ou cmpou(a, b, cmpou_out);
    buffer bf8(cmpou_out, out, sel_out[7]);

endmodule