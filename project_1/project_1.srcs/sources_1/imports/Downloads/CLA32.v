`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 09:04:41 PM
// Design Name: 
// Module Name: CLA32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:DD
// 
//////////////////////////////////////////////////////////////////////////////////


module CLA32(
    input [31:0] A, B,
    input Cin,
    output [31:0] S,
    output Cout
);
    wire [7:0] P, G;   
    wire [8:0] C;      

    assign C[0] = Cin; // initial carry

    // Generate Carry Signals for 4-bit blocks
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: CLA_BLOCKS
            CLA4 cla4_inst (
                .A(A[i*4 +: 4]), 
                .B(B[i*4 +: 4]), 
                .Cin(C[i]),       
                .S(S[i*4 +: 4]),  
                .Cout(C[i+1]),    
                .P(P[i]), 
                .G(G[i])
            );
        end
    endgenerate

    // Compute Carry-In 
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C[8] = G[7] | (P[7] & C[7]);  //final carry-out

    assign Cout = C[8];  

endmodule
