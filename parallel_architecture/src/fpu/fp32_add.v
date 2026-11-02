module fp32_add #(
	parameter SIZE = 32,
	parameter EXP_SIZE = 8,
	parameter MANT_SIZE = 23
) (
	input      [SIZE-1:0] A, B,
    output reg [SIZE-1:0] out
);

	reg                 sign_A, sign_B, sign_res;
	reg [EXP_SIZE-1:0]  exp_A, exp_B, exp_res;
	reg [MANT_SIZE:0]   mant_A, mant_B, mant_res;
	
	reg [EXP_SIZE-1:0] exp_diff;
	reg [MANT_SIZE+1:0] mant_sum;
	reg [MANT_SIZE:0] temp;

	wire [4:0] shift_amount;

	integer i;
		
    leading_zeros_counter lzc_0 (temp, shift_amount);

	//Combinational Logic to (a) compare and adjust the exponents, 
	//                       (b) shift appropriately the mantissa if necessary, 
	//                       (c) add the two mantissas, and
	//                       (d) perform post-normalization. 
	//                           Make sure to check explicitly for zero output. 
    always @(*) begin
        { sign_A, exp_A, mant_A } = { A[SIZE-1], A[SIZE-2:MANT_SIZE], {1'b1, A[MANT_SIZE-1:0]} };
        { sign_B, exp_B, mant_B } = { B[SIZE-1], B[SIZE-2:MANT_SIZE], {1'b1, B[MANT_SIZE-1:0]} };

        if (exp_A > exp_B) begin
            exp_diff = exp_A - exp_B;
            exp_res = exp_A;
            mant_B = mant_B >> exp_diff;
        end else begin
            exp_diff = exp_B - exp_A;
            exp_res = exp_B;
            mant_A = mant_A >> exp_diff;
        end

        if (sign_A == sign_B) begin
            mant_sum = mant_A + mant_B;
            sign_res = sign_A;
        end else begin
            if (mant_A > mant_B) begin
                mant_sum = mant_A - mant_B;
                sign_res = sign_A;
            end else begin
                mant_sum = mant_B - mant_A;
                sign_res = sign_B;
            end
        end

        if (mant_sum[MANT_SIZE+1]) begin
            mant_sum = mant_sum >> 1;
            exp_res = exp_res + 1;
        end

        temp = mant_sum[MANT_SIZE:0];

        mant_res = temp << shift_amount;
        exp_res = exp_res - shift_amount;

        if (mant_res == 0 || exp_res == 'b1 && mant_res == 'h800000) begin
            out = 0;
        end else begin
            out = {sign_res, exp_res, mant_res[MANT_SIZE-1:0]};
        end
    end
endmodule

// https://digitalsystemdesign.in/leading-zero-counter/
module leading_zeros_counter (
    input  [23:0] in,
    output [4:0]  lz
);
    wire [5:0] A;
    wire [5:0] Q1;
    wire [5:0] Q0;
    wire [2:0] Q_msb;
    wire [1:0] Q_lsb;

    lzc_4 lzc_4_0 (in[3:0],   A[0], Q1[0], Q0[0]);
    lzc_4 lzc_4_1 (in[7:4],   A[1], Q1[1], Q0[1]);
    lzc_4 lzc_4_2 (in[11:8],  A[2], Q1[2], Q0[2]);
    lzc_4 lzc_4_3 (in[15:12], A[3], Q1[3], Q0[3]);
    lzc_4 lzc_4_4 (in[19:16], A[4], Q1[4], Q0[4]);
    lzc_4 lzc_4_5 (in[23:20], A[5], Q1[5], Q0[5]);

    lze lze_0 (A, Q_msb);

    assign Q_lsb = (Q_msb == 6) ? 2'b0 : { Q1[5-Q_msb], Q0[5-Q_msb] };

    assign lz = { Q_msb, Q_lsb };
endmodule

module lzc_4 (
    input      [3:0] in,
    output           A,
    output reg       Q1, Q0
);
    assign A = ~(|in);

    always @(in) begin
        casez (in)
            4'b1???: { Q1, Q0 } = 0;
            4'b01??: { Q1, Q0 } = 1;
            4'b001?: { Q1, Q0 } = 2;
            4'b0001: { Q1, Q0 } = 3;
            4'b0000: { Q1, Q0 } = 4;
            default: { Q1, Q0 } = 0; 
        endcase
    end
endmodule

module lze (
    input      [5:0] A,
    output reg [2:0] Q_msb
);
    always @(A) begin
        casez (A)
            6'b0?????: Q_msb = 0;
            6'b10????: Q_msb = 1;
            6'b110???: Q_msb = 2;
            6'b1110??: Q_msb = 3;
            6'b11110?: Q_msb = 4;
            6'b111110: Q_msb = 5;
            default:   Q_msb = 6;
        endcase
    end
endmodule