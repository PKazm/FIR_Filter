`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2020 09:22:19 PM
// Design Name: 
// Module Name: Shift_Register_DPBRAM_tb
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


module Shift_Register_DPBRAM_tb();

    localparam WIDTH = 24;
    localparam DEPTH = 256;
    localparam ADDR_WIDTH = $clog2(DEPTH);

    reg clk = 0;
    reg rst = 0;

    reg [WIDTH - 1 : 0] data_in = 0;
    reg wen = 0;

    reg [ADDR_WIDTH - 1 : 0] addr_A;
    reg [ADDR_WIDTH - 1 : 0] addr_B;

    wire [WIDTH - 1 : 0] data_A;
    wire [WIDTH - 1 : 0] data_B;

    wire fifo_full;

    Shift_Register_DPBRAM #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    )
    UUT_Shift_Register_DPBRAM(
        .clk(clk),
        .rst(rst),

        .data_in(data_in),
        .wen(wen),

        .addr_A(addr_A),
        .addr_B(addr_B),

        .data_A(data_A),
        .data_B(data_B),

        .fifo_filled(fifo_full)
    );


    localparam CLK_PER = 10;

    always #(CLK_PER/2) clk = !clk;

    initial begin : p_the_test
        integer i, j;
        for (i = 0; i < 1000; i = i + 1) begin
            wen = 1;
            #(CLK_PER);
            wen = 0;
            data_in = data_in + 1;
            if(fifo_full == 1) begin
                for (j = 0; j < DEPTH; j = j + 1) begin
                    addr_A = j;
                    addr_B = DEPTH - j;
                    #(CLK_PER);
                end
            end
        end

        $display("DONE");
        $finish;
    end

endmodule
