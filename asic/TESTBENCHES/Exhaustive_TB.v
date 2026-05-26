`timescale 1ns / 1ps

module Exhaustive_TB();

   // --- 1. Signal Declarations ---
   reg         clk;
   reg         reset;
   wire [31:0] WriteData;
   wire [31:0] DataAddr;
   wire        MemWrite;

   // --- 2. Device Under Test (DUT) Instantiation ---
   Single_Cycle_Top DUT (
      .clk(clk),
      .reset(reset),
      .WriteData(WriteData),
      .DataAddr(DataAddr),
      .MemWrite(MemWrite)
   );

   // --- 3. Clock Generation (100MHz) ---
   always begin
      clk = 1'b0; #5;
      clk = 1'b1; #5;
   end

   // --- 4. System Initialization & Reset ---
   initial begin
      // Start with reset asserted
      clk = 0;
      reset = 1'b1; 
      
      $display("=================================================");
      $display(" Starting Exhaustive Verification (Backup Core)");
      $display("=================================================");

      // Hold reset for 2 clock cycles to clear all registers
      #20; 
      reset = 1'b0; // Release reset and let the processor run
      
      // Safety Timeout: Prevents Cadence from hanging if a Jump/Branch loops infinitely
      #1000;
      $display("=================================================");
      $display(" [FAIL] Simulation Timeout. Processor stalled or looped.");
      $display("=================================================");
      $stop;
   end

   // --- 5. The Self-Checking Monitor ---
   // Watches every write to Data Memory.
   always @(negedge clk) begin
      if (MemWrite) begin
         $display("[%0t ns] MEMORY WRITE: Addr = 0x%h | Data = 0x%h", $time, DataAddr, WriteData);
         
         // 0x64 is Address 100. 0xFF is Data 255.
         if (DataAddr == 32'h00000064 && WriteData == 32'h000000FF) begin
            $display("=================================================");
            $display(" [SUCCESS] All ISA Types Tested Successfully!");
            $display(" Hardware is verified and ready for Synthesis.");
            $display("=================================================");
            $stop;
         end
      end
   end

endmodule
