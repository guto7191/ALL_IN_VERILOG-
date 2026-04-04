module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire sinal, cout1, cout2;
    wire [15:0] high_a, high_b, low_a, low_b, sum_high, sum_low;
    assign sinal = 1'b0;
    assign {high_a, low_a} = a;
    assign {high_b, low_b} = b;
    
    add16 s1(
        .a(low_a),
        .b(low_b),
        .cin(sinal),
        .sum(sum_low),
        .cout(cout1)
    );
    
    add16 s2(
        .a(high_a),
        .b(high_b),
        .cin(cout1),
        .sum(sum_high),
        .cout(cout2)
    );
    
    assign sum = {sum_high, sum_low};
    
endmodule

module add1 ( input a, input b, input cin,  output sum, output cout );
	assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin); 
endmodule
