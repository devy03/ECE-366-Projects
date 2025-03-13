`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 02:41:44 AM
// Design Name: 
// Module Name: PPA16_tb
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


module PPA16_tb;

    reg [15:0] A, B;  
    reg Cin;          
    wire [15:0] S;    
    wire Cout;        

    PPA16 uut (   
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $monitor("Time=%0t | A=%b B=%b Cin=%b | S=%b Cout=%b", $time, A, B, Cin, S, Cout);
        //below is basically same as CLA, made to fit 16 bits instead of 32


        //(3 + 5 = 8)
        A = 16'b0000_0000_0000_0011; 
        B = 16'b0000_0000_0000_0101; 
        Cin = 0;
        #10;
        
        //(7 + 1 = 8)
        A = 16'b0000_0000_0000_0111; 
        B = 16'b0000_0000_0000_0001; 
        Cin = 0;
        #10;

        //(5 + 10 = 15)
        A = 16'b0000_0000_0000_0101; 
        B = 16'b0000_0000_0000_1010; 
        Cin = 0;
        #10;
        
        //(overflow case)
        A = 16'b0111_1111_1111_1111; 
        B = 16'b0000_0000_0000_0001;
        Cin = 0;
        #10;
        
        //2 large ints crash test
        A = 16'h1234;  
        B = 16'h5678;  
        Cin = 0;
        #10;

        //(-5 + 3 = -2)
        A = 16'b1111_1111_1111_1011;  
        B = 16'b0000_0000_0000_0011;
        Cin = 0;
        #10;

        //(-50 + -25)
        A = 16'b1111_1111_1100_1110;  
        B = 16'b1111_1111_1110_0111;  
        Cin = 0;
        #10;

        //Cin = 1 + max val, S should be 0
        A = 16'hFFFF; // max value
        B = 16'h0000; 
        Cin = 1;        // Cin = 1
        #10;

        $stop;  
    end
endmodule
