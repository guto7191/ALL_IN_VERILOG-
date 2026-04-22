module top_module(
    input  clk,
    input  reset,
    input  dollar_in,
    input  quarter_in,
    output dispense,
    output change
);


  FSM_vender fsm(
    .clk(clk),
    .reset(reset),
    .dollar_in(dollar_in),
    .quarter_in(quarter_in),
    .dispense(dispense),
    .change(change)
  );



endmodule