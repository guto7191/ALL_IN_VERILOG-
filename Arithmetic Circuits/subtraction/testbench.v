module testbench;


    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    subtraction subtrac(
        .a(a),
        .b(b),
        .cin(cin),
        .sub(sum),
        .cout(cout)
    );


    task expect;
        input [3:0] valor_experado;

        if(valor_experado !== sum)begin
            $display("Teste falhou!!!");
            $display("a = %b | b = %b | sum = %b | cin = %b | cout = %b", a,b,sum,cin, cout);
            $display("Valor esperado para sum = ", valor_experado);
        end
        else begin
            $display("a = %b | b = %b | sum = %b | cin = %b | cout = %b", a,b,sum,cin, cout);
        end
    endtask


    initial begin
        $dumpfile("teste.vcd");
        $dumpvars(0, testbench);

           a = 4'b1111; b = 4'b0000; cin=1'b1; #2 expect(4'b1111);
        #2 a = 4'b1000; b = 4'b0111; cin=1'b1; #2 expect(4'b0001);
        #2 a = 4'b1001; b = 4'b1001; cin=1'b1; #2 expect(4'b0000);
        #2 a = 4'b1111; b = 4'b1111; cin=1'b1; #2 expect(4'b0000);
    end
endmodule 