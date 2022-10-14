`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 11:15:45
// Design Name: 
// Module Name: PWM
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


module PWM(
    input [9:0] i_counter,
    output [3:0] o_pwm
    );

    assign o_pwm[0] = (i_counter < 300) ? 1'b1 : 1'b0;
    assign o_pwm[1] = (i_counter < 600) ? 1'b1 : 1'b0;
    assign o_pwm[2] = (i_counter < 800) ? 1'b1 : 1'b0;
    assign o_pwm[3] = (i_counter < 999) ? 1'b1 : 1'b0;
endmodule
