`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2020 11:39:16 PM
// Design Name: 
// Module Name: FIR_Filter_DSPMult_Wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Dependencies: 
//      DSP48 Macro
//  === IP settings ====
//      0 => B*(A+D)+C
//      No Pipeline
//      D = 25
//      A = 25
//      B = 18
//      C = 48
//      Full Precision
//      No Additional Ports
//  === IP settings ====
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIR_Filter_DSPMult_Wrapper
    #(
        parameter SAMPLE_WIDTH = 24,
        parameter TAP_WIDTH = 12,
        parameter ACCUM_WIDTH = 37,      // SAMPLE_WIDTH + TAP_WIDTH + 1
        parameter RESULT_WIDTH = 37,     // SAMPLE_WIDTH + TAP_WIDTH + 1
        parameter RESULT_LSHIFT = 0     // Truncation Rounding
    )
    (
        //input wire clk,
        //input wire rst,

        input wire [SAMPLE_WIDTH - 1 : 0]   sample_A,
        input wire [SAMPLE_WIDTH - 1 : 0]   sample_B,
        input wire [TAP_WIDTH - 1 : 0]      coefficient,
        input wire [ACCUM_WIDTH - 1 : 0]    accum_in,

        output wire [ACCUM_WIDTH - 1 : 0]  dsp_result
    );


    wire [24:0] A;      // Sample_A
    wire [17:0] B;      // Coefficient/Tap
    wire [47:0] C;      // Accumulator_in
    wire [24:0] D;      // Sample_B
    wire [47:0] P;      // Result

    xbip_dsp48_macro_0 DSP48_FIR(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .P(P)
    );

    assign A = {{25 - SAMPLE_WIDTH{sample_A[SAMPLE_WIDTH - 1]}}, sample_A};   // sign extend MSB
    assign D = {{25 - SAMPLE_WIDTH{sample_B[SAMPLE_WIDTH - 1]}}, sample_B};   // sign extend MSB
    assign B = {{18 - TAP_WIDTH{coefficient[TAP_WIDTH - 1]}}, coefficient};   // sign extend MSB
    assign C = {{48 - ACCUM_WIDTH{accum_in[ACCUM_WIDTH - 1]}}, accum_in};   // sign extend MSB

    assign dsp_result = P[ACCUM_WIDTH - 1 + RESULT_LSHIFT : 0 + RESULT_LSHIFT];


endmodule
