`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 09:44:12 AM
// Design Name: 
// Module Name: PPA16
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


module PPA16(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] S,
    output Cout
    );
    
    wire [15:0] P, G; 
    wire [15:0] C;    

   
    assign P = A ^ B;  
    assign G = A & B; 

   
    assign C[0] = Cin; 
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin
            assign C[i] = (P[i-1] & C[i-1]) | G[i-1];  
        end
    endgenerate

   
    assign S = P ^ C;

   assign Cout = (P[15] & C[15]) | G[15];

endmodule
