module half_adder(
    input a,
    input b,
    output sum,
    output cout
);

    assign sum = a ^ b; //a xor b
    assign cout = a & b; // a and b    



endmodule