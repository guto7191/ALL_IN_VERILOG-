module top_module(
    input clk,
    input reset,
    input up,
    output [1:0] count
);



    fsm FSM(
        .clk(clk),
        .reset(reset),
        .up(up),
        .count(count)
    );

endmodule