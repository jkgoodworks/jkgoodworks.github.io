`timescale 1ns/1ps

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

module fpu_tb;

    reg clk = 0;
    reg rst = 0;
    reg [3:0] op_sel;
    reg [31:0] rsA, rsB;
    wire [31:0] rd;
    wire [4:0] exc2fsr;

    fpu dut (
        .clk(clk), .rst(rst),
        .op_sel(op_sel),
        .rsA(rsA), .rsB(rsB),
        .rd(rd), .exc2fsr(exc2fsr)
    );

    // Clock generator
    always #5 clk = ~clk;

    // Helper to print results
    task print_result;
        input [255:0] name;
        begin
            $display("");
            $display("%s:", name);
            $display("  rsA       = 0x%08X", rsA);
            $display("  rsB       = 0x%08X", rsB);
            $display("  rd        = 0x%08X", rd);
            $display("  exc2fsr   = 0b%05b", exc2fsr);
            $display("");
        end
    endtask

    initial begin
        $display("=== FPU Testbench Start ===");
        rst = 1;
        #25 rst = 0;

        // ---------- ADD ----------
        op_sel = `OP_FADD;
        rsA = 32'h3fc00000; // 1.5
        rsB = 32'h40100000; // 2.25
        #10 print_result("ADD 1.5 + 2.25");

        // ---------- SUB ----------
        op_sel = `OP_FSUB;
        rsA = 32'h41200000; // 10.0
        rsB = 32'h40800000; // 4.0
        #10 print_result("SUB 10.0 - 4.0");

        // ---------- MUL ----------
        op_sel = `OP_FMUL;
        rsA = 32'h40400000; // 3.0
        rsB = 32'hc0000000; // -2.0
        #10 print_result("MUL 3.0 * -2.0");

        // ---------- DIV ----------
        op_sel = `OP_FDIV;
        rsA = 32'h40c00000; // 6.0
        rsB = 32'h40000000; // 2.0
        #10 print_result("DIV 6.0 / 2.0");

        // ---------- DIV by ZERO ----------
        op_sel = `OP_FDIV;
        rsA = 32'h40c00000; // 6.0
        rsB = 32'h00000000; // 0.0
        #10 print_result("DIV 6.0 / 0.0");

        // ---------- SQRT ----------
        op_sel = `OP_SQRT;
        rsA = 32'h41800000; // 16.0
        rsB = 32'h00000000;
        #20 print_result("SQRT 16.0");

        // ---------- SQRT negative ----------
        op_sel = `OP_SQRT;
        rsA = 32'hc1100000; // -9.0
        rsB = 32'h00000000;
        #10 print_result("SQRT -9.0");

        // ---------- I2F ----------
        op_sel = `OP_I2F;
        rsA = 32'd42; // int
        rsB = 32'h00000000;
        #10 print_result("I2F 42");

        // ---------- F2I ----------
        op_sel = `OP_F2I;
        rsA = 32'h407f5c29; // 3.99
        rsB = 32'h00000000;
        #10 print_result("F2I 3.99");

        // ---------- FEQ ----------
        op_sel = `OP_FEQ;
        rsA = 32'h3f800000; // 1.0
        rsB = 32'h3f800000; // 1.0
        #10 print_result("FEQ 1.0 == 1.0");

        // ---------- FNEQ ----------
        op_sel = `OP_FNEQ;
        rsA = 32'h3f800000; // 1.0
        rsB = 32'h40000000; // 2.0
        #10 print_result("FNEQ 1.0 != 2.0");

        // ---------- FLT ----------
        op_sel = `OP_FLT;
        rsA = 32'h3f800000; // 1.0
        rsB = 32'h40000000; // 2.0
        #10 print_result("FLT 1.0 < 2.0");

        // ---------- FLEQ ----------
        op_sel = `OP_FLEQ;
        rsA = 32'h3f800000; // 1.0
        rsB = 32'h3f800000; // 1.0
        #10 print_result("FLEQ 1.0 <= 1.0");

        // ---------- FGT ----------
        op_sel = `OP_FGT;
        rsA = 32'h40000000; // 2.0
        rsB = 32'h3f800000; // 1.0
        #10 print_result("FGT 2.0 > 1.0");

        // ---------- FGEQ ----------
        op_sel = `OP_FGEQ;
        rsA = 32'h40000000; // 2.0
        rsB = 32'h40000000; // 2.0
        #10 print_result("FGEQ 2.0 >= 2.0");

        // ---------- NaN ----------
        op_sel = `OP_FADD;
        rsA = 32'h7FC00000; // QNaN
        rsB = 32'h3f800000; // 1.0
        #10 print_result("ADD QNaN + 1.0");

        // ---------- Inf ----------
        op_sel = `OP_FADD;
        rsA = 32'h7F800000; // +Inf
        rsB = 32'h3f800000; // 1.0
        #10 print_result("ADD Inf + 1.0");

        // ---------- Subnormal ----------
        op_sel = `OP_FADD;
        rsA = 32'h00000001; // smallest subnormal
        rsB = 32'h00000000; // 0.0
        #10 print_result("ADD subnormal + 0.0");

        $display("=== FPU Testbench Complete ===");
        $finish;
    end

endmodule
