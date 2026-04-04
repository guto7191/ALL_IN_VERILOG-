module testbench;


    reg a, b;
    wire sum, cout;


    half_adder adder(
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );


    task expect;
        input experado_out;
        if(sum !== experado_out)begin
            $display("Teste falho!!!!!!!");
            $display("a = %b | b = %b | sum  %b | cout = %b", a, b, sum, cout);
            $display("Valor de esperado = %b", experado_out);
            $finish;
        end
        else begin
            $display("a = %b | b = %b | sum  %b | cout = %b", a, b, sum, cout);
        end

    endtask

    initial begin
       $dumpfile("teste.vcd");
       $dumpvars(0,testbench);
       
       #1;

       #2 a=1'b0; b=1'b0; #1 expect(1'b0);
       #2 a=1'b0; b=1'b1; #1 expect(1'b1);
       #2 a=1'b1; b=1'b0; #1 expect(1'b1);
       #2 a=1'b1; b=1'b1; #1 expect(1'b0);



    end 



endmodule 