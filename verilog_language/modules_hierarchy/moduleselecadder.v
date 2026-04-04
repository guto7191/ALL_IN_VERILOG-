module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] low_a, low_b, high_a, high_b, sum1, sum2, sum_low, sum_high;
    wire sinal_low, sinal_high, cout1, cout2, cout_low;

    assign {sinal_high, sinal_low} = 2'b10;
    assign {high_a, low_a} = a;
    assign {high_b, low_b} = b;


    add16 s1(
        .a(high_a),
        .b(high_b),
        .cin(sinal_low),
        .sum(sum1),
        .cout(cout1)
    ); 


    add16 s2(
        .a(high_a),
        .b(high_b),
        .cin(sinal_high),
        .sum(sum2),
        .cout(cout2)
    );


    add16 s_low(
        .a(low_a),
        .b(low_b),
        .cin(sinal_low),
        .sum(sum_low),
        .cout(cout_low)
    );


    assign sum_high = (cout_low) ? sum2 :sum1;
    
    assign sum = {sum_high, sum_low};



endmodule 