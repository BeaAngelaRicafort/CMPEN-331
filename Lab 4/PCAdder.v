`timescale 1ns / 1ps

module PCAdder(

    // To access the next instruction, we have to increment the program counter value by 4.

    input wire [31:0] pc_curr,          // Current Program Counter Value | [31:0] = 32-Bit Signal
    output wire [31:0] pc_next          // Next Program Counter Value | [31:0] = 32-Bit Signal

    );
    
    // Next Program Counter Value = Current Program Counter Value + 4
    // Increment by 4 Bytes -> Instruction = 4 Bytes (32 Bits) 
    // EX: Current Instruction PC = 100, Next Instruction PC = 104
    
    assign pc_next = pc_curr + 4;       
    
endmodule
