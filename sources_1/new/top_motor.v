`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 13:24:47
// Design Name: 
// Module Name: top_motor
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


module top_motor(
    input i_clk, i_reset,
    input [2:0] i_button,
    output o_pwm,
    output [3:0] o_Led,
    output [7:0] o_font,
    output o_position
    );

    wire w_clk_1MHz;

    clock_divider clk_div(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk_1MHz)
    );

    wire [9:0] w_counter_pwm;

    clock_counter clk_cnt(
    .i_clk(w_clk_1MHz),
    .i_reset(i_reset),
    .o_counter(w_counter_pwm)
    );

    wire [3:0] w_pwm;

    PWM pwm(
    .i_counter(w_counter_pwm),
    .o_pwm(w_pwm)
    );

    MUX_4x1 mux_4x1(
    .i_pwm(w_pwm),
    .i_pwm_state(w_pwm_state),
    .o_pwm(o_pwm)
    );

    wire w_clk_1kHz;

    clock_divider_FND clk_div_fnd(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk_1kHz)
    );

    wire [2:0] w_button;

    button upButton(
    .i_clk(w_clk_1MHz),
    .i_reset(i_reset),
    .i_button(i_button[0]),
    .o_button(w_button[0])
    );

    button downButton(
    .i_clk(w_clk_1MHz),
    .i_reset(i_reset),
    .i_button(i_button[1]),
    .o_button(w_button[1])
    );

    button offButton(
    .i_clk(w_clk_1MHz),
    .i_reset(i_reset),
    .i_button(i_button[2]),
    .o_button(w_button[2])
    );

    wire [2:0] w_pwm_state;

    FSM_motor fsm_motor(
    .i_button(w_button),
    .i_reset(i_reset),
    .i_clk(w_clk_1MHz),
    .o_pwm_state(w_pwm_state)
    );

    wire [3:0] w_Fnd;

    display_led_state display_led_state(
    .i_pwm_state(w_pwm_state),
    .o_Led(o_Led)
    );

    display_fnd_state display_fnd_state(
    .i_pwm_state(w_pwm_state),
    .o_Fnd(w_Fnd)
    );

    FND_position_decoder FND_position(
    .i_clk(w_clk_1kHz),
    .o_position(o_position)
    );

    BCDtoFND_decoder BCDtoFND_decoder(
        .i_reset(i_reset),
    .i_Fnd(w_Fnd),
    .o_font(o_font)
    );
endmodule
