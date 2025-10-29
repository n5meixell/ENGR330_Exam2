`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 11:43:44 AM
// Design Name: 
// Module Name: tb_adders
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

module tb_adders;
reg clk;
initial begin
clk = 0;
forever #5 clk = ~clk; 
end
reg [7:0] x_in8, y_in8;
reg Cin8;
wire [7:0] rca_sum8, cla_sum8, pref_sum8;
wire rca_out8, cla_out8, pref_out8;

reg [15:0] x_in16, y_in16;
reg Cin16;
wire [15:0] rca_sum16, cla_sum16, pref_sum16;
wire rca_out16, cla_out16, pref_out16;

reg [31:0] x_in32, y_in32;
reg Cin32;
wire [31:0] rca_sum32, cla_sum32, pref_sum32;
wire rca_out32, cla_out32, pref_out32;

reg [63:0] x_in64, y_in64;
reg Cin64;
wire [63:0] rca_sum64, cla_sum64, pref_sum64;
wire rca_out64, cla_out64, pref_out64;

