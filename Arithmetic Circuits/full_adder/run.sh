iverilog -o teste.out -s testbench testbench.v full_adder.v half_adder.v
vvp teste.out