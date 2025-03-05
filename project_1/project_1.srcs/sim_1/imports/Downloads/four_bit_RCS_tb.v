`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 08:21:40 PM
// Design Name: 
// Module Name: four_bit_RCS_tb
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

module four_bit_RCS_tb( );
    
    reg [3:0] A, B;  
    reg C_in;        
    wire [3:0] S;    
    wire C_out;      

    
    four_bit_RCS uut (
        .A(A),
        .B(B),
        .C_in(C_in),
        .S(S),
        .C_out(C_out)
    );

 
    initial begin
        $monitor("Time=%0t | A=%b B=%b C_in=%b | S=%b C_out=%b", $time, A, B, C_in, S, C_out);
        
        // 3 + 5 = 8
        A = 4'b0011; B = 4'b0101; C_in = 0;
        #10;
        
        // 7 - 1 = 6
        A = 4'b0111; B = 4'b0001; C_in = 1;
        #10;

        //5 + 10 = 15
        A = 4'b0101; B = 4'b1010; C_in = 0;
        #10;
        
        //(overflow case)
        A = 4'b1111; B = 4'b0001; C_in = 0;
        #10;
        

        $stop;  
    end
endmodule
