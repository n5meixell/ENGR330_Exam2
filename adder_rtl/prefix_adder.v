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
    

    always @(*) begin
    for (i = 0; i < N; i = i + 1)begin
    p_stage[0][i] = x[i] | y[i];
    g_stage[0][i] = x[i] & y[i];
    end
    
    for (i =1; i <= 6; i = i +1) begin
    for (j = 0; j < N; j = j + 1) begin
    if (j >= (1 << (i-1))) begin
    p_stage[i][j] = p_stage[i-1][j] & p_stage[i-1][j - (1 << (i-1))];
    g_stage[i][j] = g_stage[i-1][j] | (p_stage[i-1][j] & g_stage[i-1][j - (1 << (i-1))]);
    end else begin
    p_stage[i][j] = p_stage[i-1][j];
    g_stage[i][j] = p_stage[i-1][j];
    end
    end
    end
        c[0] = Cin;
    for (k =0; k < N; k = k + 1) begin
    c[k+1] = g_stage[6][k] | (p_stage[6][k] & Cin);
    end
    
    for (i = 0; i < N; i = i + 1) begin
    s[i] = x[i] ^ y[i] ^ c[i];
    end 
    Cout = c[N];
    end
    
    
endmodule