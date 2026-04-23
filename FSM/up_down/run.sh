iverilog -o teste.out -s testbench testbench.v fsm.v top_module.v
vvp teste.out
gtkwave teste.vcd