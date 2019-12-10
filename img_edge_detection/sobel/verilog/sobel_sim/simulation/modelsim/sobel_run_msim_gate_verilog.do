transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {sobel_6_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim {C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim/image_TB.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  image_TB

add wave *
view structure
view signals
run -all
