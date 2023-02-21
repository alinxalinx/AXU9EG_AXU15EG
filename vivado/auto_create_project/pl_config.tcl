  # Create interface ports
  set RS485_0_DE [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 RS485_0_DE ]

  set RS485_1_DE [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 RS485_1_DE ]

  set c0_ddr4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 c0_ddr4 ]

  set cam_i2c [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 cam_i2c ]

  set fan [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 fan ]

  set g_led [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 g_led ]

  set mdio [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio ]

  set mipi_phy_if [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:mipi_phy_rtl:1.0 mipi_phy_if ]

  set pl_key [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 pl_key ]

  set pl_led [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 pl_led ]

  set rgmii [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 rgmii ]

  set sys [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $sys

  set uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 uart ]


  # Create ports
  set RS485_0_rxd [ create_bd_port -dir I RS485_0_rxd ]
  set RS485_0_txd [ create_bd_port -dir O RS485_0_txd ]
  set RS485_1_rxd [ create_bd_port -dir I RS485_1_rxd ]
  set RS485_1_txd [ create_bd_port -dir O RS485_1_txd ]
  set cam_gpio [ create_bd_port -dir O -from 0 -to 0 cam_gpio ]
  set phy_reset_n [ create_bd_port -dir O -from 0 -to 0 -type rst phy_reset_n ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $phy_reset_n

  # Create instance: Green_led, and set properties
  set Green_led [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 Green_led ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $Green_led

  # Create instance: RS458_DE0, and set properties
  set RS458_DE0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 RS458_DE0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $RS458_DE0

  # Create instance: RS458_DE1, and set properties
  set RS458_DE1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 RS458_DE1 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $RS458_DE1

  # Create instance: axi_ethernet_0, and set properties
  set axi_ethernet_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernet:7.2 axi_ethernet_0 ]
  set_property -dict [ list \
   CONFIG.PHY_TYPE {RGMII} \
 ] $axi_ethernet_0

  # Create instance: axi_ethernet_0_dma, and set properties
  set axi_ethernet_0_dma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_ethernet_0_dma ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_mm2s_dre {1} \
   CONFIG.c_include_s2mm_dre {1} \
   CONFIG.c_sg_length_width {16} \
   CONFIG.c_sg_use_stsapp_length {1} \
 ] $axi_ethernet_0_dma

  # Create instance: axi_ethernet_0_refclk, and set properties
  set axi_ethernet_0_refclk [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 axi_ethernet_0_refclk ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {50.0} \
   CONFIG.CLKOUT1_JITTER {83.559} \
   CONFIG.CLKOUT1_PHASE_ERROR {73.186} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200} \
   CONFIG.CLKOUT2_JITTER {91.406} \
   CONFIG.CLKOUT2_PHASE_ERROR {73.186} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {125} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {77.345} \
   CONFIG.CLKOUT3_PHASE_ERROR {73.186} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {300.000} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {7.500} \
   CONFIG.MMCM_CLKIN1_PERIOD {5.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {7.500} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {12} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {5} \
   CONFIG.NUM_OUT_CLKS {3} \
   CONFIG.PRIM_IN_FREQ {200.000} \
   CONFIG.PRIM_SOURCE {No_buffer} \
   CONFIG.USE_RESET {false} \
 ] $axi_ethernet_0_refclk

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.M00_HAS_DATA_FIFO {0} \
   CONFIG.M00_HAS_REGSLICE {0} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {3} \
   CONFIG.S00_HAS_DATA_FIFO {0} \
   CONFIG.S00_HAS_REGSLICE {0} \
   CONFIG.S01_HAS_DATA_FIFO {0} \
   CONFIG.S01_HAS_REGSLICE {0} \
   CONFIG.S02_HAS_DATA_FIFO {0} \
   CONFIG.S02_HAS_REGSLICE {0} \
 ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $axi_interconnect_1

  # Create instance: axi_interconnect_2, and set properties
  set axi_interconnect_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_2 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $axi_interconnect_2

  # Create instance: axi_uart16550_0, and set properties
  set axi_uart16550_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart16550_0 ]
  set_property -dict [ list \
   CONFIG.C_S_AXI_ACLK_FREQ_HZ {200000000} \
 ] $axi_uart16550_0

  # Create instance: axi_uart16550_1, and set properties
  set axi_uart16550_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart16550_1 ]
  set_property -dict [ list \
   CONFIG.C_S_AXI_ACLK_FREQ_HZ {200000000} \
 ] $axi_uart16550_1

  # Create instance: axis_subset_converter_0, and set properties
  set axis_subset_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 axis_subset_converter_0 ]
  set_property -dict [ list \
   CONFIG.M_HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {6} \
   CONFIG.M_TUSER_WIDTH {1} \
   CONFIG.S_HAS_TLAST {1} \
   CONFIG.S_TDATA_NUM_BYTES {4} \
   CONFIG.S_TUSER_WIDTH {1} \
   CONFIG.TDATA_REMAP {16'b0000000000000000,tdata[31:0]} \
   CONFIG.TLAST_REMAP {tlast[0]} \
   CONFIG.TUSER_REMAP {tuser[0:0]} \
 ] $axis_subset_converter_0

  # Create instance: csc_rst_gpio, and set properties
  set csc_rst_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 csc_rst_gpio ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {8} \
   CONFIG.DIN_TO {8} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $csc_rst_gpio

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [ list \
   CONFIG.C0.BANK_GROUP_WIDTH {1} \
   CONFIG.C0.DDR4_AxiAddressWidth {31} \
   CONFIG.C0.DDR4_AxiDataWidth {256} \
   CONFIG.C0.DDR4_CLKOUT0_DIVIDE {5} \
   CONFIG.C0.DDR4_CasWriteLatency {12} \
   CONFIG.C0.DDR4_DataWidth {32} \
   CONFIG.C0.DDR4_InputClockPeriod {4998} \
   CONFIG.C0.DDR4_MemoryPart {MT40A512M16HA-083E} \
   CONFIG.C0.DDR4_TimePeriod {833} \
   CONFIG.System_Clock {No_Buffer} \
 ] $ddr4_0

  # Create instance: fan_gpio, and set properties
  set fan_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 fan_gpio ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $fan_gpio

  # Create instance: frmbuf_wr_rst_gpio, and set properties
  set frmbuf_wr_rst_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 frmbuf_wr_rst_gpio ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {7} \
   CONFIG.DIN_TO {7} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $frmbuf_wr_rst_gpio

  # Create instance: mipi_csi2_rx_subsyst_0, and set properties
  set mipi_csi2_rx_subsyst_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mipi_csi2_rx_subsystem:5.0 mipi_csi2_rx_subsyst_0 ]
  set_property -dict [ list \
   CONFIG.CLK_LANE_IO_LOC {W12} \
   CONFIG.CMN_NUM_LANES {2} \
   CONFIG.CMN_NUM_PIXELS {2} \
   CONFIG.CMN_PXL_FORMAT {YUV422_8bit} \
   CONFIG.C_DPHY_LANES {2} \
   CONFIG.C_HS_LINE_RATE {1000} \
   CONFIG.C_HS_SETTLE_NS {145} \
   CONFIG.DATA_LANE0_IO_LOC {T13} \
   CONFIG.DATA_LANE1_IO_LOC {U10} \
   CONFIG.DPY_LINE_RATE {1000} \
   CONFIG.HP_IO_BANK_SELECTION {67} \
   CONFIG.SupportLevel {1} \
 ] $mipi_csi2_rx_subsyst_0

  # Create instance: pl_key, and set properties
  set pl_key [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 pl_key ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
   CONFIG.C_INTERRUPT_PRESENT {1} \
 ] $pl_key

  # Create instance: pl_led, and set properties
  set pl_led [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 pl_led ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $pl_led

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: ps8_0_axi_periph_1, and set properties
  set ps8_0_axi_periph_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps8_0_axi_periph_1 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {13} \
 ] $ps8_0_axi_periph_1

  # Create instance: rst_ps8_0_200M, and set properties
  set rst_ps8_0_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_0_200M ]

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDS} \
 ] $util_ds_buf_0

  # Create instance: util_ds_buf_1, and set properties
  set util_ds_buf_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_1 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG} \
 ] $util_ds_buf_1

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: v_frmbuf_wr_0, and set properties
  set v_frmbuf_wr_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_frmbuf_wr:2.1 v_frmbuf_wr_0 ]
  set_property -dict [ list \
   CONFIG.HAS_UYVY8 {1} \
   CONFIG.HAS_YUYV8 {1} \
   CONFIG.HAS_Y_UV8 {1} \
   CONFIG.MAX_COLS {1920} \
   CONFIG.MAX_NR_PLANES {2} \
   CONFIG.MAX_ROWS {1080} \
 ] $v_frmbuf_wr_0

  # Create instance: v_proc_ss_0, and set properties
  set v_proc_ss_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_proc_ss:2.2 v_proc_ss_0 ]
  set_property -dict [ list \
   CONFIG.C_COLORSPACE_SUPPORT {1} \
   CONFIG.C_MAX_COLS {1920} \
   CONFIG.C_MAX_DATA_WIDTH {8} \
   CONFIG.C_MAX_ROWS {1080} \
   CONFIG.C_TOPOLOGY {3} \
 ] $v_proc_ss_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {7} \
 ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]


  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $xlconstant_2

  # Create instance: xlconstant_3, and set properties
  set xlconstant_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3 ]


  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN_D_0_1 [get_bd_intf_ports sys] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net Green_led_GPIO [get_bd_intf_ports g_led] [get_bd_intf_pins Green_led/GPIO]
  connect_bd_intf_net -intf_net RS458_DE0_GPIO [get_bd_intf_ports RS485_0_DE] [get_bd_intf_pins RS458_DE0/GPIO]
  connect_bd_intf_net -intf_net RS458_DE1_GPIO [get_bd_intf_ports RS485_1_DE] [get_bd_intf_pins RS458_DE1/GPIO]
  connect_bd_intf_net -intf_net S00_AXI_2 [get_bd_intf_pins axi_ethernet_0_dma/M_AXI_SG] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net S01_AXI_1 [get_bd_intf_pins axi_ethernet_0_dma/M_AXI_MM2S] [get_bd_intf_pins axi_interconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net S02_AXI_1 [get_bd_intf_pins axi_ethernet_0_dma/M_AXI_S2MM] [get_bd_intf_pins axi_interconnect_0/S02_AXI]
  connect_bd_intf_net -intf_net axi_ethernet_0_dma_M_AXIS_CNTRL [get_bd_intf_pins axi_ethernet_0/s_axis_txc] [get_bd_intf_pins axi_ethernet_0_dma/M_AXIS_CNTRL]
  connect_bd_intf_net -intf_net axi_ethernet_0_dma_M_AXIS_MM2S [get_bd_intf_pins axi_ethernet_0/s_axis_txd] [get_bd_intf_pins axi_ethernet_0_dma/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_ethernet_0_m_axis_rxd [get_bd_intf_pins axi_ethernet_0/m_axis_rxd] [get_bd_intf_pins axi_ethernet_0_dma/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net axi_ethernet_0_m_axis_rxs [get_bd_intf_pins axi_ethernet_0/m_axis_rxs] [get_bd_intf_pins axi_ethernet_0_dma/S_AXIS_STS]
  connect_bd_intf_net -intf_net axi_ethernet_0_mdio [get_bd_intf_ports mdio] [get_bd_intf_pins axi_ethernet_0/mdio]
  connect_bd_intf_net -intf_net axi_ethernet_0_rgmii [get_bd_intf_ports rgmii] [get_bd_intf_pins axi_ethernet_0/rgmii]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP1_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_2_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP0_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_2_M00_AXI1 [get_bd_intf_pins axi_interconnect_2/M00_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net axis_subset_converter_0_M_AXIS [get_bd_intf_pins axis_subset_converter_0/M_AXIS] [get_bd_intf_pins v_proc_ss_0/s_axis]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports c0_ddr4] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net fan_gpio_GPIO [get_bd_intf_ports fan] [get_bd_intf_pins fan_gpio/GPIO]
  connect_bd_intf_net -intf_net mipi_csi2_rx_subsyst_0_video_out [get_bd_intf_pins axis_subset_converter_0/S_AXIS] [get_bd_intf_pins mipi_csi2_rx_subsyst_0/video_out]
  connect_bd_intf_net -intf_net mipi_phy_if_0_1 [get_bd_intf_ports mipi_phy_if] [get_bd_intf_pins mipi_csi2_rx_subsyst_0/mipi_phy_if]
  connect_bd_intf_net -intf_net pl_key_GPIO [get_bd_intf_ports pl_key] [get_bd_intf_pins pl_key/GPIO]
  connect_bd_intf_net -intf_net pl_led_GPIO [get_bd_intf_ports pl_led] [get_bd_intf_pins pl_led/GPIO]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M00_AXI [get_bd_intf_pins axi_ethernet_0/s_axi] [get_bd_intf_pins ps8_0_axi_periph_1/M00_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M01_AXI [get_bd_intf_pins axi_ethernet_0_dma/S_AXI_LITE] [get_bd_intf_pins ps8_0_axi_periph_1/M01_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M02_AXI [get_bd_intf_pins axi_uart16550_0/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M02_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M03_AXI [get_bd_intf_pins axi_uart16550_1/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M03_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M04_AXI [get_bd_intf_pins fan_gpio/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M04_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M05_AXI [get_bd_intf_pins Green_led/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M05_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M06_AXI [get_bd_intf_pins pl_key/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M06_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M07_AXI [get_bd_intf_pins pl_led/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M07_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M08_AXI [get_bd_intf_pins RS458_DE0/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M08_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M09_AXI [get_bd_intf_pins RS458_DE1/S_AXI] [get_bd_intf_pins ps8_0_axi_periph_1/M09_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M10_AXI [get_bd_intf_pins mipi_csi2_rx_subsyst_0/csirxss_s_axi] [get_bd_intf_pins ps8_0_axi_periph_1/M10_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M11_AXI [get_bd_intf_pins ps8_0_axi_periph_1/M11_AXI] [get_bd_intf_pins v_frmbuf_wr_0/s_axi_CTRL]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_1_M12_AXI [get_bd_intf_pins ps8_0_axi_periph_1/M12_AXI] [get_bd_intf_pins v_proc_ss_0/s_axi_ctrl]
  connect_bd_intf_net -intf_net v_frmbuf_wr_0_m_axi_mm_video [get_bd_intf_pins axi_interconnect_1/S00_AXI] [get_bd_intf_pins v_frmbuf_wr_0/m_axi_mm_video]
  connect_bd_intf_net -intf_net v_proc_ss_0_m_axis [get_bd_intf_pins v_frmbuf_wr_0/s_axis_video] [get_bd_intf_pins v_proc_ss_0/m_axis]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_IIC_1 [get_bd_intf_ports cam_i2c] [get_bd_intf_pins zynq_ultra_ps_e_0/IIC_1]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_FPD [get_bd_intf_pins axi_interconnect_2/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_LPD [get_bd_intf_pins ps8_0_axi_periph_1/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_LPD]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_UART_1 [get_bd_intf_ports uart] [get_bd_intf_pins zynq_ultra_ps_e_0/UART_1]

  # Create port connections
  connect_bd_net -net Net2 [get_bd_pins csc_rst_gpio/Din] [get_bd_pins frmbuf_wr_rst_gpio/Din] [get_bd_pins zynq_ultra_ps_e_0/emio_gpio_o]
  connect_bd_net -net axi_ethernet_0_dma_mm2s_cntrl_reset_out_n [get_bd_pins axi_ethernet_0/axi_txc_arstn] [get_bd_pins axi_ethernet_0_dma/mm2s_cntrl_reset_out_n]
  connect_bd_net -net axi_ethernet_0_dma_mm2s_introut [get_bd_pins axi_ethernet_0_dma/mm2s_introut] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net axi_ethernet_0_dma_mm2s_prmry_reset_out_n [get_bd_pins axi_ethernet_0/axi_txd_arstn] [get_bd_pins axi_ethernet_0_dma/mm2s_prmry_reset_out_n]
  connect_bd_net -net axi_ethernet_0_dma_s2mm_introut [get_bd_pins axi_ethernet_0_dma/s2mm_introut] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net axi_ethernet_0_dma_s2mm_prmry_reset_out_n [get_bd_pins axi_ethernet_0/axi_rxd_arstn] [get_bd_pins axi_ethernet_0_dma/s2mm_prmry_reset_out_n]
  connect_bd_net -net axi_ethernet_0_dma_s2mm_sts_reset_out_n [get_bd_pins axi_ethernet_0/axi_rxs_arstn] [get_bd_pins axi_ethernet_0_dma/s2mm_sts_reset_out_n]
  connect_bd_net -net axi_ethernet_0_interrupt [get_bd_pins axi_ethernet_0/interrupt] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net axi_ethernet_0_mac_irq [get_bd_pins axi_ethernet_0/mac_irq] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net axi_ethernet_0_phy_rst_n [get_bd_ports phy_reset_n] [get_bd_pins axi_ethernet_0/phy_rst_n]
  connect_bd_net -net axi_ethernet_0_refclk_clk_out1 [get_bd_pins Green_led/s_axi_aclk] [get_bd_pins RS458_DE0/s_axi_aclk] [get_bd_pins RS458_DE1/s_axi_aclk] [get_bd_pins axi_ethernet_0/axis_clk] [get_bd_pins axi_ethernet_0/s_axi_lite_clk] [get_bd_pins axi_ethernet_0_dma/m_axi_mm2s_aclk] [get_bd_pins axi_ethernet_0_dma/m_axi_s2mm_aclk] [get_bd_pins axi_ethernet_0_dma/m_axi_sg_aclk] [get_bd_pins axi_ethernet_0_dma/s_axi_lite_aclk] [get_bd_pins axi_ethernet_0_refclk/clk_out1] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_0/S01_ACLK] [get_bd_pins axi_interconnect_0/S02_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axi_interconnect_2/ACLK] [get_bd_pins axi_interconnect_2/S00_ACLK] [get_bd_pins axi_uart16550_0/s_axi_aclk] [get_bd_pins axi_uart16550_1/s_axi_aclk] [get_bd_pins axis_subset_converter_0/aclk] [get_bd_pins fan_gpio/s_axi_aclk] [get_bd_pins mipi_csi2_rx_subsyst_0/dphy_clk_200M] [get_bd_pins mipi_csi2_rx_subsyst_0/lite_aclk] [get_bd_pins mipi_csi2_rx_subsyst_0/video_aclk] [get_bd_pins pl_key/s_axi_aclk] [get_bd_pins pl_led/s_axi_aclk] [get_bd_pins ps8_0_axi_periph_1/ACLK] [get_bd_pins ps8_0_axi_periph_1/M00_ACLK] [get_bd_pins ps8_0_axi_periph_1/M01_ACLK] [get_bd_pins ps8_0_axi_periph_1/M02_ACLK] [get_bd_pins ps8_0_axi_periph_1/M03_ACLK] [get_bd_pins ps8_0_axi_periph_1/M04_ACLK] [get_bd_pins ps8_0_axi_periph_1/M05_ACLK] [get_bd_pins ps8_0_axi_periph_1/M06_ACLK] [get_bd_pins ps8_0_axi_periph_1/M07_ACLK] [get_bd_pins ps8_0_axi_periph_1/M08_ACLK] [get_bd_pins ps8_0_axi_periph_1/M09_ACLK] [get_bd_pins ps8_0_axi_periph_1/M10_ACLK] [get_bd_pins ps8_0_axi_periph_1/M11_ACLK] [get_bd_pins ps8_0_axi_periph_1/M12_ACLK] [get_bd_pins ps8_0_axi_periph_1/S00_ACLK] [get_bd_pins rst_ps8_0_200M/slowest_sync_clk] [get_bd_pins v_frmbuf_wr_0/ap_clk] [get_bd_pins v_proc_ss_0/aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_lpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp1_fpd_aclk]
  connect_bd_net -net axi_ethernet_0_refclk_clk_out2 [get_bd_pins axi_ethernet_0/gtx_clk] [get_bd_pins axi_ethernet_0_refclk/clk_out2]
  connect_bd_net -net axi_ethernet_0_refclk_clk_out3 [get_bd_pins axi_ethernet_0/ref_clk] [get_bd_pins axi_ethernet_0_refclk/clk_out3]
  connect_bd_net -net axi_uart16550_0_ip2intc_irpt [get_bd_pins axi_uart16550_0/ip2intc_irpt] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net axi_uart16550_0_sout [get_bd_ports RS485_0_txd] [get_bd_pins axi_uart16550_0/sout]
  connect_bd_net -net axi_uart16550_1_ip2intc_irpt [get_bd_pins axi_uart16550_1/ip2intc_irpt] [get_bd_pins xlconcat_0/In6]
  connect_bd_net -net axi_uart16550_1_sout [get_bd_ports RS485_1_txd] [get_bd_pins axi_uart16550_1/sout]
  connect_bd_net -net csc_rst_gpio_Dout [get_bd_pins csc_rst_gpio/Dout] [get_bd_pins ps8_0_axi_periph_1/M12_ARESETN] [get_bd_pins v_proc_ss_0/aresetn]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins axi_interconnect_2/M00_ACLK] [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net frmbuf_wr_rst_gpio_Dout [get_bd_pins axis_subset_converter_0/aresetn] [get_bd_pins frmbuf_wr_rst_gpio/Dout] [get_bd_pins ps8_0_axi_periph_1/M11_ARESETN] [get_bd_pins v_frmbuf_wr_0/ap_rst_n]
  connect_bd_net -net mipi_csi2_rx_subsyst_0_csirxss_csi_irq [get_bd_pins mipi_csi2_rx_subsyst_0/csirxss_csi_irq] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net pl_key_ip2intc_irpt [get_bd_pins pl_key/ip2intc_irpt] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_interconnect_2/M00_ARESETN] [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net rst_ps8_0_150M_interconnect_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_2/ARESETN] [get_bd_pins ps8_0_axi_periph_1/ARESETN] [get_bd_pins rst_ps8_0_200M/interconnect_aresetn]
  connect_bd_net -net rst_ps8_0_150M_peripheral_aresetn [get_bd_pins Green_led/s_axi_aresetn] [get_bd_pins RS458_DE0/s_axi_aresetn] [get_bd_pins RS458_DE1/s_axi_aresetn] [get_bd_pins axi_ethernet_0/s_axi_lite_resetn] [get_bd_pins axi_ethernet_0_dma/axi_resetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_0/S01_ARESETN] [get_bd_pins axi_interconnect_0/S02_ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axi_interconnect_2/S00_ARESETN] [get_bd_pins axi_uart16550_0/s_axi_aresetn] [get_bd_pins axi_uart16550_1/s_axi_aresetn] [get_bd_pins fan_gpio/s_axi_aresetn] [get_bd_pins mipi_csi2_rx_subsyst_0/lite_aresetn] [get_bd_pins mipi_csi2_rx_subsyst_0/video_aresetn] [get_bd_pins pl_key/s_axi_aresetn] [get_bd_pins pl_led/s_axi_aresetn] [get_bd_pins ps8_0_axi_periph_1/M00_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M01_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M02_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M03_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M04_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M05_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M06_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M07_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M08_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M09_ARESETN] [get_bd_pins ps8_0_axi_periph_1/M10_ARESETN] [get_bd_pins ps8_0_axi_periph_1/S00_ARESETN] [get_bd_pins rst_ps8_0_200M/peripheral_aresetn]
  connect_bd_net -net sin_0_1 [get_bd_ports RS485_0_rxd] [get_bd_pins axi_uart16550_0/sin]
  connect_bd_net -net sin_0_2 [get_bd_ports RS485_1_rxd] [get_bd_pins axi_uart16550_1/sin]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins axi_ethernet_0_refclk/clk_in1] [get_bd_pins ddr4_0/c0_sys_clk_i] [get_bd_pins util_ds_buf_1/BUFG_O]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT1 [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins util_ds_buf_1/BUFG_I]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins ddr4_0/sys_rst] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net v_frmbuf_wr_0_interrupt [get_bd_pins v_frmbuf_wr_0/interrupt] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins xlconcat_0/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins xlconcat_1/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq1]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins axi_uart16550_0/dcdn] [get_bd_pins axi_uart16550_0/dsrn] [get_bd_pins axi_uart16550_0/freeze] [get_bd_pins axi_uart16550_1/dcdn] [get_bd_pins axi_uart16550_1/dsrn] [get_bd_pins axi_uart16550_1/freeze] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins axi_uart16550_0/ctsn] [get_bd_pins axi_uart16550_0/rin] [get_bd_pins axi_uart16550_1/ctsn] [get_bd_pins axi_uart16550_1/rin] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlconstant_3_dout [get_bd_ports cam_gpio] [get_bd_pins xlconstant_3/dout]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_resetn1 [get_bd_pins rst_ps8_0_200M/ext_reset_in] [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0]


  assign_bd_address	
  # Create address segments
  # assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_SG] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] -force
  # assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] -force
  # assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_S2MM] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] -force
  # assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_SG] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] -force
  # assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] -force
  # assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_S2MM] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] -force
  # assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_SG] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_PCIE_LOW] -force
  # assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_PCIE_LOW] -force
  # assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_S2MM] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_PCIE_LOW] -force
  # assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_SG] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] -force
  # assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] -force
  # assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_S2MM] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] -force
  # assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] -force
  # assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_PCIE_LOW] -force
  # assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] -force
  # assign_bd_address -offset 0x80020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs Green_led/S_AXI/Reg] -force
  # assign_bd_address -offset 0x80030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs RS458_DE0/S_AXI/Reg] -force
  # assign_bd_address -offset 0x80040000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs RS458_DE1/S_AXI/Reg] -force
  # assign_bd_address -offset 0x80080000 -range 0x00040000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ethernet_0/s_axi/Reg0] -force
  # assign_bd_address -offset 0x80050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_ethernet_0_dma/S_AXI_LITE/Reg] -force
  # assign_bd_address -offset 0x80060000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_uart16550_0/S_AXI/Reg] -force
  # assign_bd_address -offset 0x80070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_uart16550_1/S_AXI/Reg] -force
  # assign_bd_address -offset 0x800C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs fan_gpio/S_AXI/Reg] -force
  # assign_bd_address -offset 0x80000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs mipi_csi2_rx_subsyst_0/csirxss_s_axi/Reg] -force
  # assign_bd_address -offset 0x800D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs pl_key/S_AXI/Reg] -force
  # assign_bd_address -offset 0x800E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs pl_led/S_AXI/Reg] -force
  # assign_bd_address -offset 0x800F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs v_frmbuf_wr_0/s_axi_CTRL/Reg] -force
  # assign_bd_address -offset 0x80010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs v_proc_ss_0/s_axi_ctrl/Reg] -force

  # Exclude Address Segments
  # exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM]
  # exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_S2MM] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM]
  # exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_ethernet_0_dma/Data_SG] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM]
  # exclude_bd_addr_seg -target_address_space [get_bd_addr_spaces v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_HIGH]
  # exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM]
