//`include "fp_opcodes.vh"

`define OP_FADD     4'b0000
`define OP_FSUB     4'b0001
`define OP_FMUL     4'b0010
`define OP_FDIV     4'b0011
`define OP_SQRT     4'b0100
`define OP_F2I      4'b0101
`define OP_I2F      4'b0110
`define OP_FEQ      4'b0111
`define OP_FNEQ     4'b1000
`define OP_FLT      4'b1001
`define OP_FLEQ     4'b1010
`define OP_FGT      4'b1011
`define OP_FGEQ     4'b1100

module fpu (clk, rst, op_sel, rsA, rsB, rd, exc2fsr);

	input clk, rst;
	input [3:0] op_sel; 
	input [31:0] rsA, rsB;
	output [4:0] exc2fsr;
	output [31:0] rd;

	// Internal FloPoCo format wires
	wire [33:0] a_flo, b_flo, r_mul, r_div, r_sqrt;

	// Output wires
	wire [31:0] i2f_float_out, f2i_result, tmp, r_add;

	// Internal result storage
	// This will hold the result of the selected operation
	// and will be converted to IEEE format at the end.
	wire [33:0] selected_result;

    wire is_zero, is_subnorm, is_inf, is_nan, 
            is_snan, sign, is_eq, is_lt, is_ne, is_le, is_gt, is_ge, is_nan_cmp;
	
	wire [7:0] exponent;
	wire [22:0] fraction;

    reg set;
    reg [1:0] cnt;
    reg [2:0] instr;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
            instr <= 0;
            set <= 0;
        end else begin
            if (!set) begin
                case (op_sel)
                    `OP_FDIV: begin
                        cnt <= rsB == 0 ? 1 : 2;
                        set <= 1;
                    end
                    `OP_SQRT: begin
                        cnt <= rsA[31] == 1 ? 0 : 1;
                        set = 1;
                    end
                    `OP_FADD, `OP_FSUB,
                    `OP_FMUL, `OP_F2I,
                    `OP_I2F, `OP_FEQ,
                    `OP_FNEQ, `OP_FLT,
                    `OP_FLEQ, `OP_FGT, 
                    `OP_FGEQ: begin
                        cnt <= 0;
                        set <= 0;
                    end                     
                    default: begin
                        cnt <= 0;
                        set <= 0;
                    end
                endcase
                
                instr <= op_sel;
            end else begin
                cnt <= cnt - 1;
                
                if (!cnt)
                    set <= 0;
            end                
        end        
    end

	// === IEEE -> FloPoCo Conversion ===
	fp32flo conv_a (.clk(clk), .X(rsA), .R(a_flo));
	fp32flo conv_b (.clk(clk), .X(rsB), .R(b_flo));

	// === FPU Operations ===
	fp32_add u_add (.A(rsA), .B((op_sel == `OP_FSUB) ? {~rsB[31], rsB[30:0]} :rsB), .out(r_add));
	fp32_mult u_mul (.clk(clk), .X(a_flo), .Y(b_flo), .R(r_mul));
	fp32_div u_div (.clk(clk), .X(a_flo), .Y(b_flo), .R(r_div));
	fp32_sqrt u_sqrt (.clk(clk), .X(a_flo), .R(r_sqrt));
    fp32_comp u_comp (.a(rsA), .b(rsB), .is_eq(is_eq), .is_lt(is_lt), 
            .is_ne(is_ne), .is_le(is_le), .is_gt(is_gt), .is_ge(is_ge), .is_nan(is_nan_cmp));

	// === Integer to Float Conversion ===
	i2fp i2f (.in_num(rsA), .out_num(i2f_float_out));

	// === Float to Integer Conversion ===
	fp2i f2i (.in_num(rsA), .out_num(f2i_result));

	// === FloPoCo Internal -> IEEE Conversion ===
	flo2fp32 conv_out (.clk(clk), .X(selected_result), .R(tmp));

    assign selected_result = cnt == 0 ? (instr == `OP_FMUL ? r_mul :
                             instr == `OP_FDIV ? r_div : r_sqrt) : 33'h0;

    assign rd = (op_sel == `OP_FADD || op_sel == `OP_FSUB) ? r_add :
                (op_sel == `OP_I2F) ?  i2f_float_out :
                (op_sel == `OP_F2I) ? f2i_result :
                (op_sel == `OP_FEQ) ? is_eq :
                (op_sel == `OP_FNEQ) ? is_ne :
                (op_sel == `OP_FLT) ? is_lt :
                (op_sel == `OP_FLEQ) ? is_le :
                (op_sel == `OP_FGT) ? is_gt :
                (op_sel == `OP_FGEQ) ? is_ge :
                tmp;

    assign sign     = rd[31];
    assign exponent = rd[30:23];
    assign fraction = rd[22:0];

    assign is_zero     = (exponent == 8'b00000000) && (fraction == 0);
    assign is_subnorm  = (exponent == 8'b00000000) && (fraction != 0);
    assign is_inf      = (exponent == 8'b11111111) && (fraction == 0);
    assign is_nan      = is_nan_cmp || (exponent == 8'b11111111) && (fraction != 0);
    assign is_snan     = is_nan_cmp || is_nan && (fraction[22] == 0);

	assign exc2fsr[4] = is_snan || ((op_sel == `OP_SQRT) && rsA[31]) || ((op_sel == `OP_FDIV) && (rsB == 0)); 	// NV
	assign exc2fsr[3] = (op_sel == `OP_FDIV) && (rsB == 0);		 												// DV							
	assign exc2fsr[2] = is_inf;				 								                                    // OF
	assign exc2fsr[1] = is_subnorm;	 																			// UF
	assign exc2fsr[0] = is_subnorm || is_snan; 																	// NX
endmodule