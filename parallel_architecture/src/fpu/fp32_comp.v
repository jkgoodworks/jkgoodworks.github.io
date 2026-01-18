module fp32_comp (
    input  [31:0] a,
    input  [31:0] b,
    output        is_eq,
    output        is_lt,
    output	      is_ne,
    output	      is_le,
    output	      is_gt,
    output	      is_ge,
    output        is_nan
);

	// Decompose a and b
	wire sign_a     = a[31];
	wire sign_b     = b[31];
	wire [7:0] exp_a = a[30:23];
	wire [7:0] exp_b = b[30:23];
	wire [22:0] frac_a = a[22:0];
	wire [22:0] frac_b = b[22:0];

	// NaN detection (exp=255 and frac != 0)
	wire a_is_nan = (exp_a == 8'hFF) && (frac_a != 0);
	wire b_is_nan = (exp_b == 8'hFF) && (frac_b != 0);
	assign is_nan = a_is_nan | b_is_nan;

	// Zero detection (exp=0 and frac=0)
	wire a_is_zero = (exp_a == 0) && (frac_a == 0);
	wire b_is_zero = (exp_b == 0) && (frac_b == 0);

	// Equality: special case for zero (handle +0.0 == -0.0)
	assign is_eq = (~is_nan) && (
		      (a_is_zero && b_is_zero) ||
		      (a == b)
		  );

	// Less-than logic
	reg lt;

	always @(*) begin
		if (is_nan) begin
			lt = 1'b0; // NaN is unordered
		end else if (a_is_zero && b_is_zero) begin
			lt = 1'b0;
		end else if (sign_a != sign_b) begin
			lt = sign_a; // negative < positive
		end else if (sign_a == 0) begin
			// both positive: compare magnitude
			if (exp_a < exp_b)
				lt = 1'b1;
			else if (exp_a > exp_b)
				lt = 1'b0;
			else // same exponent
				lt = frac_a < frac_b;
			end else begin
				// both negative: reversed magnitude comparison
				if (exp_a > exp_b)
					lt = 1'b1;
				else if (exp_a < exp_b)
					lt = 1'b0;
				else
					lt = frac_a > frac_b;
		end
	end

	assign is_lt = lt;
	assign is_ne  = ~is_eq || is_nan;
	assign is_le  = is_lt || is_eq;
	assign is_gt  = ~is_lt & ~is_eq & ~is_nan;
	assign is_ge  = ~is_lt || is_eq;
endmodule

