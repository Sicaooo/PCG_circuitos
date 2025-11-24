module cmp_igual(in1, in2, out);
    input [0:7]in1, in2;
    output [0:8]out;
    wire result;
    wire [0:7]temp_out;

    generate
        genvar i;
        for (i = 7; i >= 0; i = i - 1) xnor(temp_out[i], in1[i], in2[i]);
    endgenerate

    and (
        result, 
        temp_out[0],
        temp_out[1],
        temp_out[2],
        temp_out[3],
        temp_out[4],
        temp_out[5],
        temp_out[6],
        temp_out[7]
    );

    assign out = {8'b0, result};

endmodule