`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:43:32 AM
// Design Name: 
// Module Name: fulladder_struct
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fulladder_struct(
    input A,
    input B,
    input C_in,
    output S,
    output C_out
    );
   
    wire AxorB, AB, BC_in, AC_in;

    // Sum logic
    xor (AxorB, A, B);
    xor (S, AxorB, C_in);   // S = A ⊕ B ⊕ Cin

    // Carry-out logic
    and (AB, A, B);
    and (BC_in, B, C_in);
    and (AC_in, A, C_in);
    or (C_out, AB, BC_in, AC_in);  // Cout = (A & B) | (B & Cin) | (A & Cin)

endmodule


