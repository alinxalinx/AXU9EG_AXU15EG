set_property PACKAGE_PIN M10   [get_ports {mdio_mdc                    }] 
set_property PACKAGE_PIN L10  	[get_ports {mdio_mdio_io            }] 
set_property PACKAGE_PIN R9		[get_ports {phy_reset_n                  }] 
set_property PACKAGE_PIN AA7 	[get_ports {rgmii_rxc                  }] 
set_property PACKAGE_PIN AA6 	[get_ports {rgmii_rx_ctl            }] 
set_property PACKAGE_PIN U4		[get_ports {rgmii_rd[0]              }] 
set_property PACKAGE_PIN U5		[get_ports {rgmii_rd[1]              }] 
set_property PACKAGE_PIN Y9		[get_ports {rgmii_rd[2]              }] 
set_property PACKAGE_PIN Y10	   [get_ports {rgmii_rd[3]              }] 
set_property PACKAGE_PIN V3		[get_ports {rgmii_txc                  }] 
set_property PACKAGE_PIN V4		[get_ports {rgmii_tx_ctl            }] 
set_property PACKAGE_PIN AC9	[get_ports {rgmii_td[0]              }] 
set_property PACKAGE_PIN AB9	  [get_ports {rgmii_td[1]              }] 
set_property PACKAGE_PIN AB5	  [get_ports {rgmii_td[2]              }] 
set_property PACKAGE_PIN AB6 	[get_ports {rgmii_td[3]              }] 
 
set_property IOSTANDARD LVCMOS12 [get_ports {mdio_mdc                    }] 
set_property IOSTANDARD LVCMOS12 [get_ports {mdio_mdio_io            }] 
set_property IOSTANDARD LVCMOS12 [get_ports {phy_reset_n                  }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rxc                  }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rx_ctl            }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[0]              }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[1]              }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[2]              }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[3]              }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_txc                  }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_tx_ctl            }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[0]              }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[1]              }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[2]              }] 
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[3]              }] 

set_property DRIVE 8 [get_ports mdio_mdc]
set_property DRIVE 8 [get_ports mdio_mdio_io]



set_property IODELAY_GROUP MIXED_DELAY_GROUP [get_cells design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_idelayctrl_common_i]
set_property IODELAY_GROUP MIXED_DELAY_GROUP [get_cells design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/delay_rgmii_rx_ctl]
set_property IODELAY_GROUP MIXED_DELAY_GROUP [get_cells {design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[*].delay_rgmii_rxd}]



#idelay
#set_property DELAY_FORMAT COUNT [get_cells ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/delay_rgmii_rx_ctl]
#set_property DELAY_FORMAT COUNT [get_cells {ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[*].delay_rgmii_rxd}]
##set_property DELAY_FORMAT COUNT [get_cells {ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[1].delay_rgmii_rxd}]
##set_property DELAY_FORMAT COUNT [get_cells {ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[2].delay_rgmii_rxd}]
##set_property DELAY_FORMAT COUNT [get_cells {ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[3].delay_rgmii_rxd}]

set_property DELAY_VALUE 500 [get_cells ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/delay_rgmii_rx_ctl]
set_property DELAY_VALUE 500 [get_cells {ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[*].delay_rgmii_rxd}]
#set_property DELAY_VALUE 100 [get_cells {ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[1].delay_rgmii_rxd}]
#set_property DELAY_VALUE 100 [get_cells {ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[2].delay_rgmii_rxd}]
#set_property DELAY_VALUE 100 [get_cells {ps_block/design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[3].delay_rgmii_rxd}]


set_property DELAY_VALUE 950 [get_cells design_1_i/axi_ethernet_0/inst/mac/inst/tri_mode_ethernet_mac_i/rgmii_interface/delay_rgmii_tx_clk]