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

RCA #(.N(8))   rca8  (.x(x_in8),  .y(y_in8),  .Cin(Cin8),  .s(rca_sum8),  .Cout(rca_out8));
cla_Nbit #(.N(8))  cla8  (.x(x_in8),  .y(y_in8),  .Cin(Cin8),  .s(cla_sum8),  .Cout(cla_out8));
prefix_adder #(.N(8)) pref8 (.x(x_in8),  .y(y_in8),  .Cin(Cin8),  .s(pref_sum8), .Cout(pref_out8));

RCA #(.N(16))  rca16 (.x(x_in16), .y(y_in16), .Cin(Cin16), .s(rca_sum16), .Cout(rca_out16));
cla_Nbit #(.N(16)) cla16 (.x(x_in16), .y(y_in16), .Cin(Cin16), .s(cla_sum16), .Cout(cla_out16));
prefix_adder #(.N(16)) pref16 (.x(x_in16), .y(y_in16), .Cin(Cin16), .s(pref_sum16), .Cout(pref_out16));

RCA #(.N(32))  rca32 (.x(x_in32), .y(y_in32), .Cin(Cin32), .s(rca_sum32), .Cout(rca_out32));
cla_Nbit #(.N(32)) cla32 (.x(x_in32), .y(y_in32), .Cin(Cin32), .s(cla_sum32), .Cout(cla_out32));
prefix_adder #(.N(32)) pref32 (.x(x_in32), .y(y_in32), .Cin(Cin32), .s(pref_sum32), .Cout(pref_out32));

RCA #(.N(64))  rca64 (.x(x_in64), .y(y_in64), .Cin(Cin64), .s(rca_sum64), .Cout(rca_out64));
cla_Nbit #(.N(64)) cla64 (.x(x_in64), .y(y_in64), .Cin(Cin64), .s(cla_sum64), .Cout(cla_out64));
prefix_adder #(.N(64)) pref64 (.x(x_in64), .y(y_in64), .Cin(Cin64), .s(pref_sum64), .Cout(pref_out64));

