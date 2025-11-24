module buffer(c1, c2, en);
    input en;
    input [0:8]c1;
    output reg [0:8]c2;

    always @(*) begin
        if (en == 0) c2 = 9'bz;
        else c2 = c1;
    end

endmodule