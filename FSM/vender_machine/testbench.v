module testbench;



    reg clk, reset, dollar_in, quarter_in;
    wire dispense, change;


    top_module DUT(
        .clk(clk),
        .reset(reset),
        .dollar_in(dollar_in),
        .quarter_in(quarter_in),
        .dispense(dispense),
        .change(change)
    );


    initial begin
        clk = 1'b0;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("teste.vcd");
        $dumpvars(0, testbench);

        $monitor("dollar_in = %b  |  quarter_in = %b | dispense = %b | change = %b", dollar_in, quarter_in, dispense, change);
        
        reset = 1'b0;
        #3 reset = 1'b1;
        #2 dollar_in = 1'b1; quarter_in = 1'b0;
        #2 dollar_in = 1'b0; quarter_in = 1'b1;
        #50 $finish();
    end




endmodule