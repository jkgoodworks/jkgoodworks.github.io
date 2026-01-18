module i2fp (
    input [31:0] in_num,
    output reg [31:0] out_num
);
    reg [7:0] exponent;
    reg [22:0] mantissa;
    reg [31:0] input_adj, mantissa_temp, out_temp;
    integer j;
    reg [4:0] leading_zeros;
    reg first_bit;
    reg [4:0] count;

    always @(*) begin
        // Default assignments to avoid latches
        out_temp = 32'b0;
        mantissa_temp = 0;
        exponent = 0;
        mantissa = 0;
        input_adj = 0;
        leading_zeros = 5'd31;
        count = 0;

        // Special cases
        if (in_num == 32'hFF800000)
            out_temp = 32'hFF800000;
        else if (in_num == 32'h7F800000)
            out_temp = 32'h7F800000;
        else if (in_num == 32'h7FC00000)
            out_temp = 32'h7FC00000;
        else if (in_num == 32'h00000000)
            out_temp = 32'h00000000;
        else begin
            // Absolute value
            input_adj = in_num[31] ? (~in_num + 1'b1) : in_num;

            // Count leading zeros
            first_bit = 0;
            for (j = 31; j >= 0; j = j - 1) begin
                if (input_adj[j] == 1'b1 && !first_bit) begin
                    leading_zeros = 5'd31 - j;
                    first_bit = 1'b1;
                end
            end
            count = leading_zeros + 1;

            // Normalize
            mantissa_temp = input_adj << count;

            // Round mantissa
            mantissa = (mantissa_temp[8] == 1'b1) ? mantissa_temp[31:9] + 1 : mantissa_temp[31:9];

            // Calculate exponent (bias = 127)
            exponent = 159 - count;

            // Assemble final result
            out_temp = {in_num[31], exponent, mantissa};
        end

        out_num = out_temp;
    end
endmodule
