module testbench;

    reg clk, we;
    reg [15:0] bits;
    reg [7:0] din;
    wire [7:0] dout1, dout2, dout3, dout4;

    ram RAM(
        .clk(clk),
        .we(we),
        .bits(bits),
        .din(din),
        .dout1(dout1),
        .dout2(dout2),
        .dout3(dout3),
        .dout4(dout4)
    );

    initial clk = 1'b0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("teste.vcd");
        $dumpvars(0,testbench);
        $monitor("we = %b  | bits = %b | din = %b | dout1 = %b | dout2 = %b | dout3 = %b | dout4 = %b", we, bits, din, dout1, dout2, dout3, dout4);

        we = 1'b0;
        
        #10 we = 1'b1; 
        bits = 16'b000000_0000000000;
        din = 8'h01;
        
        #10   we = 1'b0;

        #10 we = 1'b1; 
        bits = 16'b000001_0001000000;
        din = 8'h02;

        #10   we = 1'b0;

        #10 we = 1'b1; 
        bits = 16'b000010_0000100000;
        din = 8'h04;

        #10   we = 1'b0;

        #10 we = 1'b1; 
        bits = 16'b000011_1000000001;
        din = 8'h08;

        #10   we = 1'b0;

        //Não escreve nas memórias
        #10 we = 1'b1; 
        bits = 16'b010000_1111111111;
        din = 8'h0f;

        #10   we = 1'b0;

        //Não escreve nas memórias
        #10 we = 1'b1; 
        bits = 16'b111000_1111111111;
        din = 8'h0f;


        #100   we = 1'b0;

        #100 $finish();

    end

endmodule