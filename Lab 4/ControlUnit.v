`timescale 1ns / 1ps

module ControlUnit(
    
    // Decodes instruction. 

    input wire [5:0] op,                    // Bits 26-31 of Instruction: OP Code
    input wire [5:0] func,                  // Bits 0-5 of Instruction: Function
    
    output reg write_reg,                   // write_reg = 1: Write Data to Register
    output reg write_mem,                   // write_mem = 1: Write Data to Memory (Store)
    output reg mem_to_reg,                  // mem_to_reg = 1: Write from Memory to Register (Load)
    
    output reg [3:0] alu_control,           // Stores Operation (EX: ADD, SUB, AND, OR, ...)
    output reg alu_immediate,               // alu_immediate = 1: ALU Stores Immediate Value
    output reg reg_rt                       // Selects Destination Register | 0 = rd, 1 = rt
    
    );
    
    always @(*) begin                       // Positive Clock Edge Trigger (0 -> 1)
    
        write_reg = 1'b0;
        write_mem = 1'b0;
        mem_to_reg = 1'b0;
        
        alu_control = 4'b0000;
        alu_immediate = 1'b0;
        reg_rt = 1'b0; 
        
        if (op == 6'b000000) begin          // R-type Instruction | OP = 0000000
        
            if (func == 6'b100000) begin    // ADD Instruction | Function = 1000000
            
                write_reg = 1'b1;           // Writes to Register
                alu_control = 4'b0010;      // ALU Add Command: 0010
                reg_rt = 1'b0;              // Destination: rd
            
            end
            
        end else if (op == 6'b100011) begin // LW Instruction | OP = 100011
        
            write_reg = 1'b1;               // Writes Data to Register
            mem_to_reg = 1'b1;              // Data Source = Memory, Not ALU
            alu_control = 4'b0010;          // ALU Add Command: 0010
            alu_immediate = 1'b1;           // Calculates Register Address: Base Register + Offset (Immediate)
            reg_rt = 1'b1; 
            
            end
            
        end
        
endmodule
