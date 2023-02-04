`timescale 1ns / 1ps

module clock_div(
    input clk,
    input rst,
    output reg new_clk
    );
    
    // The constant that defines the clock speed. 
    // Since the system clock is 100MHZ, 
    // define_speed = 100MHz/(2*desired_clock_frequency)
    localparam define_speed = 26'd5000000;
    
    // Count value that counts to define_speed
    reg [25:0] count;
    
    // Run on the positive edge of the clk and rst signals
    always @ (posedge(clk),posedge(rst))
    begin
        // When rst is high set count and new_clk to 0
        if (rst == 1'b1)
        begin 
            count = 26'b0;   
            new_clk = 1'b0;            
        end
        // When the count has reached the constant
        // reset count and toggle the output clock
        else if (count == define_speed)
        begin
            count = 26'b0;
            new_clk = ~new_clk;
        end
        // increment the clock and keep the output clock
        // the same when the constant hasn't been reached        
        else
        begin
            count = count + 1'b1;
            new_clk = new_clk;
        end
    end
endmodule
