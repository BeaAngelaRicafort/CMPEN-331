`timescale 1ns / 1ps

module ProgramCounter(

    // On every clock tick, we find the next program counter value and update the current program counter value.

    input wire clk,                     // Clock
    input wire [31:0] pc_next,          // Next Program Counter Value | [31:0] = 32-Bit Signal
    output reg [31:0] pc_curr           // Current Program Counter Value | [31:0] = 32-Bit Signal

    );
    
    always @(posedge clk) begin         // Positive Clock Edge Trigger (0 -> 1)
        pc_curr <= pc_next;             // Updates Current Program Counter Value 
    end
    
    initial pc_curr = 32'd100;          // Initializes Current Program Counter Value to Address 10 | 32'd = 32-Bit Decimal
    
endmodule
