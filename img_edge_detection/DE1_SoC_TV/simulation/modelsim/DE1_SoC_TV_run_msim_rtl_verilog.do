transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/Sdram_PLL.vo}
vlib Sdram_PLL
vmap Sdram_PLL Sdram_PLL
vlog -vlog01compat -work Sdram_PLL +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/Sdram_PLL.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/MAC_3.vo}
vlib MAC_3
vmap MAC_3 MAC_3
vlog -vlog01compat -work MAC_3 +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/MAC_3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/DE1_SoC_TV.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/chunklib {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/chunklib/freq_meters.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/chunklib {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/chunklib/div_odd.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/chunklib {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/chunklib/div_even.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/chunklib {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/chunklib/clk_div.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/dsp/median_filter {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/dsp/median_filter/shift_lineS.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/img_src {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/img_src/img_data.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sobel {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sobel/Sobel.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sobel {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sobel/RGB2GREY.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/dsp/median_filter {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/dsp/median_filter/medianfilterblock.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/dsp {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/dsp/img_process.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/Sdram_WR_FIFO.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/Sdram_RD_FIFO.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/YUV422_to_444.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/YCbCr2RGB.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/VGA_Ctrl.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/TD_Detect.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/SEG7_LUT.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/Reset_Delay.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/ITU_656_Decoder.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/I2C_Controller.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/I2C_AV_Config.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/Line_Buffer.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/DIV.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/AUDIO_DAC.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sobel {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sobel/SQRT_S.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/db {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/db/altera_mult_add_3rkg.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/img_src {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/img_src/imgbw_data.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/img_src {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/img_src/img_src.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sobel {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sobel/LineBuffer_S.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/Sdram_Control_4Port.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/sdr_data_path.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/control_interface.v}
vlog -vlog01compat -work work +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/command.v}
vlog -vlog01compat -work Sdram_PLL +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/Sdram_PLL {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/Sdram_Control_4Port/Sdram_PLL/Sdram_PLL_0002.v}
vlog -vlog01compat -work MAC_3 +incdir+C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/MAC_3 {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/v/MAC_3/MAC_3_0002.v}
vcom -93 -work work {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/dsp/median_filter/medianfilter.vhd}
vcom -93 -work work {C:/signal2/lab3_image_skeleton_code_v18/DE1_SoC_TV/dsp/median_filter/averagefilter.vhd}

