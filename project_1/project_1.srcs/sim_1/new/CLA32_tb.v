`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 08:48:23 PM
// Design Name: 
// Module Name: CLA32_tb
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


module CLA32_tb();
    
    reg [31:0] A, B;  
    reg Cin;        
    wire [31:0] S;    
    wire Cout;      

    
    CLA32 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

 
    initial begin
        $monitor("Time=%0t | A=%b B=%b Cin=%b | S=%b Cout=%b", $time, A, B, Cin, S, Cout);
        //test cases below are from RCA tests, extended to 32 bits and added a couple more edge cases
        // (3 + 5 = 8)
        A = 32'b00000000000000000000000000000011; 
        B = 32'b00000000000000000000000000000101; 
        Cin = 0;
        #10;
        
        // (7 + 1 = 8)
        A = 32'b00000000000000000000000000000111; 
        B = 32'b00000000000000000000000000000001; 
        Cin = 0;
        #10;

        // (5 + 10 = 15)
        A = 32'b00000000000000000000000000000101; 
        B = 32'b00000000000000000000000000001010; 
        Cin = 0;
        #10;
        
        // (overflow check)
        A = 32'b01111111111111111111111111111111; //max
        B = 32'b00000000000000000000000000000001; // + 1
        Cin = 0;
        #10;
        
        // 2 big ints (crash test)
        A = 32'h12345678;  // Some large hex value
        B = 32'h87654321;  // Another large hex value
        Cin = 0;
        #10;

        // (-5 + 3 = -2)
        A = 32'b11111111111111111111111111111011; 
        B = 32'b00000000000000000000000000000011;
        Cin = 0;
        #10;

        // (-50 + -25)
        A = 32'b11111111111111111111111111001110; 
        B = 32'b11111111111111111111111111100111; 
        Cin = 0;
        #10;

        // test carry in
        A = 32'hFFFFFFFF; //max val
        B = 32'h00000000; 
        Cin = 1;        //Cin = 1
        #10;

        $stop;  
    end
endmodule