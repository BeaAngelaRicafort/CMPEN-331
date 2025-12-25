`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2025 04:17:26 PM
// Design Name: 
// Module Name: RegMux
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


module RegMux(

    // Multiplexer: Selects which register field (rt or rd) will be the destination register.

    input wire [4:0] rt,        // Bits 16-20 of Instruction: rt
    input wire [4:0] rd,        // Bits 11-15 of Instruction: rd 
    input wire reg_selector,    // Control Signal: Determines Destination Register (rt or rd)
    output reg [4:0] reg_dest   // Destination Register

    );
    
    // If reg_selector == 1, reg_dest = rt
    // If reg_selector == 0, reg_dest = rd
    
    always @(*)begin
    
    if (reg_selector == 1) begin
    
        reg_dest <= rt;
        
    end else if (reg_selector == 0) begin
    
        reg_dest <= rd;
        
        end
        
    end
    
endmodule
