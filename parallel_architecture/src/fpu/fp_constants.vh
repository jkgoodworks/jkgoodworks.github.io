// === Floating Point Operation Codes ===
`ifndef FP_OPCODES_VH
`define FP_OPCODES_VH

// === Basic FP Arithmetic Operations ===
`define FP_OP_ADD      4'b0000  // Floating Point Addition
`define FP_OP_SUB      4'b0001  // Floating Point Subtraction
`define FP_OP_MUL      4'b0010  // Floating Point Multiplication
`define FP_OP_DIV      4'b0011  // Floating Point Division

// === FP Conversion Operations ===
`define FP_OP_F2I      4'b0100  // Float to Integer
`define FP_OP_I2F      4'b0101  // Integer to Float

// === FP Comparison Operations ===
`define FP_OP_EQ       4'b0110  // Equal Comparison
`define FP_OP_LT       4'b0111  // Less Than
`define FP_OP_LE       4'b1000  // Less Than or Equal

// === FP Special Ops (Optional) ===
`define FP_OP_SQRT     4'b1001  // Square Root
`define FP_OP_FSGNJ    4'b1010  // Sign Injection
`define FP_OP_MIN      4'b1011  // Min
`define FP_OP_MAX      4'b1100  // Max

// === Reserved or Custom ===
`define FP_OP_NOP      4'b1111  // No operation or default

// === FPU Operations ===
`define OP_FADD 3'b000
`define OP_FSUB 3'b001
`define OP_FMUL 3'b010
`define OP_FDIV 3'b011
`define OP_SQRT 3'b100
`define OP_F2I  3'b101
`define OP_I2F  3'b110
`define OP_FCMP 3'b111

`endif // FP_OPCODES_VH
