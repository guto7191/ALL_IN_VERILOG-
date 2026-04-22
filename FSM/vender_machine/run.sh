iverilog -o teste.out -s testbench testbench.v FSM_vender.v top_module.v 
vvp teste.out
gtkwave teste.vcd

