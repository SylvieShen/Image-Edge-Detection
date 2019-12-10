######## define project name ######

#set some para
proc get_selected_list_item {lst idx} {
	# Convert to integer
	if [catch { set idx [expr {int($idx)}] }] {
		set idx -1
	}

	if {$idx < 0 || $idx >= [llength $lst]} {
		set len [llength $lst]
		puts "Invalid number. Please enter a number from 0 to $len"
		exit
	}

	return [lindex $lst $idx]
}
set sof_files [glob  -nocomplain *.qpf]


if {[llength $sof_files] == 0} {
	puts "I could not find any qpf files in the local directory. creat new project..."
	#pwd
	set mypath [pwd]
	puts $mypath
	cd ..
	#pwd
	set mysubpath [pwd]
	puts $mysubpath
	set la [string length $mypath]
	puts "length mypath" 
	puts $la
	set lb [string length $mysubpath]
	incr lb
	puts "mysubpath lenth"
	puts $lb
	#set le [expr $la - $lb]
	string range $mypath [expr $lb] [expr $la]
	set project_name [string range $mypath [expr $lb] [expr $la]]
	cd $project_name
	
	#exit
} else {
set sid 0

foreach sof_file $sof_files {
	puts "$sid) $sof_file"
	incr sid
}
set selected_sof_id 0
puts $selected_sof_id
puts $sof_files
set sof_name [get_selected_list_item $sof_files $selected_sof_id]

puts "Selected qpf file: $sof_name\n\n\n"

set name $sof_name
file extension $name
set project_name [string trimright $name [file extension $name]]
}
puts $project_name

#set some para
#set project_name DE2_115_IO
#set project_name 
set top_entity $project_name


########################
if [project_exists $project_name] {
project_open $project_name
} else {
project_new $project_name -overwrite
}
################################

set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE115F29C7
set_global_assignment -name TOP_LEVEL_ENTITY $top_entity



set_global_assignment -name SMART_RECOMPILE ON

set_global_assignment -name SDC_FILE $project_name.SDC

set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85

#set_global_assignment -name VERILOG_FILE image_TB.v
set v_files [glob  -nocomplain *.v]
set vn 0

foreach v_file $v_files {
	puts $sof_file
	set_global_assignment -name VERILOG_FILE $v_file
	incr vn
}

load_package flow
if {[catch {execute_flow -compile} result]} {
puts "\nResult: $result\n"
puts "ERROR: Compilation failed. See report files.\n"
} else {
puts "\nINFO: Compilation was successful.\n"
}     
project_close
