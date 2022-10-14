`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 10:48:10
// Design Name: 
// Module Name: FSM_motor
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


module FSM_motor(
    input [2:0] i_button,
    input i_reset, i_clk,
    output [2:0] o_pwm_state
    );

    parameter TRUE = 1'b1, FALSE = 1'b0;
    parameter PWM0 = 3'b000, PWM1 = 3'b001, PWM2 = 3'b010, PWM3 = 3'b011, PWM4 = 3'b100;
    reg [2:0] curState = PWM0, nextState, r_pwm_state = 0;
    assign o_pwm_state = r_pwm_state;
    
    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) begin
            curState <= PWM0;
        end
        else curState <= nextState;
    end

    always @(curState or i_button or i_clk) begin
        case (curState)
            PWM0:
            if(i_button[0] == TRUE) begin
                 nextState <= PWM1;
            end
            else nextState <= PWM0;
            
            PWM1:
            if(i_button[0] == TRUE) begin
                nextState <= PWM2;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= PWM0;
            end
            else if(i_button[2] == TRUE) begin
                nextState <= PWM0;
            end
            else nextState <= PWM1;

            PWM2:
            if(i_button[0] == TRUE) begin
                nextState <= PWM3;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= PWM1;
            end
            else if(i_button[2] == TRUE) begin
                nextState <= PWM0;
            end
            else nextState <= PWM2;

            PWM3:
            if(i_button[0] == TRUE) begin
                nextState <= PWM4;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= PWM2;
            end
            else if(i_button[2] == TRUE) begin
                nextState <= PWM0;
            end
            else nextState <= PWM3;

            PWM4:
            if(i_button[0] == TRUE) begin
                nextState <= PWM4;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= PWM3;
            end
            else if(i_button[2] == TRUE) begin
                nextState <= PWM0;
            end
            else nextState <= PWM4;

            default: nextState <= PWM0;
        endcase
    end

    always @(curState) begin
        case (curState)
            PWM0 : r_pwm_state <= 3'b000;
            PWM1 : r_pwm_state <= 3'b001;
            PWM2 : r_pwm_state <= 3'b010;
            PWM3 : r_pwm_state <= 3'b011;
            PWM4 : r_pwm_state <= 3'b100;
            default: r_pwm_state <= 3'b000;
        endcase
    end
endmodule
