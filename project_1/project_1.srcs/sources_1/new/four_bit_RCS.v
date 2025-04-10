`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 06:21:42 PM
// Design Name: 
// Module Name: four_bit_CLA
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

module four_bit_RCS(A, B, C_in, S, C_out);
    input [3:0] A;
    input [3:0] B;
    input C_in;
    output [3:0] S;
    output C_out;
    //updated code below
     wire C1, C2, C3;  //wires
     wire [3:0] B_mux; //mux to negate B or not for RCS
     
     //mux negates B for RCS
     assign B_mux[0] = (C_in) ? ~B[0] : B[0];
     assign B_mux[1] = (C_in) ? ~B[1] : B[1];
     assign B_mux[2] = (C_in) ? ~B[2] : B[2];
     assign B_mux[3] = (C_in) ? ~B[3] : B[3];

    
    // Instantiate the 1-bit adders
    fulladder_structural FA0 (A[0], B_mux[0], C_in, S[0], C1);//C_out ---> C1
    fulladder_structural FA1 (A[1], B_mux[1], C1,   S[1], C2); //C1 ---> C_in(1)
    fulladder_structural FA2 (A[2], B_mux[2], C2,   S[2], C3);//C2 ---> C_in(2)
    fulladder_structural FA3 (A[3], B_mux[3], C3,   S[3], C_out);//C3 ---> C_in(3)----> C_out
endmodule