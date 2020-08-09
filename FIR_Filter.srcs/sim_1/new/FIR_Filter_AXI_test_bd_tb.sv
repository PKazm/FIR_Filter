`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2020 12:22:39 PM
// Design Name: 
// Module Name: FIR_Filter_AXI_test_bd_tb
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


import axi_vip_pkg::*;
import FIR_Filter_AXI_test_bd_axi_vip_0_0_pkg::*;


bit[31:0]  addr, base_addr = 32'h0000_0000, switch_state;
xil_axi_resp_t resp;

module FIR_Filter_AXI_test_bd_tb();


    FIR_Filter_AXI_test_bd_axi_vip_0_0_mst_t      master_agent;

    localparam CLK_PER = 10;


    reg clk = 0;
    reg rst = 0;
    wire rstn;
    wire interrupt;

    always #(CLK_PER/2) clk <= !clk;
    assign rstn = ~rst;

    FIR_Filter_AXI_test_bd_wrapper UUT_FIR_Filter_AXI_test_bd_wrapper(
        .clk(clk),
        .rst(rst),
        .rstn(rstn),
        .interrupt(interrupt)
    );

    localparam SAMPLE_COUNT = 28801;
    localparam SAMPLE_WIDTH = 24;
    reg [SAMPLE_WIDTH - 1 : 0] samples[SAMPLE_COUNT - 1 : 0];
    initial begin
        $readmemh("C:/Github_Repos/FIR_Filter/EXTRA_FILES/Octave/freq_sweep.hex", samples);
    end

    
    bit[SAMPLE_WIDTH - 1 : 0]  dataw, datar, stat;

    integer i;

    initial begin : pi_the_test

        $display("loading master");

        master_agent = new("master vip agent", UUT_FIR_Filter_AXI_test_bd_wrapper.FIR_Filter_AXI_test_bd_i.axi_vip_0.inst.IF);

        master_agent.set_verbosity(400);
        // Step 5 - Start the agent
        master_agent.start_master();

        rst = 1;

        #(CLK_PER * 10);

        rst = 0;

        $display("starting");

        #(CLK_PER * 10);

        for(i = 0; i < SAMPLE_COUNT; i = i + 1) begin
            dataw = samples[i];
            master_agent.AXI4LITE_WRITE_BURST(base_addr + 2, 0, dataw, resp);
            master_agent.AXI4LITE_READ_BURST(base_addr + 1, 0, stat, resp);
            if(stat[5] == 1) begin
                // filter FIFO is full and output is invalid, wait until interrupt negedge
                wait (interrupt == 1);
                master_agent.AXI4LITE_READ_BURST(base_addr + 3, 0, datar, resp);
            end
        end

    end


endmodule
