# ------------------------------------------------------------------------------
#  IO Map
# ------------------------------------------------------------------------------

# -------------Clock IO MAP------------------#

#25MHz clock - 
set_property PACKAGE_PIN C3 [get_ports i_clk]
set_property IOSTANDARD LVCMOS18 [get_ports i_clk]

#26MHz positive clock
#set_property PACKAGE_PIN C21 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#26MHz negative clock
#set_property PACKAGE_PIN C22 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#27MHz positive clock
#set_property PACKAGE_PIN E21 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#27MHz negative clock
#set_property PACKAGE_PIN E22 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#74.25MHz positive clock
#set_property PACKAGE_PIN V6 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#74.25MHz negative clock
#set_property PACKAGE_PIN V5 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#125MHz positive clock
#set_property PACKAGE_PIN F23 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#125MHz negative clock
#set_property PACKAGE_PIN F24 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#156.25MHz positive clock
#set_property PACKAGE_PIN Y6 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]

#156.25MHz negative clock
#set_property PACKAGE_PIN Y5 [get_ports clock_name]
#set_property IOSTANDARD LVCMOS18 [get_ports clock_name]


# -------------PMOD IO MAP------------------#

###PMOD-1###

# PMOD 1 - pin 1: upper right pin
set_property PACKAGE_PIN H12 [get_ports i_Switch[0]]
set_property IOSTANDARD LVCMOS33 [get_ports i_Switch[0]]

# PMOD 1 - pin 3: upper pin
set_property PACKAGE_PIN E10 [get_ports i_Switch[1]]
set_property IOSTANDARD LVCMOS33 [get_ports i_Switch[1]]

# PMOD 1 - pin 5: upper pin
set_property PACKAGE_PIN D10 [get_ports i_Switch[2]]
set_property IOSTANDARD LVCMOS33 [get_ports i_Switch[2]]

# PMOD 1 - pin 7: upper left pin
set_property PACKAGE_PIN C11 [get_ports i_Switch[3]]
set_property IOSTANDARD LVCMOS33 [get_ports i_Switch[3]]

# PMOD 1 - pin 2: lower right pin
#set_property PACKAGE_PIN B10 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 1 - pin 4: lower pin
#set_property PACKAGE_PIN E12 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 1 - pin 6: lower pin
#set_property PACKAGE_PIN D11 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 1 - pin 8: lower left pin
#set_property PACKAGE_PIN B11 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]


###PMOD-2###

# PMOD 2 - pin 1: upper right pin
set_property PACKAGE_PIN J11 [get_ports o_LED[0]]
set_property IOSTANDARD LVCMOS33 [get_ports o_LED[0]]

# PMOD 2 - pin 3: upper pin
set_property PACKAGE_PIN J10 [get_ports o_LED[1]]
set_property IOSTANDARD LVCMOS33 [get_ports o_LED[1]]

# PMOD 2 - pin 5: upper pin
set_property PACKAGE_PIN K13 [get_ports o_LED[2]]
set_property IOSTANDARD LVCMOS33 [get_ports o_LED[2]]

# PMOD 2 - pin 7: upper left pin
set_property PACKAGE_PIN K12 [get_ports o_LED[3]]
set_property IOSTANDARD LVCMOS33 [get_ports o_LED[3]]

# PMOD 2 - pin 2: lower right pin
#set_property PACKAGE_PIN H11 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 2 - pin 4: lower pin
#set_property PACKAGE_PIN G10 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 2 - pin 6: lower pin
#set_property PACKAGE_PIN F12 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 2 - pin 8: lower left pin
#set_property PACKAGE_PIN F11 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]


###PMOD-3###

# PMOD 3 - pin 1: upper right pin
set_property PACKAGE_PIN AE12 [get_ports o_Segments[0]]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segments[0]]

# PMOD 3 - pin 3: upper pin
set_property PACKAGE_PIN AF12 [get_ports o_Segments[1]]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segments[1]]

# PMOD 3 - pin 5: upper pin
set_property PACKAGE_PIN AG10 [get_ports o_Segments[2]]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segments[2]]

# PMOD 3 - pin 7: upper left pin
set_property PACKAGE_PIN AH10 [get_ports o_Segments[3]]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segments[3]]

# PMOD 3 - pin 2: lower right pin
set_property PACKAGE_PIN AF11 [get_ports o_Segments[4]]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segments[4]]

 PMOD 3 - pin 4: lower pin
set_property PACKAGE_PIN AG11 [get_ports o_Segments[5]]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segments[5]]

# PMOD 3 - pin 6: lower pin
set_property PACKAGE_PIN AH12 [get_ports o_Segments[6]]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segments[6]]

# PMOD 3 - pin 8: lower left pin
#set_property PACKAGE_PIN AH11 [get_ports o_Segments[7]]
#set_property IOSTANDARD LVCMOS33 [get_ports o_Segments[7]]


###PMOD-4###

# PMOD 4 - pin 1: upper right pin
#set_property PACKAGE_PIN AC12 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 4 - pin 3: upper pin
#set_property PACKAGE_PIN AD12 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 4 - pin 5: upper pin
#set_property PACKAGE_PIN AE10 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 4 - pin 7: upper left pin
#set_property PACKAGE_PIN AF10 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 4 - pin 2: lower right pin
#set_property PACKAGE_PIN AD11 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 4 - pin 4: lower pin
#set_property PACKAGE_PIN AD10 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 4 - pin 6: lower pin
#set_property PACKAGE_PIN AA11 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]

# PMOD 4 - pin 8: lower left pin
#set_property PACKAGE_PIN AA10 [get_ports pin_name]
#set_property IOSTANDARD LVCMOS33 [get_ports pin_name]


# ------------------------------------------------------------------------------
#  Clock Virtual clock        
# ------------------------------------------------------------------------------
#create_clock -add -name i_clk -period 40.00 
create_clock -period 40.000 -name i_clk -waveform {0.000 20.000} [get_ports i_clk]

# ------------------------------------------------------------------------------
# Clock Group
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Clock Domain Group
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
#  Output Timing
# ------------------------------------------------------------------------------

# Set false paths for all LED outputs
set_false_path -to [get_ports output_port[*]]

# Set output delays for each individual output: 1-2ns delay

#output LEDS
set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_LED[0]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_LED[0]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_LED[1]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_LED[1]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_LED[2]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_LED[2]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_LED[3]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_LED[3]]


#output 7-segment display
set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_Segments[0]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_Segments[0]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_Segments[1]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_Segments[1]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_Segments[2]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_Segments[2]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_Segments[3]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_Segments[3]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_Segments[4]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_Segments[4]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_Segments[5]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_Segments[5]]

set_output_delay -clock [get_clocks i_clk] -min 1.000 [get_ports o_Segments[6]]
set_output_delay -clock [get_clocks i_clk] -max 2.000 [get_ports o_Segments[6]]

# ------------------------------------------------------------------------------
#  Input Timing
# ------------------------------------------------------------------------------

# Set false paths for all switch inputs
set_false_path -from [get_ports input_port[*]]

# Set input delays for each individual switch input: 1-2ns delay

#input switches
set_input_delay -clock [get_clocks i_clk] -min 1.000 [get_ports i_Switch[0]]
set_input_delay -clock [get_clocks i_clk] -max 2.000 [get_ports i_Switch[0]]

set_input_delay -clock [get_clocks i_clk] -min 1.000 [get_ports i_Switch[1]]
set_input_delay -clock [get_clocks i_clk] -max 2.000 [get_ports i_Switch[1]]

set_input_delay -clock [get_clocks i_clk] -min 1.000 [get_ports i_Switch[2]]
set_input_delay -clock [get_clocks i_clk] -max 2.000 [get_ports i_Switch[2]]

set_input_delay -clock [get_clocks i_clk] -min 1.000 [get_ports i_Switch[3]]
set_input_delay -clock [get_clocks i_clk] -max 2.000 [get_ports i_Switch[3]]

