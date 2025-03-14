`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 10:06:10 PM
// Design Name: 
// Module Name: fulladder_tb
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
//very simple testbench to get waveform


module fulladder_tb;

    reg A, B, C_in;
    wire Sum, C_out;

    fulladder uut (
        .A(A),
        .B(B),
        .C_in(C_in),
        .Sum(Sum),
        .C_out(C_out)
    );

    initial begin
        A = 0; B = 0; C_in = 0;
        #1; 
        $display("Test Case 1: A=0, B=0, C_in=0 -> Sum=%b, C_out=%b", Sum, C_out);

        A = 0; B = 1; C_in = 0;
        #1;
        $display("Test Case 2: A=0, B=1, C_in=0 -> Sum=%b, C_out=%b", Sum, C_out);

        A = 1; B = 1; C_in = 0;
        #1;
        $display("Test Case 3: A=1, B=1, C_in=0 -> Sum=%b, C_out=%b", Sum, C_out);

        A = 1; B = 1; C_in = 1;
        #1;
        $display("Test Case 4: A=1, B=1, C_in=1 -> Sum=%b, C_out=%b", Sum, C_out);

        $finish; 
    end

endmodule
