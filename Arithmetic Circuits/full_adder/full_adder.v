module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    wire cout1, cout2, sum0;

    


    half_adder ad1(
        .a(a),
        .b(b),
        .sum(sum0),
        .cout(cout1)
    );

    half_adder ad2(
        .a(sum0),
        .b(cin),
        .sum(sum),
        .cout(cout2)
    );

    assign cout = cout1 | cout2;

endmodule