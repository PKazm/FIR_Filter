///////////////////////////////////////////////////////////////////////////
//NOTE: This file has been automatically generated by Vivado.
///////////////////////////////////////////////////////////////////////////
`timescale 1ps/1ps
package FIR_Filter_AXI_test_bd_axi_vip_0_0_pkg;
import axi_vip_pkg::*;
///////////////////////////////////////////////////////////////////////////
// These parameters are named after the component for use in your verification 
// environment.
///////////////////////////////////////////////////////////////////////////
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_PROTOCOL           = 2;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_READ_WRITE_MODE    = "READ_WRITE";
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_INTERFACE_MODE     = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_ADDR_WIDTH         = 32;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_DATA_WIDTH         = 32;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_ID_WIDTH           = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_AWUSER_WIDTH       = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_ARUSER_WIDTH       = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_RUSER_WIDTH        = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_WUSER_WIDTH        = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_BUSER_WIDTH        = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_SUPPORTS_NARROW    = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_BURST          = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_LOCK           = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_CACHE          = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_REGION         = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_QOS            = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_PROT           = 1;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_WSTRB          = 1;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_BRESP          = 1;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_RRESP          = 1;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_ACLKEN         = 0;
      parameter FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_ARESETN        = 1;
///////////////////////////////////////////////////////////////////////////
typedef axi_mst_agent #(FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_PROTOCOL, 
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_ADDR_WIDTH,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_DATA_WIDTH,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_DATA_WIDTH,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_ID_WIDTH,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_ID_WIDTH,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_AWUSER_WIDTH, 
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_WUSER_WIDTH, 
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_BUSER_WIDTH, 
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_ARUSER_WIDTH,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_RUSER_WIDTH, 
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_SUPPORTS_NARROW, 
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_BURST,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_LOCK,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_CACHE,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_REGION,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_PROT,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_QOS,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_WSTRB,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_BRESP,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_RRESP,
                        FIR_Filter_AXI_test_bd_axi_vip_0_0_VIP_HAS_ARESETN) FIR_Filter_AXI_test_bd_axi_vip_0_0_mst_t;
      
///////////////////////////////////////////////////////////////////////////
// How to start the verification component
///////////////////////////////////////////////////////////////////////////
//      FIR_Filter_AXI_test_bd_axi_vip_0_0_mst_t  FIR_Filter_AXI_test_bd_axi_vip_0_0_mst;
//      initial begin : START_FIR_Filter_AXI_test_bd_axi_vip_0_0_MASTER
//        FIR_Filter_AXI_test_bd_axi_vip_0_0_mst = new("FIR_Filter_AXI_test_bd_axi_vip_0_0_mst", `FIR_Filter_AXI_test_bd_axi_vip_0_0_PATH_TO_INTERFACE);
//        FIR_Filter_AXI_test_bd_axi_vip_0_0_mst.start_master();
//      end



endpackage : FIR_Filter_AXI_test_bd_axi_vip_0_0_pkg
