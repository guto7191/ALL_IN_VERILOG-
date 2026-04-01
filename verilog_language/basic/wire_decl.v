module wire_decl(
    input a,b,c,d
    output out, out_n
);


    wire and_a_b, and_c_d, or_result;

    assign and_a_b = a & b;
    assign and_c_d = c & d;
    assign or_result = and_a_b | and_c_d;
    assign out = or_result;
    assign out_n = ~or_result;



endmodule