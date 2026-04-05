module subtraction(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sub,
    output cout
);

    wire [3:0] b_not;


    assign b_not = ~b;


    full_adder subs(
        .a(a),
        .b(b_not),
        .cin(cin), // cin tem que ser um nesse caso pq está auxiliando no complemento de dois
        .sum(sub),
        .cout(cout)
    );



endmodule