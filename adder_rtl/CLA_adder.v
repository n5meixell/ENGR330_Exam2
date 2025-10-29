`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2025 11:55:08 AM
// Design Name: 
// Module Name: CLA_adder
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


module CLA_adder(
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

module cla_4bit(
input [3:0] x,
input [3:0] y,
input Cin,
output[3:0] s,
output Cout
);

wire [3:0] p, g;
wire [4:0] c;

assign c[0] = Cin;
assign p = x ^ y;
assign g = x & y;
assign c[1] = g[0] | (p[0] & c[0]);
assign c[2] = g[1] | (p[1] & c[1]);
assign c[3] = g[2] | (p[2] & c[2]);
assign c[4] = g[3] | (p[3] & c[3]);

assign s = p ^ c[3:0];
assign Cout = c[4];
endmodule

module cla_Nbit #(
parameter N = 8,
parameter size = 4
)(
input [N-1:0] x,
input [N-1:0] y,
input Cin,
output [N-1:0] s,
output Cout
);
localparam integer blocks = N / size;
wire [blocks:0] c;
assign c[0] = Cin;
genvar i;
generate
for (i = 0; i < blocks; i = i +1) begin
cla_4bit cla (
.x(x[(i*size)+3 : i *size]),
.y(y[(i*size)+3 : i*size]),
.Cin(c[i]),
.s(s[(i*size)+3 : i*size]),
.Cout(c[i+1])
);
end
endgenerate

assign Cout = c[blocks];
endmodule
