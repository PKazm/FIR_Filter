`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2020 11:39:47 PM
// Design Name: 
// Module Name: FIR_Filter
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


module FIR_Filter
    #(
        parameter SAMPLE_WIDTH = 24,
        parameter TAP_WIDTH = 18,
        parameter FILTER_LENGTH = 77,
        parameter ACCUM_WIDTH = SAMPLE_WIDTH + 21,
        parameter ACCUM_LSHIFT = 0
    )
    (
        input wire clk,
        input wire rst,

        input wire [SAMPLE_WIDTH - 1 : 0] data_in,
        input wire data_in_wen,

        output wire [SAMPLE_WIDTH - 1 : 0] data_out,
        output wire data_out_valid
    );

    localparam FILTER_STATES = (FILTER_LENGTH - 1) / 2 + 1;     // Assumes Type 1
    localparam PIPELINE_LENGTH = 5;

    reg [TAP_WIDTH - 1 : 0] filter_taps[(FILTER_LENGTH - 1)/2: 0];
    initial begin : pi_init_arrays
        $readmemh("C:/Github_Repos/Zybo_Synthesizer_Experiments/EXTRA_FILES/Octave/Filter_Taps.hex", filter_taps);
    end


    reg [ACCUM_WIDTH - 1 : 0] filter_accum = 0;
    reg [ACCUM_WIDTH - 1 : 0] filter_accum_freeze = 0;
    reg filter_out_valid = 0;

    assign data_out = filter_accum[ACCUM_WIDTH - 1 : ACCUM_WIDTH - SAMPLE_WIDTH];
    assign data_out_valid = filter_out_valid;



    reg [$clog2(FILTER_STATES + 1) : 0] state_cntr = 0;
    reg [$clog2(FILTER_STATES + 1) : 0] state_cntr_d1 = 0;
    wire [ACCUM_WIDTH - 1 : 0] mult_result;

    reg [PIPELINE_LENGTH - 1 : 0] pipe_en = 0;
    reg [TAP_WIDTH - 1 : 0] temp_tap = 0;
    reg [SAMPLE_WIDTH - 1 : 0] temp_sample_A = 0;
    reg [SAMPLE_WIDTH - 1 : 0] temp_sample_B = 0;

    FIR_Filter_DSPMult_Wrapper #(
        .SAMPLE_WIDTH(SAMPLE_WIDTH),
        .TAP_WIDTH(TAP_WIDTH),
        .ACCUM_WIDTH(ACCUM_WIDTH),      // SAMPLE_WIDTH + TAP_WIDTH + 1
        .RESULT_WIDTH(ACCUM_WIDTH),     // SAMPLE_WIDTH + TAP_WIDTH + 1
        .RESULT_LSHIFT(ACCUM_LSHIFT)               // Truncation Rounding
    )
    FIR_DSPmult(
        .sample_A(temp_sample_A),
        .sample_B(temp_sample_B),
        .coefficient(temp_tap),
        .accum_in(filter_accum),

        .dsp_result(mult_result)
    );


    wire [SAMPLE_WIDTH - 1 : 0] fifo_o_A;
    wire [SAMPLE_WIDTH - 1 : 0] fifo_o_B;
    wire fifo_full;

    Shift_Register_DPBRAM #(
        .WIDTH(SAMPLE_WIDTH),
        .DEPTH(FILTER_LENGTH),
        .REGISTER_ADDRESS(0),
        .PIPELINE_ADDRESS(1),
        .REGISTER_DATA_OUT(1)
    )
    Shift_Register_DPBRAM_0(
        .clk(clk),
        .rst(rst),

        .data_in(data_in),
        .wen(data_in_wen),

        .addr_A(addr_A_shift),
        .addr_B(addr_B_shift),

        .data_A(fifo_o_A),
        .data_B(fifo_o_B),

        .fifo_filled(fifo_full)
    );

    reg [$clog2(FILTER_LENGTH) - 1 : 0] addr_A_shift;
    reg [$clog2(FILTER_LENGTH) - 1 : 0] addr_B_shift;

    always @(state_cntr) begin
        addr_A_shift <= state_cntr - 1;
        addr_B_shift <= FILTER_LENGTH - (state_cntr);
    end

    //=========================================================================
    //=========================================================================
    //
    //                              Stage 1
    // 
    //
    //=========================================================================
    //=========================================================================
    //=========================================================================
    //=========================================================================

    always @(posedge clk) begin : p_filter_control
        integer i;

        for (i = 1; i < PIPELINE_LENGTH; i = i + 1) begin
            pipe_en[i] <= pipe_en[i - 1];
        end

        if(rst == 1) begin
            filter_out_valid <= 0;
            state_cntr <= 0;
            pipe_en[0] <= 0;
        end
        else begin
            if(data_in_wen == 1) begin
                filter_out_valid <= 0;
                state_cntr <= FILTER_STATES;
            end
            else begin
                if(state_cntr == 0) begin
                    pipe_en[0] <= 0;
                    
                    if(pipe_en[PIPELINE_LENGTH - 1] == 0) begin
                        if(fifo_full == 1) begin
                            filter_out_valid <= 1;
                        end
                    end
                end
                else begin
                    state_cntr <= state_cntr - 1;
                    pipe_en[0] <= 1;
                end

            end
        end
    end

    always @(posedge clk) begin : p_filter_tap_ctrl

        state_cntr_d1 <= state_cntr;

        if(rst == 1) begin
            temp_tap <= 0;
        end
        else begin
            if(data_in_wen == 1) begin
                temp_tap <= 0;
            end
            else begin
                if(pipe_en[1] == 1) begin
                    temp_tap <= filter_taps[state_cntr_d1];
                end
                else begin
                    temp_tap <= 0;
                end
            end
        end
    end

    always @(data_in_wen, pipe_en, fifo_o_A, fifo_o_B) begin : p_comb_filter_sample_ctrl
        if(data_in_wen == 1) begin
            temp_sample_A <= 0;
            temp_sample_B <= 0;
        end
        else begin
            if(pipe_en[2] == 1) begin
                temp_sample_A <= fifo_o_A;
            end
            else begin
                temp_sample_A <= 0;
            end

            if(pipe_en[2] == 1) begin
                if(pipe_en[3] == 0) begin
                    // Center Tap only applies to the 1 middle sample: X * A + X * 0 == X * (A + 0)
                    temp_sample_B <= 0;
                end
                else begin
                    // All other taps are applied to 2 samples: X * A + X * B == X * (A + B)
                    temp_sample_B <= fifo_o_B;
                end
            end
            else begin
                temp_sample_B <= 0;
            end
        end
    end

    always @(posedge clk) begin : p_filter_accum_ctrl
        if(rst == 1) begin
            filter_accum <= 0;
        end
        else begin
            if(data_in_wen == 1) begin
                filter_accum <= 0;
                filter_accum_freeze <= filter_accum;
            end
            else begin
                if(pipe_en[1] == 1 || pipe_en[2] == 1) begin
                    if(fifo_full == 1) begin
                        filter_accum <= mult_result;
                    end
                    else begin
                        filter_accum <= 0;
                    end
                end
            end
        end
    end

endmodule
