module testbench;


    wire Ga, Ya, Ra, Gb, Yb, Rb;
    reg Sa, Sb, clk, reset;


    top_module DUT(
        .clk(clk),
        .reset(reset),
        .Sa(Sa),
        .Sb(Sb),
        .Ga(Ga),
        .Ya(Ya),
        .Ra(Ra),
        .Gb(Gb),
        .Yb(Yb),
        .Rb(Rb)
    );

    initial clk = 1'b0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("teste.vcd");
        $dumpvars(0, testbench);

        $monitor("Sa = %b  | Sb = %b | Ga = %b | Ya = %b | Ra  = %b | Ga = %b | Yb = %b | Rb = %b", Sa, Sb, Ga, Ya, Ra, Gb, Yb, Rb);

        reset = 1'b0;
        #2 reset = 1'b1; Sa = 1'b1; Sb = 1'b0;
        #100000 Sa = 1'b0; Sb = 1'b1;
        
        #20 $finish();

    end



endmodule