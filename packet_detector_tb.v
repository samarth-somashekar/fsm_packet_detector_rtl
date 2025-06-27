`timescale 1ns/1ps

module packet_detector_tb;

  reg clk = 0;
  reg reset = 1;
  reg [7:0] X;
  wire Y;
  wire [1:0] state;

  always #5 clk = ~clk;

  packet_detector dut (
    .clk(clk),
    .reset(reset),
    .X(X),
    .Y(Y),
    .state(state)
  );

  initial begin
    $dumpfile("packet.vcd");
    $dumpvars(0, packet_detector_tb);

    #10 reset = 0;

    X = 8'hAA; #10;
    X = 8'h55; #10;
    X = 8'hF0; #10;
    X = 8'h00; #10;
    X = 8'hAA; #10;
    X = 8'h55; #10;
    X = 8'hF0; #10;

    #40 $finish;
  end

endmodule
