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
    output wire [31:0] qb_execute,                                              // Query B: Outputs Value Stored in Target Register (rt)
    output wire [31:0] immediate_32_execute,                                    // 32-Bit Immediate 
    
    output wire mwreg,                                                          // mwreg == 1: Write Date to Register                                               
    output wire mm2reg,                                                         // mm2reg == 1: Write from Memory to Register (Load)
    output wire mwmem,                                                          // mwmem == 1: Write Data to Memory (Store)
    output wire [4:0] mdestreg,                                                 // Destination Register                    
    output wire [31:0] mr,                                                      // Result from ALU Operation
    output wire [31:0] mqb,                                                     // Query B: Outputs Value Stored in Target Register (rt)
    
    output wire wwreg,                                                          // wwreg == 1: Write Date to Register
    output wire wm2reg,                                                         // wm2reg == 1: Write from Memory to Register (Load)
    output wire [4:0] wdestreg,                                                 // Destination Register
    output wire [31:0] wr,                                                      // Address in Data Memory
    output wire [31:0] wdo                                                      // Data Read from Data Memory

    );
    
    // INTERNAL SIGNALS: Connections Between Modules
    
    wire [31:0] pc_next, inst, qa, qb, immediate_32, inst_out, b, r, mdo;
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
   
   ALUMux alu_mux(
   
        .eqb(qb_execute),
        .eimm32(immediate_32_execute),
        .ealuimm(alu_immediate_execute),
        .b(b)
   
   );
   
   ALU alu(
   
        .eqa(qa_execute),
        .b(b),
        .ealuc(alu_control_execute),
        .r(r)
   
   );
   
   EXEMEM exe_mem(
   
        .clk(clk),
        .ewreg(write_reg_execute),
        .em2reg(mem_to_reg_execute),
        .ewmem(write_mem_execute),
        .edestreg(reg_dest_execute),
        .r(r),
        .eqb(qb_execute),
    
        .mwreg(mwreg),
        .mm2reg(mm2reg),
        .mwmem(mwmem),
        .mdestreg(mdestreg),
        .mr(mr),
        .mqb(mqb)
   
   );
   
   DataMemory data_memory(
   
        .clk(clk),                        
        .mr(mr),                   
        .mqb(mqb),                  
        .mwmem(mwmem),                       
        .mdo(mdo)                        
   
   );
   
   MEMWB mem_wb(
   
        .clk(clk),
        .mwreg(mwreg),
        .mm2reg(mm2reg),
        .mdestreg(mdestreg),
        .mr(mr),
        .mdo(mdo),
    
        .wwreg(wwreg),
        .wm2reg(wm2reg),
        .wdestreg(wdestreg),
        .wr(wr),
        .wdo(wdo)
   
   );
    
endmodule
