`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2020 06:25:06 PM
// Design Name: 
// Module Name: FIR_Filter_tb
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


module FIR_Filter_tb();

    localparam SAMPLE_WIDTH = 24;
    localparam TAP_WIDTH = 18;
    localparam FILTER_LENGTH = 83;
    localparam ACCUM_WIDTH = SAMPLE_WIDTH + 21;        // SAMPLE_WIDTH + Quantized Gain Bits
    localparam ACCUM_LSHIFT = 0;

    reg clk = 0;
    reg rst = 0;

    reg [SAMPLE_WIDTH - 1 : 0] data_in = 0;
    reg data_in_wen = 0;
    wire [SAMPLE_WIDTH - 1 : 0] data_out;
    wire data_out_valid;

    FIR_Filter #(
        .SAMPLE_WIDTH(SAMPLE_WIDTH),
        .TAP_WIDTH(TAP_WIDTH),
        .FILTER_LENGTH(FILTER_LENGTH),
        .ACCUM_WIDTH(ACCUM_WIDTH),
        .ACCUM_LSHIFT(ACCUM_LSHIFT)
    )
    UUT_FIR_Filter(
        .clk(clk),
        .rst(rst),

        .data_in(data_in),
        .data_in_wen(data_in_wen),
        .data_out(data_out),
        .data_out_valid(data_out_valid)
    );

    localparam SAMPLE_COUNT = 28801;
    localparam CLK_PER = 10;
    //localparam CLK_PER_SAMPLE = 2083;
    localparam CLK_PER_SAMPLE = 768;

    reg [SAMPLE_WIDTH - 1 : 0] samples[SAMPLE_COUNT - 1 : 0];
    initial begin
        $readmemh("C:/Github_Repos/Zybo_Synthesizer_Experiments/EXTRA_FILES/Octave/freq_sweep.hex", samples);
    end
    

    reg [SAMPLE_WIDTH - 1 : 0] filt_result = 0;

    always #(CLK_PER/2) clk <= !clk;

    integer sample_cnt;
    integer i;
    initial begin : pi_the_test

        for(i = 0; i < SAMPLE_COUNT; i = i + 1) begin
            data_in = samples[i];
            data_in_wen = 1;
            #CLK_PER;
            data_in_wen = 0;
            #(CLK_PER * CLK_PER_SAMPLE);
        end

        $display("DONE");
        $finish;
    end

    always @(posedge data_out_valid) begin
        filt_result = data_out;
    end

endmodule
