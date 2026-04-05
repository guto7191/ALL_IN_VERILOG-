module testbench;

    reg a, b, cin;
    wire sum, cout;


    full_adder ad(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );


    task expect;
        input valor_esperado;
        
        if(valor_esperado !== sum)begin 
            $display("Teste falhou!!!");
            $display("a = %b | b = %b | cin = %b | sum = %b | cout = %b ", a, b, cin, sum, cout);
            $display("Valor esperado para sum = %b", valor_esperado);
        end
        else begin
            $display("a = %b | b = %b | cin = %b | sum = %b | cout = %b ", a, b, cin, sum, cout);
        end
    endtask



    initial begin
        $dumpfile("teste.vcd");
        $dumpvars(0,testbench);
        
           cin = 1'b0; a = 1'b0; b=1'b0; #3 expect(1'b0);
        #2 cin = 1'b0; a = 1'b0; b=1'b1; #3 expect(1'b1); 
        #2 cin = 1'b0; a = 1'b1; b=1'b0; #3 expect(1'b1);
        #2 cin = 1'b0; a = 1'b1; b=1'b1; #3 expect(1'b0);
        #2 cin = 1'b1; a = 1'b0; b=1'b0; #3 expect(1'b1);
        #2 cin = 1'b1; a = 1'b0; b=1'b1; #3 expect(1'b0);
        #2 cin = 1'b1; a = 1'b1; b=1'b0; #3 expect(1'b0);
        #2 cin = 1'b1; a = 1'b1; b=1'b1; #3 expect(1'b1);

    end


endmodule 