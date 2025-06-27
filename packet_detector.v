`timescale 1ns/1ps

module packet_detector (
    input clk,
    input reset,
    input [7:0] X,
    output reg Y,
    output reg [1:0] state
);

    parameter IDLE = 2'b00, S1 = 2'b01, S2 = 2'b10, DONE = 2'b11;
    reg [1:0] next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        Y = 0;

        case (state)
            IDLE: if (X == 8'hAA) next_state = S1;
            S1:   if (X == 8'h55) next_state = S2;
            S2:   if (X == 8'hF0) next_state = DONE;
            DONE: begin
                Y = 1;
                next_state = IDLE;
            end
        endcase
    end

endmodule
