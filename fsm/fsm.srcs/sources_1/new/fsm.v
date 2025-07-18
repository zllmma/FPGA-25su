`timescale 1ns / 1ps
module fsm (
    input wire clk,
    input wire rst_n,
    input wire A,
    input wire B,
    output reg [2:0] out
);

    parameter STATE_initial = 3'b000,
              STATE_1 = 3'b001,
              STATE_2 = 3'b010,
              STATE_3 = 3'b011,
              STATE_4 = 3'b100;
            

    reg [2:0] current_state;
    reg [2:0] next_state;

    

    // Sequential Logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= STATE_initial;
        else
            current_state <= next_state;
    end

    // Combinational Logic
    always @(*) begin
        // Default assignments
        next_state = STATE_initial;
        out = STATE_initial;

        case (current_state)
            STATE_initial: begin
                next_state = STATE_1;
                out = next_state;
            end
            STATE_1: begin
                if (!(A && B)) begin 
                    next_state = STATE_1;
                    out = next_state;
                end else begin 
                    next_state = STATE_2;
                    out = next_state;
                end
            end
            STATE_2: begin
                if (!A) begin
                    next_state = STATE_2;
                    out = next_state;
                end else begin 
                    next_state = STATE_3;
                    out = next_state;
                end
            end
            STATE_3: begin
                if (A && !B) begin
                    next_state = STATE_3;
                    out = next_state;
                end else if (!(A ^ B)) begin 
                    next_state = STATE_4;
                    out = next_state;
                end
            end
            STATE_4: begin
                next_state = STATE_4;
                out = next_state;
            end
            default: begin
                next_state = STATE_initial;
                out = next_state;
            end
        endcase
    end

endmodule