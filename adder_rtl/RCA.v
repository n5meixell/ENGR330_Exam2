`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 11:43:44 AM
// Design Name: 
// Module Name: RCA
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


module adder(
input x,
input y,
input Cin,
output s,
output Cout
    );
    wire xy, x_and_y, Cin_and_xy;
    xor (xy, x, y);
    xor (s, xy, Cin);
    and (Cin_and_xy, Cin, xy);
    and ( x_and_y, x , y);
    or (Cout, x_and_y, Cin_and_xy);
    endmodule 
    
  module RCA #(parameter N = 8)( 
    input [N-1:0] x,
    input [N-1:0] y,
    input Cin,
    output [N-1:0] s,
    output Cout
    );
    wire [N:0]c;
    assign c[0] = Cin;
    
    genvar i;
    generate
    for (i = 0; i < N; i = i + 1) begin  : stage 
    adder fa (
    .x(x[i]),
    .y(y[i]),
    .Cin(c[i]),
    .s(s[i]),
    .Cout(c[i+1])
    );
    end
    endgenerate
    assign Cout = c[N];
    endmodule


