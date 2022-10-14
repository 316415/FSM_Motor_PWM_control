`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 12:01:39
// Design Name: 
// Module Name: clock_divider_FND
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


module clock_divider_FND(
    input i_clk, i_reset,
    output o_clk
    );


    reg r_clk = 0;
    reg [15:0] r_counter = 0;
    assign o_clk = r_clk;
    
    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) begin
            r_clk <= 1'b0;
            r_counter <= 0;
        end
        else begin
            if(r_counter == 49999) begin
                r_counter <= 0;
                r_clk <= ~r_clk;
            end
            else r_counter <= r_counter + 1;
        end
    end
endmodule
