`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 11:16:40 AM
// Design Name: 
// Module Name: fulladder_structural
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


module fulladder_structural(
    input A,
    input B,
    input C_in,
    output S,
    output C_out
    );
    
    wire AxorB, AB, BC_in, AC_in;

    // Sum 
    xor (AxorB, A, B);
    xor (S, AxorB, C_in);  
    
    // C_out 
    and (AB, A, B);
    and (BC_in, B, C_in);
    and (AC_in, A, C_in);
    or (C_out, AB, BC_in, AC_in); 
endmodule
