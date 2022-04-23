`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kharagpur Robosoccer Student's Group 
// Engineer: Yash Agrawal
// 
// Create Date: 22:15:44 04/22/2022 
// Design Name: 
// Module Name: motordriver 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module gatedriver(pwm,a,b,c,h,d,brake);

input brake;
input [2:0]h;
input pwm;
input d;
output [1:0]a;
output [1:0]b;
output [1:0]c;

reg [1:0]k;
reg [1:0]l;
reg [1:0]m;

wire e=h[0];
wire f=h[1];
wire g=h[2];

always@(h or pwm) begin
	if(pwm) begin
		if(h==7||h==0) begin
			k=2'b11;
			l=2'b00;
			m=2'b01;
		end
		else begin
//			k[0]=(((~d&~f)|(e&f)|(d&~e))|brake);
//			k[1]=(((~d&e&~f)|(d&~e&f))|brake);
//			l[0]=(((~d&~g)|(f&g)|(d&~f))|brake);
//			l[1]=(((~d&f&~g)|(d&~f&g))|brake);
//			m[0]=(((~d&~e)|(e&g)|(d&~g))|brake);
//			m[1]=(((~d&~e&g)|(d&e&~g))|brake);

			k[0] = (((~d&e&(~f))|(d&(~e)&f))|brake);
			k[1] = ((((d)|(~f)|e)&((~d)|(~e)|f))|brake);
			l[0] = (((~d&f&(~g))|(d&(~f)&g))|brake);
			l[1] = ((((d)|(~g)|f)&((~d)|(~f)|g))|brake);
			m[0] = (((~d&g&(~e))|(d&(~g)&e))|brake);
			m[1] = ((((d)|(~e)|g)&((~d)|(~g)|e))|brake);
		end
	end
	else begin
		if(brake==1) begin
			k=2'b11;
			l=2'b11;
			m=2'b11;
		end
		else begin
			k=2'b01;
			l=2'b01;
			m=2'b01;
		end
	end
end
assign a=k;
assign b=l;
assign c=m;
endmodule