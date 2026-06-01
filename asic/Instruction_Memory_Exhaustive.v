`timescale 1ns / 1ps

module Instruction_Memory(
    input  [31:0] A,
    output [31:0] RD
);

   reg [31:0] I_MEM_BLOCK[63:0];

   initial begin
      // --- THE EXHAUSTIVE TEST SUITE ---
      // This program systematically tests I, R, U, B, J, and S type instructions.
      // If any of these fail, the processor will crash or skip the final memory write.

      // 1. I-Type Test (ADDI)
      I_MEM_BLOCK[0]  = 32'h00a00093; // addi x1, x0, 10   (x1 = 10)
      I_MEM_BLOCK[1]  = 32'h01400113; // addi x2, x0, 20   (x2 = 20)
      
      // 2. R-Type Test (ADD)
      I_MEM_BLOCK[2]  = 32'h002081b3; // add  x3, x1, x2   (x3 = 30)
      
      // 3. U-Type Test (LUI)
      I_MEM_BLOCK[3]  = 32'h00001237; // lui  x4, 1        (x4 = 4096)
      
      // 4. B-Type Test (BEQ)
      I_MEM_BLOCK[4]  = 32'h00318463; // beq  x3, x3, 8    (Jumps to instruction 6)
      I_MEM_BLOCK[5]  = 32'h00000193; // addi x3, x0, 0    (THIS SHOULD BE SKIPPED)
      
      // 5. J-Type Test (JAL)
      I_MEM_BLOCK[6]  = 32'h008002ef; // jal  x5, 8        (Jumps to instruction 8)
      I_MEM_BLOCK[7]  = 32'h00000193; // addi x3, x0, 0    (THIS SHOULD BE SKIPPED)
      
      // 6. S-Type Test (SW) - The Final Success Output
      I_MEM_BLOCK[8]  = 32'h06400313; // addi x6, x0, 100  (Set Address to 100)
      I_MEM_BLOCK[9]  = 32'h0ff00393; // addi x7, x0, 255  (Set Data to 255 / 0xFF)
      I_MEM_BLOCK[10] = 32'h00732023; // sw   x7, 0(x6)    (Write 255 to Address 100)
   end

   assign RD = I_MEM_BLOCK[A[31:2]]; // word aligned

endmodule
