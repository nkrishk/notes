set mac [lindex $argv 0]
set cli "show cable rpd $mac"
set mac_pattern {[a-f0-9]+\.[a-f0-9]+\.[a-f0-9]+}
set dscp_pattern {description\s+:\s+(.*)}

set output [exec "$cli"]
set lines [split $output "\n"]
foreach line $lines {
	set dscp ""
	if {[regexp "$mac_pattern" $line rpd_mac]} {
		set dscp_cli "test cable rpd db cfg-db dump id $rpd_mac"
		set dscp_output [exec "$dscp_cli"]
		set dscp_lines [split $dscp_output "\n"]
		foreach dscp_line $dscp_lines {
			regexp "$dscp_pattern" $dscp_line - dscp
		}
	}
	regsub -all {[\r\n]} $line "" line
	set line_dscp "$line$dscp"
	puts $line_dscp
}
