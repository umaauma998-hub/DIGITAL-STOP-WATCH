`timescale 1ns/1ps

module digital_stopwatch_tb;

reg clk;
reg rst;
reg start_stop;

wire [5:0] minutes;
wire [5:0] seconds;
wire [6:0] milliseconds;

digital_stopwatch uut (
    .clk(clk),
    .rst(rst),
    .start_stop(start_stop),
    .minutes(minutes),
    .seconds(seconds),
    .milliseconds(milliseconds)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    start_stop = 0;

    // Reset
    #10;
    rst = 0;

    // Start stopwatch
    #10;
    start_stop = 1;

    // Run stopwatch
    #1050;

    // Stop stopwatch
    start_stop = 0;

    #50;

    // Start again
    start_stop = 1;

    #300;

    $finish;
end

initial
begin
    $monitor(
        "Time=%0t | Start_Stop=%b | %02d:%02d:%02d",
        $time,
        start_stop,
        minutes,
        seconds,
        milliseconds
    );
end

endmodule