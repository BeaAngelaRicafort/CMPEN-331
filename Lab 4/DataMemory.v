`timescale 1ns / 1ps

module DataMemory(

    // Reads and writes into data memory.

    input wire clk,                         // Clock
    input wire [31:0] mr,                   // Address in Data Memory
    input wire [31:0] mqb,                  // Data Written into Data Memory (IF Writing)
    input wire mwmem,                       // mwmem == 1 | Write into Data Memory
    output reg [31:0] mdo                   // Data Read from Data Memory

    );
    
    reg [31:0] mem [63:0];                  // 2D Array: 64 Rows of 32-Bit Instructions
    
    initial begin                           // Initialize First 10 Words of Data Memory
    
        mem[0] = 32'hA00000AA;
        mem[1] = 32'h10000011;
        mem[2] = 32'h20000022;
        mem[3] = 32'h30000033;
        mem[4] = 32'h40000044;
        mem[5] = 32'h50000055;
        mem[6] = 32'h60000066;
        mem[7] = 32'h70000077;
        mem[8] = 32'h80000088;
        mem[9] = 32'h90000099;
    
    end
    
    always @(*)begin                        // ALWAYS Read
    
        mdo = mem[mr[31:2]];         // Reads Data Memory at Position mr into mdo
    
    end
    
    always @(negedge clk) begin             // Negative Clock Edge Trigger (1 -> 0)
    
        if (mwmem == 1)                     // Write Enable | Only Write IF mwmem == 1
        
        mem[mr] = mqb;                      // Write mqb into Data Memory at Position mr
    
    end
    
endmodule
