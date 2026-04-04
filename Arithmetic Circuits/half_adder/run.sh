iverilog -o teste.out -s testbench testbench.v half_adder.v
vvp teste.out
gtkwave teste.vcd
