`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 09:24:46 AM
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input A,
    input B,
    input C_in,
    output Sum,
    output C_out
);

    assign Sum = A ^ B ^ C_in;  
    assign C_out = (A & B) | (B & C_in) | (A & C_in);

endmodule
