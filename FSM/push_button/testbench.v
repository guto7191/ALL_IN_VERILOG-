module testbench;

    reg press, clk, reset;

    wire open_cw, close_cw;

    top_module DUT (
        .press(press),
        .clk(clk),
        .reset(reset),
        .open_cw(open_cw),
        .close_cw(close_cw)
    );


    initial begin
        clk = 1'b0;
    end
    
    always  begin
        #1 clk = ~clk;
    end

    initial begin
        $dumpfile("teste.vcd");
        $dumpvars(0, testbench);

        $monitor(" press = %b | clk = %b | reset = %b | open_cw = %b | close_cw = %b", press, clk, reset, open_cw, close_cw);
        
        reset = 1'b1; 
        press = 1'b0;
        #1 reset = 1'b0;
        #1 press = 1'b1;
        #20 press = 1'b0;
        #1 press = 1'b1;
        #20 $finish();
    end
endmodule