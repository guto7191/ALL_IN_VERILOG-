module top_module(
    input press,
    input clk,
    input reset,
    output open_cw,
    output close_cw
);

    FSM_push_button fsm(
        .press(press),
        .clk(clk),
        .reset(reset),
        .open_cw(open_cw),
        .close_cw(close_cw)
    );


endmodule