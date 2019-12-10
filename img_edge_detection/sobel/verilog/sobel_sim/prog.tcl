# Some helpful functions
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



##### by chunk
puts "Programming device 1..."
# Now let the user select which SOF to program
set sof_files [glob *.sof]
set sid 0

foreach sof_file $sof_files {
	puts "$sid) $sof_file"
	incr sid
}

if {[llength $sof_files] == 0} {
	puts "I could not find any SOF files in the local directory. Quitting..."
	exit
}

puts -nonewline "\nWhich SOF would you like to use? "
#gets stdin selected_sof_id
puts ""
set selected_sof_id 0
puts $selected_sof_id
puts $sof_files
set sof_name [get_selected_list_item $sof_files $selected_sof_id]

puts "Selected SOF file: $sof_name\n\n\n"

# Let the user select a hardware cable to talk to
set hardware_names [get_hardware_names]
set id 0

# List out all hardware names and the devices connected to them
foreach hardware_name $hardware_names {
	puts "$id) $hardware_name"
	incr id

	foreach device_name [get_device_names -hardware_name $hardware_name] {
		puts "\t$device_name"
	}
}

if {[llength $hardware_names] == 0} {
	puts "There are no Altera devices currently connected."
	exit
}

puts -nonewline "\nWhich USB device would you like to program? "



set selected_hardware_id 0 



set hardware_name [get_selected_list_item $hardware_names $selected_hardware_id]

puts "Selected USB device: $hardware_name\n\n\n"


set operation "P;$sof_name"

if {[catch {exec quartus_pgm -c $hardware_name -m JTAG -o $operation} result]} {
	puts "\nResult: $result\n"
	puts "ERROR: Programming failed.\n"
} else {
	puts "Programming device 1 successful! :D"
}
#open a_mine.bat
#exec de2_mine.bat &
#set tworun [open a_mine.bat]

############## by chunk