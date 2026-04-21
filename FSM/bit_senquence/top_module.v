module top_module(
    input clk,
    input reset,
    input d_in,
    output  err
);

    fsm_detect fsm(
        .clk(clk),
        .reset(reset),
        .d_in(d_in),
        .err(err)
    );

endmodule