`timescale 1ns / 1ps

module IFID(

    // Fetches instruction and stores it for decoding.

    input wire clk,                 // Clock
    input wire [31:0] inst,         // Instruction | [31:0] = 32-Bit Signal
    output reg [31:0] inst_decode   // Instruction for Decoding | [31:0] = 32-Bit Signal
    
    );
    
    always @(posedge clk) begin     // Positive Clock Edge Trigger (0 -> 1)
        inst_decode <= inst;        // Updates Instruction for Decoding
    end
    

endmodule
