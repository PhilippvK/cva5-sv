# cva5_synth.tcl - Synopsys DC synthesis script for CVA5 on Nangate45

# Read design files (adjust to your file names and order)
# read_verilog ./rtl/cva5_top.v
# read_verilog -f files.f
set file_handle [open files.f r]
set file_list [read $file_handle]
close $file_handle

set parent_dir [file dirname files.f]

# Iterate through each file and analyze it
foreach file [split $file_list "\n"] {
    # Skip empty lines
    if {[string length $file] == 0} {
        continue
    }
    puts "Analyzing: $file"
    analyze -format sverilog -work work $parent_dir/$file
}
# read_verilog other modules as needed

# Link Nangate45 library (adjust path)
# set target_library "/path/to/nangate45.lib"
# set link_library "* $target_library"

# Define design top module
current_design cva5_top

# Read constraints
read_sdc ./CVA5.sdc

# Elaborate design
elaborate

# Compile the design with optimization effort and target clock
compile_ultra -map_effort medium -max_area 0 -incremental

# You can set area or timing constraints here as well
# Example: compile_ultra -area_recovery high -timing_driven

# Report timing, area, and power summary
report_timing -sort_by_slack -input_pins -nets -max_paths 10
report_area
report_power

# Write synthesized netlist
write -format verilog -hierarchy -output cva5_synth.v

# Optionally write design database for PnR tools
write -format ddc -output cva5_synth.ddc

# Exit DC
exit
