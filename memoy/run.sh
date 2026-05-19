iverilog -o teste.out -s testbench testbench.v ram.v single_port_ram.v
vvp teste.out