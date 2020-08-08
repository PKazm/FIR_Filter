`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2020 08:41:47 PM
// Design Name: 
// Module Name: Shift_Register_DPBRAM
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


module Shift_Register_DPBRAM
    #(
        parameter WIDTH = 24,
        parameter DEPTH = 256,
        parameter REGISTER_ADDRESS = 0,
        parameter PIPELINE_ADDRESS = 0,
        parameter REGISTER_DATA_OUT = 0
    )
    (
        input wire clk,
        input wire rst,

        input wire [WIDTH - 1 : 0] data_in,
        input wire wen,

        input wire [$clog2(DEPTH) - 1 : 0] addr_A,
        input wire [$clog2(DEPTH) - 1 : 0] addr_B,

        output wire [WIDTH - 1 : 0] data_A,
        output wire [WIDTH - 1 : 0] data_B,

        output wire fifo_filled
    );

    localparam ADDR_WIDTH = $clog2(DEPTH);

    reg [WIDTH - 1 : 0] data_buffer [DEPTH - 1 : 0];
    initial begin : pi_init_arrays
        integer i;
        for(i = 0; i < WIDTH; i = i + 1) begin
            data_buffer[i] <= 0;
        end
    end


    reg fifo_full = 0;
    reg fifo_full_d1 = 0;
    reg [ADDR_WIDTH - 1 : 0] fifo_pos = 0;
    reg [ADDR_WIDTH - 1 : 0] addr_A_pos;
    reg [ADDR_WIDTH - 1 : 0] addr_B_pos;
    reg [WIDTH - 1 : 0] data_A_ram;
    reg [WIDTH - 1 : 0] data_B_ram;
    reg [WIDTH - 1 : 0] data_A_out;
    reg [WIDTH - 1 : 0] data_B_out;

    assign fifo_filled = fifo_full_d1;
    assign data_A = data_A_out;
    assign data_B = data_B_out;

    // Generate Data Out Address logic
    generate

        
        reg [ADDR_WIDTH - 1 : 0] addr_A_reg;
        reg [ADDR_WIDTH - 1 : 0] addr_B_reg;

        if(REGISTER_ADDRESS == 1) begin
            always @(posedge clk) begin
                addr_A_reg <= addr_A;
                addr_B_reg <= addr_B;
            end
        end
        else begin
            always @(addr_A, addr_B) begin
                addr_A_reg <= addr_A;
                addr_B_reg <= addr_B;
            end
        end

        reg [ADDR_WIDTH : 0] addr_A_temp;
        reg [ADDR_WIDTH : 0] addr_B_temp;

        if(PIPELINE_ADDRESS == 1) begin
            always @(posedge clk) begin : p_gen_YES_REG_addr
            

                addr_A_temp = fifo_pos + addr_A_reg;
                if(addr_A_temp >= DEPTH) begin
                    addr_A_pos <= addr_A_temp - DEPTH;
                end
                else begin
                    addr_A_pos <= addr_A_temp;
                end

                addr_B_temp = fifo_pos + addr_B_reg;
                if(addr_B_temp >= DEPTH) begin
                    addr_B_pos <= addr_B_temp - DEPTH;
                end
                else begin
                    addr_B_pos <= addr_B_temp;
                end
            end
        end
        else begin
            always @(fifo_pos, addr_A_reg, addr_B_reg) begin : p_gen_NO_REG_addr
                addr_A_pos = fifo_pos + addr_A_reg;
                if(addr_A_pos >= DEPTH) begin
                    addr_A_pos = addr_A_pos - DEPTH;
                end

                addr_B_pos = fifo_pos + addr_B_reg;
                if(addr_B_pos >= DEPTH) begin
                    addr_B_pos = addr_B_pos - DEPTH;
                end
            end
        end
    endgenerate

    // Generate Data out logic
    generate
        if(REGISTER_DATA_OUT == 1) begin
            always @(posedge clk) begin : p_gen_YES_REG_data_o
                if(rst == 1) begin
                    data_A_out <= 0;
                    data_B_out <= 0;
                end
                else begin
                    if(fifo_full_d1 == 0 && addr_A_pos >= fifo_pos) begin
                        data_A_out = 0;
                    end
                    else begin
                        data_A_out = data_A_ram;
                    end

                    if(fifo_full_d1 == 0 && addr_B_pos >= fifo_pos) begin
                        data_B_out = 0;
                    end
                    else begin
                        data_B_out = data_B_ram;
                    end
                end
            end
        end
        else begin
            always @(fifo_full_d1, fifo_pos, addr_A_pos, addr_B_pos, data_A_ram, data_B_ram) begin : p_gen_NO_REG_data_o

                if(fifo_full_d1 == 0 && addr_A_pos >= fifo_pos) begin
                    data_A_out = 0;
                end
                else begin
                    data_A_out = data_A_ram;
                end

                if(fifo_full_d1 == 0 && addr_B_pos >= fifo_pos) begin
                    data_B_out = 0;
                end
                else begin
                    data_B_out = data_B_ram;
                end
            end
        end
    endgenerate

    
    reg [ADDR_WIDTH - 1 : 0] addr_A_use;

    always @(wen, fifo_pos, addr_A_pos) begin
        if(wen == 1) begin
            addr_A_use <= fifo_pos;
        end
        else begin
            addr_A_use <= addr_A_pos;
        end
    end
    

    always @(posedge clk) begin : p_the_process


        if(rst == 1) begin
            fifo_full <= 0;
            fifo_full_d1 <= 0;
            fifo_pos <= 0;
        end
        else begin

            if(wen == 1) begin
                data_buffer[addr_A_use] <= data_in;
            end
            else begin
                data_A_ram <= data_buffer[addr_A_use];
                data_B_ram <= data_buffer[addr_B_pos];
            end

            if(wen == 1) begin
                fifo_full_d1 <= fifo_full;
                if(fifo_pos == DEPTH - 1) begin
                    fifo_pos <= 0;
                end
                else begin
                    fifo_pos <= fifo_pos + 1;
                end
            end

            if(fifo_pos == DEPTH - 1) begin
                fifo_full <= 1;
            end
        end
    end
endmodule
