`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2025 02:24:24 PM
// Design Name: 
// Module Name: WBMux
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


module WBMux(

    // Sets output of multiplexer to wr or wdo, depending on value of wm2reg.

    input wire [31:0] wr,                   // Address in Data Memory
    input wire [31:0] wdo,                  // Data Read from Data Memory
    input wire wm2reg,                      // wm2reg == 1: Write from Memory to Register (Load) - Selector
    output reg [31:0] wbdata                // Output

    );
    
    // If wm2reg == 0, wbdata = wr
    // If wm2reg == 1, wbdata = wdo
    
    always @(*)begin
    
    if (wm2reg == 0) begin
    
        wbdata <= wr;
        
    end else if (wm2reg == 1) begin
    
        wbdata <= wdo;
        
        end
        
    end
    
endmodule
