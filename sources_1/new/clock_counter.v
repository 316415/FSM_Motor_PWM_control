`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 11:07:31
// Design Name: 
// Module Name: clock_counter
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


module clock_counter(
    input i_clk, i_reset,
    output [9:0] o_counter
    );

    reg [9:0] r_counter = 0;
    assign o_counter = r_counter;

    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) begin
            r_counter <= 0;
        end
        else begin
            if(r_counter == 999) begin
                r_counter <= 0;
            end
            else r_counter <= r_counter + 1;
        end
    end
endmodule
