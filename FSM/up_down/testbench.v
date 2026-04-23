module testbench;

    reg clk, reset, up;
    wire [1:0] count;

    top_module DUT(
        .clk(clk),
        .reset(reset),
        .up(up),
        .count(count)
    );

    initial clk = 1'b0;

    always #5 clk = ~clk;


    initial begin
        $dumpfile("teste.vcd");
        $dumpvars(0, testbench);

        $monitor("UP = %b  |  count = %b", up, count);

        reset = 1'b0;
        #2 reset = 1'b1; up = 1'b1;
        #50 up = 1'b0;
        #30 reset = 1'b1;
        #30 $finish();
    end



endmodule