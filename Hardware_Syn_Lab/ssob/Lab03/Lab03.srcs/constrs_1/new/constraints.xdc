create_clock -period 10.000 -name clock -waveform {0.000 5.000} [get_ports clock]

set_property IOSTANDARD LVCMOS33 [get_ports {activating[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {activating[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {activating[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {activating[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN W4 [get_ports {activating[3]}]
set_property PACKAGE_PIN V4 [get_ports {activating[2]}]
set_property PACKAGE_PIN U4 [get_ports {activating[1]}]
set_property PACKAGE_PIN U2 [get_ports {activating[0]}]
set_property PACKAGE_PIN W7 [get_ports {LED[6]}]
set_property PACKAGE_PIN W6 [get_ports {LED[5]}]
set_property PACKAGE_PIN U8 [get_ports {LED[4]}]
set_property PACKAGE_PIN V8 [get_ports {LED[3]}]
set_property PACKAGE_PIN U5 [get_ports {LED[2]}]
set_property PACKAGE_PIN V5 [get_ports {LED[1]}]
set_property PACKAGE_PIN U7 [get_ports {LED[0]}]

set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property PACKAGE_PIN W5 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports set0]
set_property IOSTANDARD LVCMOS33 [get_ports set9]
set_property PACKAGE_PIN T18 [get_ports set9]
set_property PACKAGE_PIN U18 [get_ports set0]
