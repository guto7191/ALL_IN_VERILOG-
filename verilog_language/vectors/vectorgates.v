module vectorgates(
    input [2:0] a, b,
    output [2:0] out_or_bitwise, 
    output [5:0] out_not,
    output out_or_logico
);


    assign out_or_bitwise = a | b;
    assign out_or_logico = a || b;
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a; 




endmodule