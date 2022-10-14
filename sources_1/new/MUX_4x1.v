`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 11:38:08
// Design Name: 
// Module Name: MUX_4x1
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


module MUX_4x1(
    input [3:0] i_pwm,
    input [2:0] i_pwm_state,
    output o_pwm
    );

    reg r_pwm;
    assign o_pwm = r_pwm;

    always @(*) begin
        r_pwm <= 1'b0;
        case(i_pwm_state)
            3'b000 : r_pwm <= 1'b0;
            3'b001 : r_pwm <= i_pwm[0];
            3'b010 : r_pwm <= i_pwm[1];
            3'b011 : r_pwm <= i_pwm[2];
            3'b100 : r_pwm <= i_pwm[3];
        endcase
    end
endmodule
