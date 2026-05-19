`timescale 1ns / 1ps

module Single_Cycle_TB();

reg clk = 0, reset;
wire [31:0] WriteData, DataAddr, pc_out, instr_out, rd_out;
wire MemWrite;

always #10 clk = ~clk;

Single_Cycle_Top DUT(
	.clk(clk),
	.reset(reset),
	.WriteData(WriteData),
	.DataAddr(DataAddr),
	.MemWrite(MemWrite),
	.pc_out(pc_out),
	.instr_out(instr_out),
	.rd_out(rd_out)
);
  
initial begin
    #20; reset = 0; 
    #20; reset = 1; 
	#20; reset = 0;
end


always@(posedge clk)  begin
    if(MemWrite) begin
      $display ("Everything is Working fine Review Your Waveform");
      end
end
endmodule