`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent
// Engineer: Kaitlyn Franz
// 
// Create Date: 01/23/2016 03:44:35 PM
// Design Name: Claw
// Module Name: pmod_step_interface
// Project Name: Claw_game
// Target Devices: Basys3
// Tool Versions: 2015.4
// Description: This module is the top module for a stepper motor controller
// using the PmodSTEP. It operates in Full Step mode and encludes an enable signal
// as well as direction control. The Enable signal is connected to switch one and 
// the direction signal is connected to switch zero. 
// 
// Dependencies: 
// 
// Revision: 1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pmod_step_interface(
    input clk,
    input rst,
    input direction,
    input en,
    output [3:0] signal_out
    );
    
    // Wire to connect the clock signal 
    // that controls the speed that the motor
    // steps from the clock divider to the 
    // state machine. 
    wire new_clk_net;
    
    // Clock Divider to take the on-board clock
    // to the desired frequency.
    clock_div clock_Div(
        .clk(clk),
        .rst(rst),
        .new_clk(new_clk_net)
        );
    
    // The state machine that controls which 
    // signal on the stepper motor is high.      
    pmod_step_driver control(
        .rst(rst),
        .dir(direction),
        .clk(new_clk_net),
        .en(en),
        .signal(signal_out)
        );    
    
endmodule
