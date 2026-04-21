module testbench;


    reg clk, reset, d_in;
    wire err;
    
    top_module DUT(
        .clk(clk),
        .reset(reset),
        .d_in(d_in),
        .err(err)
    );
    
    initial begin
        clk = 1'b0;
    end

    always #2 clk = ~clk;


    initial begin
        $dumpfile("teste.vcd");
        $dumpvars(0, testbench);

        $monitor("d_in = %b  |   err = %b", d_in, err);

        reset = 1'b0;
        d_in = 1'b0;
        #2 reset = 1'b1;
        #2 d_in = 1'b1;
        #4 d_in = 1'b0;
        #7 d_in = 1'b1;
        #20 $finish();

    end

endmodule