`timescale 1ns / 1ps

module SignExtension(

    // Performs sign extension to convert a 16-bit immediate value to a 32-bit imemdiate value.

    input wire [15:0] immediate_16,                                       // 16-Bit Immediate
    output wire [31:0] immediate_32                                       // 32-Bit Immediate

    );
    
    // STEP 1: Determines Positive or Negative
    // immediate_16[15] = Most Significant / Leftmost Bit of 16-Bit Immediate
    // If immediate_16[15] == 0, Immediate = Positive
    // If immediate_16[15] == 1, Immediate = Negative
    
    // STEP 2: Replicate Sign Bit 16 Times
    // If immediate_16[15] == 0, {16{immediate_16[15]} = 0000 0000 0000 0000
    // If immediate_16[15] == 1, {16{immediate_16[15]} = 1111 1111 1111 1111
    
    // STEP 3: Concatenate 16 Replicated Bits & Original 16-Bit Intermediate
    // 32 Bit Immediate = 16 Replicated Bits + Original 16-Bit Intermediate
    // immediate_32 = 16{immediate_16[15]} + immediate_16
    
    assign immediate_32 = {{16{immediate_16[15]}}, immediate_16};
    
endmodule
