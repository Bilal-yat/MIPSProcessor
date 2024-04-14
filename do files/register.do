# Register DO file

add wave reset
add wave clk
add wave din
add wave write
add wave read_a
add wave read_b
add wave write_address
add wave out_a
add wave out_b


# testing the reset function

force reset 1
force clk 0
force din X"FAFA3B3B"
force write 0
force write_address "00101"
force read_a "00000"
force read_b "00001"
run 2


# testing turning off reset and writing the previously entered data to R5

force reset 0
run 2
force write 1
run 2
force clk 1
run 2
force clk 0
run 2


# writing X"FAFA3B3B" to R14 then outputting value on out_a and out_b

force write_address "01110"
run 2
force read_a "01110"
force read_b "01110"
force clk 1
run 2
force clk 0
run 2


# attempting to write new data with "write" set to 0

force write 0
run 2
force clk 1
run 2
force clk 0
run 2


# writing data to all registers R0-R31

force write 1
force write_address "00000"
force din X"0000000"
force clk 1
run 2
force clk 0
run 2

force write 1
force write_address "00001"
force din X"00000001"
force clk 1
run 2
force clk 0
run 2


force write_address "00010"
force din X"00000002"
force clk 1
run 2
force clk 0
run 2 


force write_address "00011"
force din X"00000003"
force clk 1
run 2
force clk 0
run 2


force write_address "00100"
force din X"00000004"
force clk 1
run 2
force clk 0
run 2


force write_address "00101"
force din X"00000005"
force clk 1
run 2
force clk 0
run 2


force write_address "00110"
force din X"00000006"
force clk 1
run 2
force clk 0
run 2 


force write_address "00111"
force din X"00000007"
force clk 1
run 2
force clk 0
run 2 


force write_address "01000"
force din X"00000008"
force clk 1
run 2
force clk 0
run 2


force write_address "01001"
force din X"00000009"
force clk 1
run 2
force clk 0
run 2


force write_address "01010"
force din X"0000000A"
force clk 1
run 2
force clk 0
run 2


force write_address "01011"
force din X"0000000B"
force clk 1
run 2
force clk 0
run 2


force write_address "01100"
force din X"0000000C"
force clk 1
run 2
force clk 0
run 2


force write_address "01101"
force din X"0000000D"
force clk 1
run 2
force clk 0
run 2


force write_address "01110"
force din X"0000000E"
force clk 1
run 2
force clk 0
run 2


force write_address "01111"
force din X"0000000F"
force clk 1
run 2
force clk 0
run 2


force write_address "10000"
force din X"00000010"
force clk 1
run 2
force clk 0
run 2


force write_address "10001"
force din X"00000011"
force clk 1
run 2
force clk 0
run 2


force write_address "10010"
force din X"00000012"
force clk 1
run 2
force clk 0
run 2


force write_address "10011"
force din X"00000013"
force clk 1
run 2
force clk 0
run 2


force write_address "10100"
force din X"00000014"
force clk 1
run 2
force clk 0
run 2


force write_address "10101"
force din X"00000015"
force clk 1
run 2
force clk 0
run 2


force write_address "10110"
force din X"00000016"
force clk 1
run 2
force clk 0
run 2


force write_address "10111"
force din X"00000017"
force clk 1
run 2
force clk 0
run 2


force write_address "11000"
force din X"00000018"
force clk 1
run 2
force clk 0
run 2


force write_address "11001"
force din X"00000019"
force clk 1
run 2
force clk 0
run 2


force write_address "11010"
force din X"0000001A"
force clk 1
run 2
force clk 0
run 2


force write_address "11011"
force din X"0000001B"
force clk 1
run 2
force clk 0
run 2


force write_address "11100"
force din X"0000001C"
force clk 1
run 2
force clk 0
run 2


force write_address "11101"
force din X"0000001D"
force clk 1
run 2
force clk 0
run 2


force write_address "11110"
force din X"0000001E"
force clk 1
run 2
force clk 0
run 2


force write_address "11111"
force din X"0000001F"
force clk 1
run 2
force clk 0
run 2 


# setting "write" to 0 and reading content of all 32 registers


force write 0
force read_a "00000"
force read_b "00001"
run 2


force read_a "00010"
force read_b "00011"
run 2


force read_a "00100"
force read_b "00101"
run 2


force read_a "00110"
force read_b "00111"
run 2


force read_a "01000"
force read_b "01001"
run 2


force read_a "01010"
force read_b "01011"
run 2


force read_a "01100"
force read_b "01101"
run 2


force read_a "01110"
force read_b "01111"
run 2


force read_a "10000"
force read_b "10001"
run 2


force read_a "10010"
force read_b "10011"
run 2


force read_a "10100"
force read_b "10101"
run 2


force read_a "10011"
force read_b "10100"
run 2


force read_a "10101"
force read_b "10110"
run 2


force read_a "10111"
force read_b "11000"
run 2


force read_a "11001"
force read_b "11010"
run 2


force read_a "11011"
force read_b "11100"
run 2


force read_a "11101"
force read_b "11110"
run 2


force read_a "11111"
run 2
