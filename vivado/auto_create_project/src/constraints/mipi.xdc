set_property PACKAGE_PIN AK13 [get_ports {cam_gpio[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cam_gpio[0]}]
set_property PULLUP true [get_ports {cam_gpio[0]}]

set_property PACKAGE_PIN AN13  [get_ports cam_i2c_scl_io]
set_property PACKAGE_PIN AM14 [get_ports cam_i2c_sda_io]

set_property IOSTANDARD LVCMOS33 [get_ports cam_i2c_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports cam_i2c_sda_io]


set_property PULLUP true [get_ports cam_i2c_scl_io]
set_property PULLUP true [get_ports cam_i2c_sda_io]
