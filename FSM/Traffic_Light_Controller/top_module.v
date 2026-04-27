module top_module(
    input clk,
    input reset,
    input Sa,
    input Sb,
    output Ga,
    output Ya,
    output Ra,
    output Gb,
    output Yb,
    output Rb
);


    fsm FSM(
        .clk(clk),
        .reset(reset),
        .Sa(Sa),
        .Sb(Sb),
        .Ga(Ga),
        .Ya(Ya),
        .Ra(Ra),
        .Gb(Gb),
        .Yb(Yb),
        .Rb(Rb)
    );


endmodule