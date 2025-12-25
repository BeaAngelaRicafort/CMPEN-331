`timescale 1ns / 1ps

module MEMWB(

    // Transfers data from MEM to WB stage.
    
    // INPUTS: Memory Access (MEM) Stage

    input wire clk,                                 // Clock
    input wire mwreg,                               // mwreg == 1: Write Date to Register
    input wire mm2reg,                              // mm2reg == 1: Write from Memory to Register (Load)
    input wire [4:0] mdestreg,                      // Destination Register
    input wire [31:0] mr,                           // Address in Data Memory
    input wire [31:0] mdo,                          // Data Read from Data Memory
    
    // OUTPUTS: Writeback (WB) Stage
    
    output reg wwreg,                               // wwreg == 1: Write Date to Register
    output reg wm2reg,                              // wm2reg == 1: Write from Memory to Register (Load)
    output reg [4:0] wdestreg,                      // Destination Register
    output reg [31:0] wr,                           // Address in Data Memory
    output reg [31:0] wdo                           // Data Read from Data Memory

    );
    
    always @(posedge clk) begin                     // Positive Clock Edge Trigger (0 -> 1)
    
        wwreg <= mwreg;
        wm2reg <= mm2reg;
        wdestreg <= mdestreg;
        wr <= mr;
        wdo <= mdo;
    
    end
    
endmodule
