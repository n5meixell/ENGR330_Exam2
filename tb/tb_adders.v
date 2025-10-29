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

reg [15:0] x_in16, y_in16;
reg Cin16;
wire [15:0] rca_sum16, cla_sum16, pref_sum16;

reg [31:0] x_in32, y_in32;
reg Cin32;
wire [31:0] rca_sum32, cla_sum32, pref_sum32;

reg [63:0] x_in64, y_in64;
reg Cin64;
wire [63:0] rca_sum64, cla_sum64, pref_sum64;


RCA #(.N(8))   rca8  (.x(x_in8),  .y(y_in8),  .Cin(Cin8),  .s(rca_sum8));
cla_Nbit #(.N(8))  cla8  (.x(x_in8),  .y(y_in8),  .Cin(Cin8),  .s(cla_sum8));
prefix_adder #(.N(8)) pref8 (.x(x_in8),  .y(y_in8),  .Cin(Cin8),  .s(pref_sum8));

RCA #(.N(16))  rca16 (.x(x_in16), .y(y_in16), .Cin(Cin16), .s(rca_sum16));
cla_Nbit #(.N(16)) cla16 (.x(x_in16), .y(y_in16), .Cin(Cin16), .s(cla_sum16));
prefix_adder #(.N(16)) pref16 (.x(x_in16), .y(y_in16), .Cin(Cin16), .s(pref_sum16));

RCA #(.N(32))  rca32 (.x(x_in32), .y(y_in32), .Cin(Cin32), .s(rca_sum32));
cla_Nbit #(.N(32)) cla32 (.x(x_in32), .y(y_in32), .Cin(Cin32), .s(cla_sum32));
prefix_adder #(.N(32)) pref32 (.x(x_in32), .y(y_in32), .Cin(Cin32), .s(pref_sum32));

RCA #(.N(64))  rca64 (.x(x_in64), .y(y_in64), .Cin(Cin64), .s(rca_sum64));
cla_Nbit #(.N(64)) cla64 (.x(x_in64), .y(y_in64), .Cin(Cin64), .s(cla_sum64));
prefix_adder #(.N(64)) pref64 (.x(x_in64), .y(y_in64), .Cin(Cin64), .s(pref_sum64));

initial begin

x_in8=0;  y_in8=0;  Cin8=0;
x_in16=0; y_in16=0; Cin16=0;
x_in32=0; y_in32=0; Cin32=0;
x_in64=0; y_in64=0; Cin64=0;
#5;
    
x_in8 = 8'd5; y_in8 = 8'd10; Cin8 = 1; #10;
x_in8 = 8'd20; y_in8 = 8'd15; Cin8 = 0; #10;
x_in8 = 8'd50; y_in8 = 8'd25; Cin8 = 1; #10;
x_in8 = 8'd100; y_in8 = 8'd50; Cin8 = 0; #10;

x_in16 = 16'd100; y_in16 = 16'd200; Cin16 = 1; #10;
x_in16 = 16'd300; y_in16 = 16'd400; Cin16 = 0; #10;
x_in16 = 16'd5000; y_in16 = 16'd2500; Cin16 = 0; #10;
x_in16 = 16'd10000; y_in16 = 16'd5000;Cin16 = 1; #10;

x_in32 = 32'd1000; y_in32 = 32'd2000; Cin32 = 0; #10;
x_in32 = 32'd12345; y_in32 = 32'd6789;  Cin32 = 0; #10;
x_in32 = 32'd100000;  y_in32 = 32'd50000;  Cin32 = 1; #10;
x_in32 = 32'd25000000; y_in32 = 32'd10000000; Cin32 = 1; #10;

x_in64 = 64'd100000; y_in64 = 64'd200000;  Cin64 = 0; #10;
x_in64 = 64'd500000; y_in64 = 64'd250000; Cin64 = 1; #10;
x_in64 = 64'd1000000; y_in64 = 64'd500000;  Cin64 = 0; #10;
x_in64 = 64'd100000000; y_in64 = 64'd50000000;  Cin64 = 1; #10;
  
$display("Last Adder eqaution");

$display("8 bit RCA: %0d + %0d + Cin=%b = %0d", x_in8, y_in8, Cin8, rca_sum8);
$display("8 bit CLA: %0d + %0d + Cin=%b = %0d", x_in8, y_in8, Cin8, cla_sum8);
$display("8 bit Prefix: %0d + %0d + Cin=%b = %0d\n", x_in8, y_in8, Cin8, pref_sum8);

$display("16 bit RCA: %0d + %0d + Cin=%b = %0d", x_in16, y_in16, Cin16, rca_sum16);
$display("16 bit CLA: %0d + %0d + Cin=%b = %0d", x_in16, y_in16, Cin16, cla_sum16);
$display("16 bit Prefix: %0d + %0d + Cin=%b = %0d\n", x_in16, y_in16, Cin16, pref_sum16);

$display("32 bit RCA: %0d + %0d + Cin=%b = %0d", x_in32, y_in32, Cin32, rca_sum32);
$display("32 bit CLA: %0d + %0d + Cin=%b = %0d", x_in32, y_in32, Cin32, cla_sum32);
$display("32 bit Prefix: %0d + %0d + Cin=%b = %0d\n", x_in32, y_in32, Cin32, pref_sum32);

$display("64 bit RCA: %0d + %0d + Cin=%b = %0d", x_in64, y_in64, Cin64, rca_sum64);
$display("64 bit CLA: %0d + %0d + Cin=%b = %0d", x_in64, y_in64, Cin64, cla_sum64);
$display("64 bit Prefix: %0d + %0d + Cin=%b = %0d\n", x_in64, y_in64, Cin64, pref_sum64);

$display("Adders Tested at all widths");

    #10;
$finish;
end

endmodule

