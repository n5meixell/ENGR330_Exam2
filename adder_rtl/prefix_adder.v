`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 11:17:03 AM
// Design Name: 
// Module Name: prefix_adder
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


module prefix_adder #(parameter N = 8) (
input wire [N-1:0] x,
input wire [N-1:0] y,
input wire Cin,
output reg [N-1:0] s,
output reg Cout
    );
    reg [N-1:0] p, g;
    reg [N:0] c;
    reg [N-1:0] g_stage [0:6];
    reg [N-1:0] p_stage [0:6];
    
    integer i, j , k;
    

