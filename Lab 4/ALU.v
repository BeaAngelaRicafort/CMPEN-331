`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2025 02:16:02 PM
// Design Name: 
// Module Name: ALU
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


module ALU(

    // Performs the addition of eqa and b.

    input wire [31:0] eqa,          // Query A: Outputs Value Stored in Source Register (rs)
    input wire [31:0] b,            // Immediate Selected by ALU Multiplexer
    input wire [3:0] ealuc,         // Stores Operation (EX: ADD, SUB, AND, OR, ...) 
    output reg [31:0] r             // Result

    );
    
    always @(*) begin
    
    if (ealuc == 4'b0010)           // If Operation == ADD
    
        r <= eqa + b;               // Add eqa & b, Store Result in r
        
    else
    
        r <= 8'bx;                  // No Operation, Blank Result (r)
        
    end 
    
endmodule
