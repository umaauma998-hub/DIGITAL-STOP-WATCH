module digital_stopwatch(
    input clk,
    input rst,
    input start_stop,

    output reg [5:0] minutes,
    output reg [5:0] seconds,
    output reg [6:0] milliseconds
);

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        minutes      <= 6'd0;
        seconds      <= 6'd0;
        milliseconds <= 7'd0;
    end

    else if (start_stop)
    begin
        if (milliseconds == 7'd99)
        begin
            milliseconds <= 7'd0;

            if (seconds == 6'd59)
            begin
                seconds <= 6'd0;

                if (minutes == 6'd59)
                    minutes <= 6'd0;
                else
                    minutes <= minutes + 1'b1;
            end

            else
                seconds <= seconds + 1'b1;
        end

        else
        begin
            milliseconds <= milliseconds + 1'b1;
        end
    end
end

endmodule