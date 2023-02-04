`timescale 1ns / 1ps

module pmod_step_driver(
    input rst,
    input dir,
    input clk,
    input en,
    output reg [3:0] signal
    );
    
    // local parameters that hold the values of
    // each of the states. This way the states
    // can be referenced by name.
    localparam sig4 = 3'b001;
    localparam sig3 = 3'b011;
    localparam sig2 = 3'b010;
    localparam sig1 = 3'b110;
    localparam sig0 = 3'b000;
    
    // register values to hold the values
    // of the present and next states. 
    reg [2:0] present_state, next_state;
    
    // run when the present state, direction
    // or enable signals change.
    always @ (present_state, dir, en)
    begin
        // Based on the present state
        // do something.
        case(present_state)
        // If the state is sig4, the state where
        // the fourth signal is held high. 
        sig4:
        begin
            // If direction is 0 and enable is high
            // the next state is sig3. If direction
            // is high and enable is high
            // next state is sig1. If enable is low
            // next state is sig0.
            if (dir == 1'b0 && en == 1'b1)
                next_state = sig3;
            else if (dir == 1'b1 && en == 1'b1)
                next_state = sig1;
            else 
                next_state = sig0;
        end  
        sig3:
        begin
            // If direction is 0 and enable is high
            // the next state is sig2. If direction
            // is high and enable is high
            // next state is sig4. If enable is low
            // next state is sig0.
            if (dir == 1'b0&& en == 1'b1)
                next_state = sig2;
            else if (dir == 1'b1 && en == 1'b1)
                next_state = sig4;
            else 
                next_state = sig0;
        end 
        sig2:
        begin
            // If direction is 0 and enable is high
            // the next state is sig1. If direction
            // is high and enable is high
            // next state is sig3. If enable is low
            // next state is sig0.
            if (dir == 1'b0&& en == 1'b1)
                next_state = sig1;
            else if (dir == 1'b1 && en == 1'b1)
                next_state = sig3;
            else 
                next_state = sig0;
        end 
        sig1:
        begin
            // If direction is 0 and enable is high
            // the next state is sig4. If direction
            // is high and enable is high
            // next state is sig2. If enable is low
            // next state is sig0.
            if (dir == 1'b0&& en == 1'b1)
                next_state = sig4;
            else if (dir == 1'b1 && en == 1'b1)
                next_state = sig2;
            else 
                next_state = sig0;
        end
        sig0:
        begin
            // If enable is high
            // the next state is sig1. 
            // If enable is low
            // next state is sig0.
            if (en == 1'b1)
                next_state = sig1;
            else 
                next_state = sig0;
        end
        default:
            next_state = sig0; 
        endcase
    end 
    
    // State register that passes the next
    // state value to the present state 
    // on the positive edge of clock
    // or reset. 
    always @ (posedge clk, posedge rst)
    begin
        if (rst == 1'b1)
            present_state = sig0;
        else 
            present_state = next_state;
    end
    
    // Output Logic
    // Depending on the state
    // output signal has a different
    // value.     
    always @ (posedge clk)
    begin
        if (present_state == sig4)
            signal = 4'b1000;
        else if (present_state == sig3)
            signal = 4'b0100;
        else if (present_state == sig2)
            signal = 4'b0010;
        else if (present_state == sig1)
            signal = 4'b0001;
        else
            signal = 4'b0000;
    end
endmodule
