`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2025 11:10:09 AM
// Design Name: 
// Module Name: IFID
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


module IFID(

    // Fetches instruction and stores it for decoding.

    input wire clk,                 // Clock
    input wire [31:0] inst,         // Instruction | [31:0] = 32-Bit Signal
    output reg [31:0] inst_decode   // Instruction for Decoding | [31:0] = 32-Bit Signal
    
    );
    
    always @(posedge clk) begin     // Positive Clock Edge Trigger (0 -> 1)
        inst_decode <= inst;        // Updates Instruction for Decoding
    end
    
endmodule