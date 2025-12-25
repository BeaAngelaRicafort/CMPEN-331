`timescale 1ns / 1ps

module Datapath(

    input wire clk,                                                             // Clock
    output wire [31:0] pc_curr,                                                 // Program Counter
    
    output wire [31:0] inst_decode,                                             // Decoded Instruction
    
    output wire write_reg_execute,                                              // write_reg_execute = 1: Write Data to Register
    output wire write_mem_execute,                                              // write_mem_execute = 1: Write Data to Memory (Store)
    output wire mem_to_reg_execute,                                             // mem_to_reg_execute = 1: Write from Memory to Register (Load)
    
    output wire [3:0] alu_control_execute,                                      // Stores Operation (EX: ADD, SUB, AND, OR, ...)
    output wire alu_immediate_execute,                                          // alu_immediate = 1: ALU Stores Immediate Value
    
    output wire [4:0] reg_dest_execute,                                         // Destination Register
    output wire [31:0] qa_execute,                                              // Query A: Outputs Value Stored in Source Register (rs)
    output wire [31:0] qb_execute,                                              // Query B: Outputs Value Stored in Source Register (rs)
    output wire [31:0] immediate_32_execute                                     // 32-Bit Immediate 

    );
    
    // INTERNAL SIGNALS: Connections Between Modules
    
    wire [31:0] pc_next, inst, qa, qb, immediate_32, inst_out;
    wire [4:0] reg_dest;
    wire [3:0] alu_control;
    wire write_reg, mem_to_reg, write_mem, alu_immediate, reg_selector;
    
    // ORGANIZES INPUTS & OUTPUTS OF ALL MODULES
    
    ProgramCounter program_counter(
    
        .clk(clk),
        .pc_next(pc_next),
        .pc_curr(pc_curr)
        
    );
    
    PCAdder pc_adder(
    
        .pc_curr(pc_curr),
        .pc_next(pc_next)
        
    );
    
    InstructionMemory instruction_memory(
    
        .pc(pc_curr),
        .inst_out(inst_out)
        
    );
    
    IFID if_id(
    
        .clk(clk),
        .inst(inst_out),
        .inst_decode(inst_decode)
        
    );
        
    ControlUnit control_unit(
    
        .op(inst_decode[31:26]),
        .func(inst_decode[5:0]),
        
        .write_reg(write_reg),
        .write_mem(write_mem),
        .mem_to_reg(mem_to_reg),
        
        .alu_control(alu_control),
        .alu_immediate(alu_immediate),
        .reg_rt(reg_rt)
    
    );
    
    RegMux reg_mux(
    
        .rt(inst_decode[20:16]),
        .rd(inst_decode[15:11]),
        .reg_selector(reg_rt),
        .reg_dest(reg_dest)
        
    );
    
    SignExtension sign_extension(
    
        .immediate_16(inst_decode[15:0]),
        .immediate_32(immediate_32)
        
    );
    
    IDEXE id_exe(
    
        .clk(clk),
        
        .write_reg(write_reg),
        .write_mem(write_mem),
        .mem_to_reg(mem_to_reg),
        
        .alu_control(alu_control),
        .alu_immediate(alu_immediate),
        
        .reg_dest(reg_dest),
        .qa(qa),
        .qb(qb),
        .immediate_32(immediate_32),
        
        .write_reg_execute(write_reg_execute),
        .write_mem_execute(write_mem_execute),
        .mem_to_reg_execute(mem_to_reg_execute),
        
        .alu_control_execute(alu_control_execute),
        .alu_immediate_execute(alu_immediate_execute),
        
        .reg_dest_execute(reg_dest_execute),
        .qa_execute(qa_execute),
        .qb_execute(qb_execute),
        .immediate_32_execute(immediate_32_execute)
        
   );
   
   RegisterFile register_file(
   
        .rs(inst_decode[25:21]),
        .rt(inst_decode[20:16]),
        .qa(qa),
        .qb(qb)
   
   );
    
endmodule
