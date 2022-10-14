`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 14:22:59
// Design Name: 
// Module Name: display_fnd_state
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


module display_fnd_state(
    input [2:0] i_pwm_state,
    output [3:0] o_Fnd
    );

    reg [3:0] r_Fnd;
    assign o_Fnd = r_Fnd;

    always @(*) begin
        case(i_pwm_state)
            3'b000 : r_Fnd <= 4'd0;
            3'b001 : r_Fnd <= 4'd1;
            3'b010 : r_Fnd <= 4'd2;
            3'b011 : r_Fnd <= 4'd3;
            3'b100 : r_Fnd <= 4'd4;
        endcase
    end
endmodule
