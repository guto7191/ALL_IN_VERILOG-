module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 


    always@(*)begin
        if((sel_b1 == 1'b0) && (sel_b2 == 1'b0)) out_always = a;
        else if((sel_b1 == 1'b0) && (sel_b2 == 1'b1)) out_always = a;
        else if((sel_b1 == 1'b1) && (sel_b2 == 1'b0)) out_always = a;
        else if((sel_b1 == 1'b1) && (sel_b2 == 1'b1)) out_always = b;
        else out_always = 1'b0;
    end

    assign out_assign = ((sel_b1 == 1'b1) && (sel_b2 == 1'b1)): b ? a;





endmodule