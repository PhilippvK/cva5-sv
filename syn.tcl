puts "Creating a project for CVA5 and running synthesis..."

# Create project
create_project -force -part xc7a100tcsg324-1 CVA5Synth ./vivado/CVA5Synth

# Add RTL sources and constraints if any
add_files -force {core examples/xilinx examples/sw}

add_files -fileset constrs_1 ./cva5.xdc

# Set top module
set_property top cva5_top [current_fileset]

# Update compile order
update_compile_order -fileset sources_1

# Run synthesis
launch_runs synth_1
wait_on_run synth_1

# Open synthesized design
open_run synth_1

# Generate timing and utilization reports
report_timing_summary -file ./vivado/CVA5Synth/post_synth_timing.rpt
report_utilization      -file ./vivado/CVA5Synth/post_synth_util.rpt
report_utilization -hierarchical -file ./vivado/CVA5Synth/post_synth_util_hierarchical.rpt

puts "Synthesis complete. Reports written to ./vivado/CVA5Synth/"
