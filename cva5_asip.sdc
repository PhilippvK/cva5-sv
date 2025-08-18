# CVA5.sdc - basic constraints

# Define clock with 10 ns period (100 MHz)
create_clock -period 10.0 -name clk [get_ports clk]

# Set clock uncertainty (optional)
set_clock_uncertainty 0.1 -clock clk

# Define input/output delays (assuming zero delay here)
set_input_delay 0.0 -clock clk [all_inputs]
set_output_delay 0.0 -clock clk [all_outputs]

# Define clock latency (assume zero)
set_clock_latency 0 -clock clk

# Set max transition for inputs and outputs (typical values)
set_max_transition 0.5 [all_inputs]
set_max_transition 0.5 [all_outputs]

# Set max capacitance for inputs (example value)
set_max_capacitance 0.1 [all_inputs]

# False paths or multi-cycle paths can be defined here if any
# Example:
# set_false_path -from [get_ports async_reset]

# Define generated clocks if any (not shown here)
