module buffer(c1, c2, en);
    input c1, en;
    output c2;

    always @(*) begin
        if (en == 0) c2 = z;
        else c2 = c1;
    end

endmodule