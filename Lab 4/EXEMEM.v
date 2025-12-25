`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2025 02:35:16 PM
// Design Name: 
// Module Name: EXEMEM
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


module EXEMEM(

    // Transfers data from EXE to MEM stage.
    
    // INPUTS: Execute (EXE) Stage

    input wire clk,                                 // Clock
    input wire ewreg,                               // ewreg == 1: Write Date to Register
    input wire em2reg,                              // em2reg == 1: Write from Memory to Register (Load)
    input wire ewmem,                               // ewmem == 1: Write Data to Memory (Store)
    input wire [4:0] edestreg,                      // Destination Register
    input wire [31:0] r,                            // Result from ALU Operation
    input wire [31:0] eqb,                          // Query B: Outputs Value Stored in Target Register (rt) 
    
    // OUTPUTS: Memory Access (MEM) Stage
    
    output reg mwreg,                               // mwreg == 1: Write Date to Register
    output reg mm2reg,                              // mm2reg == 1: Write from Memory to Register (Load)
    output reg mwmem,                               // mwmem == 1: Write Data to Memory (Store)
    output reg [4:0] mdestreg,                      // Destination Register
    output reg [31:0] mr,                           // Result from ALU Operation
    output reg [31:0] mqb                           // Query B: Outputs Value Stored in Target Register (rt)

    );
    
    always @(posedge clk) begin                     // Positive Clock Edge Trigger (0 -> 1)
    
        mwreg <= ewreg;
        mm2reg <= em2reg;
        mwmem <= ewmem;
        mdestreg <= edestreg;
        mr <= r;
        mqb <= eqb;
    
    end
    
endmodule
