module ram(
    input clk,
    input we,
    input [15:0] bits,
    input [7:0] din,
    output [7:0] dout1,
    output [7:0] dout2,
    output [7:0] dout3,
    output [7:0] dout4
);

    wire cs1, cs2, cs3, cs4;
    wire [9:0] addr;
    wire [5:0] seletor_mem;

    assign {seletor_mem, addr} = bits;

    assign cs1 = (seletor_mem == 6'h0) ? 1'b1 : 1'b0;
    assign cs2 = (seletor_mem == 6'h1) ? 1'b1 : 1'b0;
    assign cs3 = (seletor_mem == 6'h2) ? 1'b1 : 1'b0;
    assign cs4 = (seletor_mem == 6'h3) ? 1'b1 : 1'b0;
    
    single_port_ram ram1 (
        .clk(clk),
        .we(we),
        .cs(cs1),
        .addr(addr),
        .din(din),
        .dout(dout1)
    );

    single_port_ram ram2 (
        .clk(clk),
        .we(we),
        .cs(cs2),
        .addr(addr),
        .din(din),
        .dout(dout2)
    );


    single_port_ram ram3 (
        .clk(clk),
        .we(we),
        .cs(cs3),
        .addr(addr),
        .din(din),
        .dout(dout3)
    );

    single_port_ram ram4 (
        .clk(clk),
        .we(we),
        .cs(cs4),
        .addr(addr),
        .din(din),
        .dout(dout4)
    );

endmodule