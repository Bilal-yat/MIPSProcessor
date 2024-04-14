# add signals to the waveform window
add wave *

# initialization and addi r3, r0, 0
force input_addr "00000"
run 2;

# sub r1, r1, r1
force input_addr "00001"
run 2;


# andi r4, r4,
force input_addr "01001"
run 2;

# jump 00010
force input_addr "00011"
run 2;


# don’t care
force input_addr "11111"
run 2;
