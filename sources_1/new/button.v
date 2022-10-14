`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 10:47:40
// Design Name: 
// Module Name: button
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


module button(
    input i_clk, i_reset, i_button,
    output o_button
    );

    parameter TRUE = 1'b1, FALSE = 1'b0, DEBOUNCE = 5_000,
                RELEASED = 1'b0, PUSHED = 1'b1;
    reg [31:0] r_counter = 0;
    reg r_button, prevState;
    assign o_button = r_button;


    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) begin
            r_button <= FALSE;
            prevState <= RELEASED;
            r_counter <= 0;
        end
        else begin
            if(i_button == PUSHED && prevState == RELEASED &&  r_counter < DEBOUNCE) begin
                r_counter <= r_counter + 1;
                r_button <= FALSE;
            end
            else if(i_button == PUSHED && prevState == RELEASED && DEBOUNCE == r_counter) begin
                prevState <= PUSHED;
                r_counter <= 0;
                r_button <= FALSE;
            end
            else if(i_button == RELEASED && prevState == PUSHED && r_counter < DEBOUNCE) begin
                r_counter <= r_counter + 1;
                r_button <= FALSE;
            end
            else if(i_button == RELEASED && prevState == PUSHED && DEBOUNCE == r_counter) begin
                r_counter <= 0;
                prevState <= RELEASED;
                r_button <= TRUE;
            end
            else r_button <= FALSE;
        end
    end
endmodule
