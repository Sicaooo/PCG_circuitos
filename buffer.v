module buffer(c1, c2, en);
    input en;
    input [0:7]c1;
    output [0:7]c2;

    always @(*) begin
        if (en == 0) c2 = z;
        else c2 = c1;
    end

endmodule