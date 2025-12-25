`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2025 02:11:33 PM
// Design Name: 
// Module Name: ALUMux
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


module ALUMux(

    // Selects the immediate used for when the ALU performs addition.

    input wire [31:0] eqb,                  // Query B: Outputs Value Stored in Target Register (rt)
    input wire [31:0] eimm32,               // 32-Bit Immediate 
    input wire ealuimm,                     // ALU Immediate (Selector)
    output reg [31:0] b                     // Output Immediate

    );
    
    // If ealuimm == 0, b = eqb
    // If ealuimm == 1, b = eimm32
    
    always @(*)begin
    
    if (ealuimm == 0) begin
    
        b <= eqb;
        
    end else if (ealuimm == 1) begin
    
        b <= eimm32;
        
        end
        
    end
    
endmodule