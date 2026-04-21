iverilog -o teste.out -s testbench testbench.v top_module.v FSM_push_button.v
vvp teste.out
gtkwave teste.vcd