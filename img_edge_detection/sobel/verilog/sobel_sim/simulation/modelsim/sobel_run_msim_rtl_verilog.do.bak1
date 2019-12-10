transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim {C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim/sobel.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim {C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim/SQRT.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim {C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim/PA_3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim {C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim/MAC_3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim {C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim/LineBuffer_3.v}

vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim {C:/signal2/lab3_image_skeleton_code_v18/sobel/verilog/sobel_sim/image_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  image_TB

add wave *
view structure
view signals
run -all
