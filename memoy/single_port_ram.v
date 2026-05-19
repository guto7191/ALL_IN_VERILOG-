module single_port_ram (
    input  wire        clk,
    input  wire        we,   // write enable
    input  wire        cs,   // chip select
    input  wire [9:0]  addr, // endereco de 10-bit - RAM
    input  wire [7:0]  din,  // entrada de dados
    output      [7:0]  dout  // saida de dados
);

    reg [7:0] mem [0:1023];  // RAM de 1K x 8-bit
    reg [7:0] saida;

    assign dout = saida;

    always @(posedge clk) begin
        if (cs) begin
            if (we) begin
                mem[addr] <= din;
            end
            saida <= mem[addr];
        end
    end

endmodule
