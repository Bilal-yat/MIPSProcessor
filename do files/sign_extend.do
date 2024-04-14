# add signals to the waveform window
add wave *
  
# testing load upper immediate
force in16 X"BA21"
force func_se 00
run 2;

# testing set less immediate
force in16 X"00A6"
force func_se 01
run 2;

# testing arithmetic format
force in16 X"FF47"
force func_se 10
run 2;

# testing logical format
force func_se 11
run 2;
