## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
#Buttons
    set_property PACKAGE_PIN U18 [get_ports rst]                        
        set_property IOSTANDARD LVCMOS33 [get_ports rst]

# Switches
set_property PACKAGE_PIN V17 [get_ports {direction}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {direction}]
set_property PACKAGE_PIN V16 [get_ports {en}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {en}]
	
##Pmod Header JC
    ##Sch name = JC1
#    set_property PACKAGE_PIN K17 [get_ports {JC[0]}]                    
#        set_property IOSTANDARD LVCMOS33 [get_ports {JC[0]}]
    ##Sch name = JC2
    #set_property PACKAGE_PIN M18 [get_ports {JC[1]}]                    
        #set_property IOSTANDARD LVCMOS33 [get_ports {JC[1]}]
    ##Sch name = JC3
    #set_property PACKAGE_PIN N17 [get_ports {JC[2]}]                    
        #set_property IOSTANDARD LVCMOS33 [get_ports {JC[2]}]
    ##Sch name = JC4
    #set_property PACKAGE_PIN P18 [get_ports {JC[3]}]                    
        #set_property IOSTANDARD LVCMOS33 [get_ports {JC[3]}]
    #Sch name = JC7
    set_property PACKAGE_PIN L17 [get_ports {signal_out[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[0]}]
    #Sch name = JC8
    set_property PACKAGE_PIN M19 [get_ports {signal_out[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[1]}]
    #Sch name = JC9
    set_property PACKAGE_PIN P17 [get_ports {signal_out[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[2]}]
    #Sch name = JC10
    set_property PACKAGE_PIN R18 [get_ports {signal_out[3]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[3]}]
        
        
#         #leds
#           set_property PACKAGE_PIN U16 [get_ports {signal_out[0]}]                    
#               set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[0]}]
#           #Sch name = JC8
#           set_property PACKAGE_PIN E19 [get_ports {signal_out[1]}]                    
#               set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[1]}]
#           #Sch name = JC9
#           set_property PACKAGE_PIN U19 [get_ports {signal_out[2]}]                    
#               set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[2]}]
#           #Sch name = JC10
#           set_property PACKAGE_PIN V19 [get_ports {signal_out[3]}]                    
#               set_property IOSTANDARD LVCMOS33 [get_ports {signal_out[3]}]
               
               
               set_property CFGBVS Vcco [current_design]
               set_property config_voltage 3.3 [current_design]
