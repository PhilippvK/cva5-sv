## Clock constraint
# create_clock -period 10.0 -name sys_clk -waveform {0 5} [get_ports clk]
# create_clock -period 5.0 -name sys_clk -waveform {0 2.5} [get_ports clk]
# create_clock -period 3.3333333333333335 -name sys_clk -waveform {0 1.6666666666666667} [get_ports clk]
# create_clock -period 3.0 -name sys_clk -waveform {0 1.5} [get_ports clk]
# create_clock -period 2.944 -name sys_clk -waveform {0 1.472} [get_ports clk]
# create_clock -period 9.299 -name sys_clk -waveform {0 4.6495} [get_ports clk]
create_clock -period 9.0 -name sys_clk -waveform {0 4.5} [get_ports clk]
