`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2020 01:40:47 PM
// Design Name: 
// Module Name: FIR_Filter_AXI
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


module FIR_Filter_AXI
    #(
        parameter AXI_D_WIDTH = 32,
        parameter AXI_A_WIDTH = 32,
        parameter AXI_ID_WIDTH = 12,
        parameter SAMPLE_WIDTH = 24,
        parameter TAP_WIDTH = 18,
        parameter FILTER_LENGTH = 77,
        parameter ACCUM_WIDTH = SAMPLE_WIDTH + 21       // SAMPLE_WIDTH + ceil(log2(sum(coefficients)))
        //parameter ACCUM_LSHIFT = 0
    )
    (
        input wire clk,
        input wire rst,

        output wire interrupt,


        //=====================================================================
        // AXI Write Address Channel
        input wire [AXI_ID_WIDTH - 1 : 0]       S_AXI4_AWID,
        input wire [AXI_A_WIDTH - 1 : 0]        S_AXI4_AWADDR,
        //input wire [7 : 0]                      S_AXI4_AWLEN,
        //input wire [2 : 0]                      S_AXI4_AWSIZE,
        //input wire [1 : 0]                      S_AXI4_AWBURST,
        //input wire                              S_AXI4_AWLOCK,
        //input wire [3 : 0]                      S_AXI4_AWCACHE,
        input wire [2 : 0]                      S_AXI4_AWPROT,
        //input wire [3 : 0]                      S_AXI4_AWQOS,
        //input wire [3 : 0]                      S_AXI4_AWREGION,
        //input wire                              S_AXI4_AWUSER,
        input wire                              S_AXI4_AWVALID,
        output wire                             S_AXI4_AWREADY,

        //=====================================================================
        // AXI Write Data Channel
        input wire [AXI_ID_WIDTH - 1 : 0]       S_AXI4_WID,
        input wire [AXI_D_WIDTH - 1 : 0]        S_AXI4_WDATA,
        input wire [(AXI_D_WIDTH / 8) - 1 : 0]  S_AXI4_WSTRB,
        //input wire                              S_AXI4_WLAST,
        //input wire                              S_AXI4_WUSER,
        input wire                              S_AXI4_WVALID,
        output wire                             S_AXI4_WREADY,

        //=====================================================================
        // AXI Write Response Channel
        output wire [AXI_ID_WIDTH - 1 : 0]      S_AXI4_BID,
        output wire [1 : 0]                     S_AXI4_BRESP,
        //output wire                             S_AXI4_BUSER,
        output wire                             S_AXI4_BVALID,
        input wire                              S_AXI4_BREADY,

        //=====================================================================
        // AXI Read Address Channel
        input wire [AXI_ID_WIDTH - 1 : 0]       S_AXI4_ARID,
        input wire [AXI_A_WIDTH - 1 : 0]        S_AXI4_ARADDR,
        //input wire [7 : 0]                      S_AXI4_ARLEN,
        //input wire [2 : 0]                      S_AXI4_ARSIZE,
        //input wire [1 : 0]                      S_AXI4_ARBURST,
        //input wire                              S_AXI4_ARLOCk,
        //input wire [3 : 0]                      S_AXI4_ARCACHE,
        input wire [2 : 0]                      S_AXI4_ARPROT,
        //input wire [3 : 0]                      S_AXI4_ARQOS,
        //input wire [3 : 0]                      S_AXI4_ARREGION,
        //input wire                              S_AXI4_ARUSER,
        input wire                              S_AXI4_ARVALID,
        output wire                             S_AXI4_ARREADY,

        //=====================================================================
        // AXI Read Data Channel
        output wire [AXI_ID_WIDTH - 1 : 0]      S_AXI4_RID,
        output wire [AXI_D_WIDTH - 1 : 0]       S_AXI4_RDATA,
        output wire [1 : 0]                     S_AXI4_RRESP,
        //output wire                             S_AXI4_RLAST,
        //output wire                             S_AXI4_RUSER,
        output wire                             S_AXI4_RVALID,
        input wire                              S_AXI4_RREADY
    );

    localparam ACCUM_LSHIFT = 0;

    wire enable;    // connects to control register bit
    wire samples_full;

    reg [SAMPLE_WIDTH - 1 : 0] data_in;
    reg data_in_wen;

    wire [SAMPLE_WIDTH - 1 : 0] data_out;
    wire data_out_valid;

    FIR_Filter #(
        .SAMPLE_WIDTH(SAMPLE_WIDTH),
        .TAP_WIDTH(TAP_WIDTH),
        .FILTER_LENGTH(FILTER_LENGTH),
        .ACCUM_WIDTH(ACCUM_WIDTH),
        .ACCUM_LSHIFT(ACCUM_LSHIFT)
    )
    FIR_Filter_T1 (
        .clk(clk),
        .rst(rst),

        .enable(enable),
        .samples_full(samples_full),

        .data_in(data_in),
        .data_in_wen(data_in_wen),

        .data_out(data_out),
        .data_out_valid(data_out_valid)
    );


    reg [7:0] control_reg = 0;
    reg [7:0] status_reg = 0;

    assign interrupt = status_reg[7];

    localparam CTRL_REG_ADR = 4'h0;
    localparam STAT_REG_ADR = 4'h1;
    localparam DATI_REG_ADR = 4'h2;
    localparam DATO_REG_ADR = 4'h3;

    // XX_IID are used as an internal 1 depth transaction ID buffer
    // This is to ensure proper operation between channels with AXI LITE (otherwise XXID would be used)
    reg AW_IID = 0, W_IID = 0, B_IID = 0, AR_IID = 0, R_IID = 0;

    reg data_read_pulse = 0;


    //=========================================================================
    //  AXI Write Address Logic
    //=========================================================================

    reg [AXI_ID_WIDTH - 1 : 0]  AWID_reg;
    reg [3 : 0]                 AWADDR_reg = 0;
    reg [2 : 0]                 AWPROT_reg = 0;
    reg                         AWVALID_reg = 0;
    reg                         AWREADY_reg = 0;

    assign S_AXI4_AWREADY = AWREADY_reg;

    always @(posedge clk) begin : p_AXI_Write_Address
        if(rst == 1) begin
            AWREADY_reg <= 0;
            AW_IID <= 0;
        end
        else begin
            
            AWVALID_reg <= S_AXI4_AWVALID;
            
            if(AWREADY_reg == 1 && S_AXI4_AWVALID == 1) begin
                AWID_reg        <= S_AXI4_AWID;
                AWADDR_reg      <= S_AXI4_AWADDR[3:0];
                AWPROT_reg      <= S_AXI4_AWPROT;
                AW_IID          <= ~AW_IID;
                AWREADY_reg     <= 0;
            end
            else if(AW_IID == B_IID) begin
                // received address, wait for write response to confirm
                AWREADY_reg <= 1;
            end

            //if(AW_IID == B_IID) begin
            //    // received address, wait for response confirm
            //    AWREADY_reg <= 1;
            //end
            //else begin
            //    AWREADY_reg <= 0;
            //end
            
        end
    end

    //=========================================================================
    //  AXI Write Data Logic
    //=========================================================================

    reg [AXI_ID_WIDTH - 1 : 0]      WID_reg;
    reg [AXI_D_WIDTH - 1 : 0]       WDATA_reg = 0;
    reg [(AXI_D_WIDTH / 8) - 1 : 0] WSTRB_reg = 0;
    reg                             WVALID_reg = 0;
    reg                             WREADY_reg = 0;

    assign S_AXI4_WREADY = WREADY_reg;

    always @(posedge clk) begin : p_AXI_Write_Data
        if(rst == 1) begin
            WREADY_reg <= 0;
            W_IID <= 0;
        end
        else begin
            
            WVALID_reg <= S_AXI4_WVALID;
            
            if(WREADY_reg == 1 && S_AXI4_WVALID == 1) begin
                WID_reg     <= S_AXI4_WID;
                WDATA_reg   <= S_AXI4_WDATA;
                WSTRB_reg   <= S_AXI4_WSTRB;
                W_IID       <= ~W_IID;
                WREADY_reg  <= 0;
            end
            else if(W_IID == B_IID) begin
                // received data, wait for response confirm
                WREADY_reg <= 1;
            end

            //if(W_IID == B_IID) begin
            //    // received data, wait for response confirm
            //    WREADY_reg <= 1;
            //end
            //else begin
            //    WREADY_reg <= 0;
            //end
            
        end
    end

    //=========================================================================
    //  AXI Write Response Logic
    //=========================================================================

    reg [AXI_ID_WIDTH - 1 : 0]  BID_reg;
    reg [1 : 0]                 BRESP_reg = 0;
    reg                         BVALID_reg = 0;
    reg                         BREADY_reg = 0;

    //assign S_AXI4_BID       = BID_reg;
    assign S_AXI4_BRESP     = BRESP_reg;
    assign S_AXI4_BVALID    = BVALID_reg;

    always @(posedge clk) begin : p_AXI_Write_Response
        if(rst == 1) begin
            BVALID_reg <= 0;
            B_IID <= 0;
        end
        else begin

            BREADY_reg <= S_AXI4_BREADY;

            if((AW_IID == W_IID) && (B_IID != AW_IID)) begin
                // If both Write Addr and Data are complete, but Resp is not updated, send response
                BVALID_reg <= 1;

                BID_reg <= AWID_reg;
                BRESP_reg <= 2'b00;     // OKAY
                //BRESP_reg <= 2'b01;     // EXOKAY
                //BRESP_reg <= 2'b10;     // SLVERR
                //BRESP_reg <= 2'b11;     // DECERR
                B_IID <= ~B_IID;

                // Write to register would also occur under this logic state
            end
            else if(BVALID_reg == 1 && BREADY_reg == 1) begin
                BVALID_reg <= 0;
            end
        end
    end

    //=========================================================================
    //  AXI Read Address Logic
    //=========================================================================

    reg [AXI_ID_WIDTH - 1 : 0]  ARID_reg;
    reg [3 : 0]                 ARADDR_reg = 0;
    reg [2 : 0]                 ARPROT_reg = 0;
    reg                         ARVALID_reg = 0;
    reg                         ARREADY_reg = 0;

    assign S_AXI4_ARREADY = ARREADY_reg;

    always @(posedge clk) begin : p_AXI_Read_Address
        if(rst == 1) begin
            ARREADY_reg <= 0;
            AR_IID <= 0;
        end
        else begin
            
            ARVALID_reg <= S_AXI4_ARVALID;
            
            if(ARREADY_reg == 1 && S_AXI4_ARVALID == 1) begin
                ARID_reg        <= S_AXI4_ARID;
                ARADDR_reg      <= S_AXI4_ARADDR[3:0];
                ARPROT_reg      <= S_AXI4_ARPROT;
                AR_IID          <= ~AR_IID;
                ARREADY_reg     <= 0;
            end
            else if(AR_IID == R_IID) begin
                // received address, wait for data channel to catch up
                ARREADY_reg <= 1;
            end

            //if(AR_IID == R_IID) begin
            //    ARREADY_reg <= 1;
            //end
            //else begin
            //    ARREADY_reg <= 0;
            //end
            
        end
    end

    //=========================================================================
    //  AXI Read Data Logic
    //=========================================================================

    reg [AXI_ID_WIDTH - 1 : 0]  RID_reg;
    reg [AXI_D_WIDTH - 1 : 0]   RDATA_reg = 0;
    reg [1 : 0]                 RRESP_reg = 0;
    reg                         RVALID_reg = 0;
    reg                         RREADY_reg = 0;

    assign S_AXI4_RID       = RID_reg;
    assign S_AXI4_RDATA     = RDATA_reg;
    assign S_AXI4_RRESP     = RRESP_reg;
    assign S_AXI4_RVALID    = RVALID_reg;

    always @(posedge clk) begin : p_AXI_Read_Data
        if(rst == 1) begin
            RVALID_reg <= 0;
            R_IID <= 0;
        end
        else begin
            
            RREADY_reg <= S_AXI4_RREADY;

            if(AR_IID != R_IID) begin
                RVALID_reg <= 1;
                RID_reg <= ARID_reg;
                R_IID <= AR_IID;

                RRESP_reg <= 2'b00;     // OKAY
                //RRESP_reg <= 2'b01;     // EXOKAY
                //RRESP_reg <= 2'b10;     // SLVERR
                //RRESP_reg <= 2'b11;     // DECERR

                case (ARADDR_reg[3:0])
                    CTRL_REG_ADR    : RDATA_reg <= control_reg;
                    STAT_REG_ADR    : RDATA_reg <= status_reg;
                    DATI_REG_ADR    : RDATA_reg <= data_in;
                    DATO_REG_ADR    : RDATA_reg <= data_out;
                    default         : RDATA_reg <= 0;
                endcase
            end
            else if(S_AXI4_RREADY == 1 && RVALID_reg == 1) begin
                RVALID_reg <= 0;
            end
            
        end
    end

    //=========================================================================
    //=========================================================================
    //
    //  AXI Register Stuff
    //
    //=========================================================================


    //=========================================================================
    // Control Register
    //  0  : Enable == 1 (default 1)
    // 1-7 : Unused
    //=========================================================================
    always @(posedge clk) begin : p_AXI_control_register
        if(rst == 1) begin
            control_reg <= 8'b0000_0001;
        end
        else begin
            if(AW_IID == W_IID && B_IID != AW_IID && AWADDR_reg == CTRL_REG_ADR) begin
                control_reg <= WDATA_reg[7:0];
            end
        end
    end

    assign enable = control_reg[0];


    //=========================================================================
    // Status Register
    //  0  : Enable == 1 (default 0)
    // 2-6 : Unused
    //  7  : Filter Result updated
    //=========================================================================

    always @(posedge clk) begin : p_AXI_status_register

        reg data_out_valid_d1;
        

        if(rst == 1) begin
            status_reg <= 8'b0000_0000;
            data_out_valid_d1 <= 0;
        end
        else begin
            if(AW_IID == W_IID && B_IID != AW_IID && AWADDR_reg == STAT_REG_ADR) begin
                
            end
            else begin
            
            end

            status_reg[0] <= control_reg[0];
            status_reg[1] <= 0;
            status_reg[2] <= 0;
            status_reg[3] <= 0;
            status_reg[4] <= 0;
            status_reg[5] <= samples_full;
            status_reg[6] <= data_out_valid;

            
            data_out_valid_d1 <= data_out_valid;

            if(data_out_valid_d1 == 0 && data_out_valid == 1) begin
                status_reg[7] <= 1;
            end
            else if(data_read_pulse == 1) begin
                status_reg[7] <= 0;
            end
        end
    end

    //=========================================================================
    // Data In Register
    //  0-(SAMPLE_WIDTH-1) : Sample Data
    //=========================================================================
    always @(posedge clk) begin : p_AXI_data_in_register
        if(rst == 1) begin
            data_in <= 0;
        end
        else begin
            if(AW_IID == W_IID && B_IID != AW_IID && AWADDR_reg == DATI_REG_ADR) begin
                // Data is being written to the Filter Shift Register
                data_in <= WDATA_reg[SAMPLE_WIDTH - 1 : 0];
                data_in_wen <= 1;
            end
            else begin
                data_in_wen <= 0;
            end
        end
    end

    //=========================================================================
    // Data Out Register
    //  0-(SAMPLE_WIDTH-1) : Sample Data
    //=========================================================================
    always @(posedge clk) begin : p_AXI_data_out_register
        if(rst == 1) begin
            data_read_pulse <= 0;
        end
        else begin
            if(AR_IID != R_IID && ARADDR_reg == DATO_REG_ADR) begin
                // Data has been read, send pulse for status
                data_read_pulse <= 1;
            end
            else begin
                data_read_pulse <= 0;
            end
        end
    end

endmodule
