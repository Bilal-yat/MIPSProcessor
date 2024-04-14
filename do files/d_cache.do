# add signals to the waveform window
add wave *

# testing the reset function
force addr "00000"
force reset 1
force clk 0
force input X"FAFA3B3B"
force data_write 0
run 2

# deactivate reset and write into one of the locations
force reset 0
force data_write 1
force clk 1
run 2
force clk 0
run 2

# writing into a different location
force addr "00100"
force input X"FB004CB1"
force clk 1
run 2
force clk 0
run 2

# attempting to write when clock on falling edge
force input X"00000101"
run 2

# setting clock to rising edge and retrying to write
force clk 1
run 2
