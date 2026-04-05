iverilog -o teste.out -s testbench testbench.v  subtraction.v full_adder.v
vvp teste.out
