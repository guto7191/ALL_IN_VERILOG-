module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [15:0] high_a, high_b_xor, low_a, low_b_xor, sum_high, sum_low;
    wire cout1, cout2;

    assign {high_b_xor, low_b_xor} = b ^ {32{sub}};
    assign {high_a, low_a} = a;


    add16 sub1(
        .a(low_a),
        .b(low_b_xor),
        .cin(sub),
        .sum(sum_low),
        .cout(cout1)
    );

    add16 sub2(
        .a(high_a),
        .b(high_b_xor),
        .cin(cout1),
        .sum(sum_high),
        .cout(cout2)
    );

    assign sum = {sum_high, sum_low};

endmodule
