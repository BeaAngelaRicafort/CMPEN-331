`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2025 04:24:10 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(

    // Stores the 32 general-purpose registers of the CPU. 

    input wire [4:0] rs,                                // Source Register
    input wire [4:0] rt,                                // Target Register
    output wire [31:0] qa,                              // Query A: Outputs Value Stored in Source Register (rs)
    output wire [31:0] qb                               // Query B: Outputs Value Stores in Target Register (rt)

    );
    
    reg [31:10] registers [31:0];                       // 2D Array: 32 Rows of 32-Bit Registers
    integer index;                                      // Index / Counter for Register Array
    
    initial begin
        
        for (index = 0; index < 32; index = index + 1)  // Initialize Index = 0 | Loop While Index < 32 | Increment By 1 After Each Iteration
            registers[index] = 32'd0;                   // Set All Registers = 0
            
    end
    
    assign qa =  registers[rs];                         // Finds Output Value Stored in Source Register (rs)
    assign qb = registers[rt];                          // Finds Output Value Stores in Target Register (rt)
    
endmodule