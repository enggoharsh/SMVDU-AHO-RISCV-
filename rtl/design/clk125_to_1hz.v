`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2026 11:03:45
// Design Name: 
// Module Name: clk125_to_1hz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk125_to_1hz (
    input clk,        // 125 MHz
    input rst,
    output reg clk_1hz
);

reg [25:0] count;  

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count   <= 0;
        clk_1hz <= 0;
    end 
    else if (count == 26'd62499999) begin
        count   <= 0;
        clk_1hz <= ~clk_1hz;  // toggle every 0.5 sec
    end 
    else begin
        count <= count + 1;
    end
end

endmodule
