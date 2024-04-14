# add all signals to the Waveform window
add wave *

#resetting cpu
force reset_cpu 1
force clk_cpu 0
run 2

#putting clock on rising edge
force clk_cpu 1

force reset_cpu 0 2 -r 4
force clk_cpu 1  2 -r 4
force clk_cpu 0  4 -r 4

# run for 50 clock periods
# 50 clock periods x 4 timesteps per period = 200 timesteps

run 200
