`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 09:23:49 PM
// Design Name: 
// Module Name: CLA4
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


module CLA4(
    input [3:0] A, B,
    input Cin,
    output [3:0] S,
    output Cout,
    output P, G
);
    wire [3:0] p, g, c;

    assign p = A ^ B; // Propagate
    assign g = A & B; // Generate

    assign c[0] = Cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign Cout = g[3] | (p[3] & c[3]);

    assign S = p ^ c[3:0];

    assign P = &p; // P = p3 * p2 * p1 * p0
    assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

endmodule