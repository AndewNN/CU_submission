`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 10:48:53 PM
// Design Name: 
// Module Name: problem1
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


module problem1(
    input wire clock, up, down, set9, set0,
    output wire [3:0] outt,
    output wire coutt, boutt
    );
reg [3:0] out;
reg cout, bout;
initial begin
    {cout,bout,out} = 0;
end

assign {coutt,boutt} = {cout,bout};
assign outt[3:0] = out[3:0];

always@(posedge clock)begin
    /*out <= ((set9 || set0)? out : ((up && !down)? ((out == 9)? 0 : out + 1) : (!up && down)? ((out == 0)? 9 : out - 1) : out));
    cout <= ((set9 || set0)? cout : ((out == 9 && up && !down)? ((bout == 0)? 1:0) : (out == 0 && down && !up)? 0 : cout));
    bout <= ((set9 || set0)? bout : ((out == 0 && down && !up)? ((cout == 0)? 1:0) : (out == 9 && up && !down)? 0 : bout));*/
    out <= ((set9 || set0)? ((set9)? 9 : 0) : ((up && !down)? ((out == 9)? 0 : out + 1) : (!up && down)? ((out == 0)? 9 : out - 1) : out));
    cout <= ((set9 || set0)? cout : ((out == 9 && up && !down)? 1 : 0));
    bout <= ((set9 || set0)? bout : ((out == 0 && down && !up)? 1 : 0));
  
end
endmodule
