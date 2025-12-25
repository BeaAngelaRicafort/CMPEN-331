`timescale 1ns / 1ps

module IDEXE(

    // Transfers decoded information from ID stage to EXE stage. 
    
    // INPUTS: Instruction Decode (ID) Stage 

    input wire clk,                                 // Clock
    
    input wire write_reg,                           // write_reg = 1: Write Data to Register
    input wire write_mem,                           // write_mem = 1: Write Data to Memory (Store)
    input wire mem_to_reg,                          // mem_to_reg = 1: Write from Memory to Register (Load)
    
    input wire [3:0] alu_control,                   // Stores Operation (EX: ADD, SUB, AND, OR, ...)
    input wire alu_immediate,                       // alu_immediate = 1: ALU Stores Immediate Value
    
    input wire [4:0] reg_dest,                      // Destination Register
    input wire [31:0] qa,                           // Query A: Outputs Value Stored in Source Register (rs)
    input wire [31:0] qb,                           // Query B: Outputs Value Stores in Target Register (rt)
    input wire [31:0] immediate_32,                 // 32-Bit Immediate
    
    // OUTPUTS: Execute (EXE) Stage Stage
    
    output reg write_reg_execute,                   // write_reg_execute = 1: Write Data to Register
    output reg write_mem_execute,                   // write_mem_execute = 1: Write Data to Memory (Store)
    output reg mem_to_reg_execute,                  // mem_to_reg_execute = 1: Write from Memory to Register (Load)
    
    output reg [3:0] alu_control_execute,           // Stores Operation (EX: ADD, SUB, AND, OR, ...)
    output reg alu_immediate_execute,               // alu_immediate = 1: ALU Stores Immediate Value
    
    output reg [4:0] reg_dest_execute,              // Destination Register
    output reg [31:0] qa_execute,                   // Query A: Outputs Value Stored in Source Register (rs)
    output reg [31:0] qb_execute,                   // Query B: Outputs Value Stored in Source Register (rs)
    output reg [31:0] immediate_32_execute          // 32-Bit Immediate
    
    );
    
    always @(posedge clk) begin                     // Positive Clock Edge Trigger (0 -> 1)
    
        // Transfers decoded information from ID stage to EXE stage.
    
        write_reg_execute <= write_reg;
        write_mem_execute <= write_mem;
        mem_to_reg_execute <= mem_to_reg;
        
        alu_control_execute <= alu_control;
        alu_immediate_execute <= alu_immediate;
        
        reg_dest_execute <= reg_dest;
        qa_execute <= qa;
        qb_execute <= qb;
        immediate_32_execute <= immediate_32;
        
     end
    
endmodule
