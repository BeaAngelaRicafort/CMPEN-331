`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2025 10:17:57 AM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(

    // Extracts instruction from memory based on current program counter value. 

    input wire [31:0] pc,                   // Program Counter | [31:0] = 32-Bit Signal
    output wire [31:0] inst_out             // Instruction Output | [31:0] = 32-Bit Signal

    );
    
    reg [31:0] mem [63:0];                  // 2D Array: 64 Rows of 32-Bit Instructions
    
    initial begin
        mem[25] = 32'h8C220000;             // Initializes Memory 25 to 0x8C220000 | 32'h = 32-Bit Hexadecimal
        mem[26] = 32'h8C230004;             // Initializes Memory 26 to 0x8C230004 | 32'h = 32-Bit Hexadecimal
    end 
    
    // Extracts Bits 2-7 from Program Counter | Bits 2-7: Divides PC Value by 4
    // EX: PC = 100 -> pc[7:2] -> 25 -> mem[25]
    
    assign inst_out = mem[pc[7:2]];         // Accesses Instruction at Memory Address Determined by Current Program Counter Value
    
endmodule