`timescale 1ns / 1ps

module tb_Single_Cycle_Top;

    // 1. Declare Testbench Signals
    reg         clk;
    reg         reset;

    wire [31:0] WriteData;
    wire [31:0] DataAddr;
    wire        MemWrite;
    wire [31:0] read_dataout;
    wire [31:0] PC_out;
    wire [31:0] Instr_out;

    // 2. Instantiate the Design Under Test (DUT)
    Single_Cycle_Top dut (
        .clk(clk),
        .reset(reset),
        .WriteData(WriteData),
        .DataAddr(DataAddr),
        .MemWrite(MemWrite),
        .read_dataout(read_dataout),
        .PC_out(PC_out),       
        .Instr_out(Instr_out)  
    );

    // 3. Clock Generation (12ns period -> 83.3 MHz)
    initial begin
        clk = 0;
        forever #6 clk = ~clk; 
    end

    // 4. Test Sequence & Reset Driver
    initial begin
        // Setup Waveform Dumping
        $dumpfile("processor_sim.vcd");
        $dumpvars(0, tb_Single_Cycle_Top);

        $display("==================================================");
        $display("   SMVDU-AHO-32 Processor Simulation Started      ");
        $display("==================================================");

        // Drive Reset high to initialize PC to 0
        reset = 1'b1;
        #20;  
        
        // Release Reset to start execution
        reset = 1'b0;

        // Wait until PC reaches the end of your hardcoded program.
        // Your last instruction is at index 20 (address 80 in decimal, 0x50 in hex).
        // Let's add a little buffer and wait for address 0x54 (84 in decimal).
        wait(PC_out == 32'h00000050); 
        
        #20;
        $display("==================================================");
        $display("   Test Program Completed Successfully.           ");
        $display("==================================================");
        $finish;
    end

    // 5. Watchdog Timer (Failsafe)
    initial begin
        #5000; 
        $display("==================================================");
        $display(" [FATAL] Watchdog Timer Expired! Processor Hanged.");
        $display("==================================================");
        $finish;
    end

    // 6. Console Monitor (Prints execution flow to terminal)
    always @(negedge clk) begin
        if (!reset) begin
            $display("Time: %0t | PC: %h | Instr: %h | MemWrite: %b | Addr: %h | WData: %h", 
                     $time, PC_out, Instr_out, MemWrite, DataAddr, WriteData);
        end
    end

endmodule
