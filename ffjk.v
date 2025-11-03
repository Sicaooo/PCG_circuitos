module latch_jk(j, k, clk, pr, clr, s_esc, s_escn, q, qn);
    input j, k, clk, pr, clr, s_esc, s_escn;
    output q, qn;
    wire s, r;

    not prn(not_pr, pr);
    not clrn(not_clr, clr);

    nand jqn(s, j, s_escn, clk);
    nand kq(r, k, s_esc, clk);

    nand out(q, s, not_pr, qn);
    nand outn(qn, r, not_clr, q);
endmodule

module latch_rs(s, r, clk, pr, clr, q, qn);
    input s, r, clk, pr, clr;
    output q, qn;
    wire s_intern, r_intern;

    not prn(not_pr, pr);
    not clrn(not_clr, clr);

    nand jqn(s_intern, s, clk);
    nand kq(r_intern, r, clk);

    nand out(q, s_intern, not_pr, qn);
    nand outn(qn, r_intern, not_clr, q);
endmodule

module ffjk(j, k, clk, pr, clr, q, qn);
    input j, k, clk, pr, clr;
    output q, qn;
    wire not_clk, q_intern, qn_intern;

    not clkn(not_clk, clk);

    latch_jk mestre(
        .j(j),
        .k(k),
        .clk(clk),
        .pr(pr),
        .clr(clr),
        .s_esc(q),
        .s_escn(qn),
        .q(q_intern),
        .qn(qn_intern)
    );

    latch_rs escravo(
        .s(q_intern),
        .r(qn_intern),
        .clk(not_clk),
        .pr(pr),
        .clr(clr),
        .q(q),
        .qn(qn)
    );
endmodule