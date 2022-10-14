`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 14:23:14
// Design Name: 
// Module Name: display_led_state
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


module display_led_state(
    input [2:0] i_pwm_state,
    output [3:0] o_Led
    );

    reg [3:0] r_Led;
    assign o_Led = r_Led;

    always @(*) begin
        case(i_pwm_state)
            3'b000 : r_Led <= 4'b0000;
            3'b001 : r_Led <= 4'b1000;
            3'b010 : r_Led <= 4'b1100;
            3'b011 : r_Led <= 4'b1110;
            3'b100 : r_Led <= 4'b1111;
        endcase
    end
endmodule
