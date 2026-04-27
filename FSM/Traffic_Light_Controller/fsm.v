module fsm(
    input clk,
    input reset,
    input Sa,
    input Sb,
    output Ga,
    output Ya,
    output Ra,
    output Gb,
    output Yb,
    output Rb
);

    reg [3:0] current_state, next_state; 
    reg Ga_temp, Ya_temp, Ra_temp, Gb_temp, Yb_temp, Rb_temp; 


    //Codificar os estados
    localparam s0  = 4'h0;
    localparam s1  = 4'h1;
    localparam s2  = 4'h2;
    localparam s3  = 4'h3;
    localparam s4  = 4'h4;
    localparam s5  = 4'h5;
    localparam s6  = 4'h6;
    localparam s7  = 4'h7;
    localparam s8  = 4'h8;
    localparam s9  = 4'h9;
    localparam s10 = 4'hA;
    localparam s11 = 4'hB;
    localparam s12 = 4'hC;



    //next state 
    always @(*)begin
        Ga_temp = 1'b0; 
        Ya_temp = 1'b0; 
        Ra_temp = 1'b0; 
        Gb_temp = 1'b0; 
        Yb_temp = 1'b0; 
        Rb_temp = 1'b0;

        case(current_state)
            s0  : 
                begin
                    Ga_temp = 1'b1;
                    Rb_temp = 1'b1;
                    next_state = s1;
                end
            s1  : 
                begin
                    Ga_temp = 1'b1;
                    Rb_temp = 1'b1;
                    next_state = s2;
                end
            s2  :
                begin
                    Ga_temp = 1'b1;
                    Rb_temp = 1'b1;
                    next_state = s3;
                end
            s3  :
                begin
                    Ga_temp = 1'b1;
                    Rb_temp = 1'b1;
                    next_state = s4;
                end
            s4  :
                 begin
                    Ga_temp = 1'b1;
                    Rb_temp = 1'b1;
                    next_state = s5;
                end
            s5  :
                begin
                    if(Sb == 1'b0) begin
                        Ga_temp = 1'b1;
                        Rb_temp = 1'b1;
                        next_state = s5;
                    end else begin
                        Ga_temp = 1'b1;
                        Rb_temp = 1'b1;
                        next_state = s6;
                    end
                end
            s6  : 
                begin
                    Ya_temp = 1'b1;
                    Rb_temp = 1'b1;
                    next_state = s7;
                end
            s7  :
                begin
                    Ra_temp = 1'b1;
                    Gb_temp = 1'b1;
                    next_state = s8;
                end
            s8  :
                begin
                    Ra_temp = 1'b1;
                    Gb_temp = 1'b1;
                    next_state = s9;
                end
            s9  :
                begin
                    Ra_temp = 1'b1;
                    Gb_temp = 1'b1;
                    next_state = s10;
                end
            s10 :
                begin
                    Ra_temp = 1'b1;
                    Gb_temp = 1'b1;
                    next_state = s11;
                end
            s11 :
                begin
                    if((Sa == 1'b1) | (Sb == 1'b0)) begin    // atenção
                        Ra_temp = 1'b1;
                        Gb_temp = 1'b1;
                        next_state = s12;
                    end else if((Sa == 1'b0) & (Sb == 1'b1)) begin
                        Ra_temp = 1'b1;
                        Gb_temp = 1'b1;
                        next_state = s11;
                    end else begin
                        Ra_temp = 1'b1;
                        Gb_temp = 1'b1;
                        next_state = s11;
                    end
                end
            s12 : 
                begin
                    Ra_temp = 1'b1;
                    Yb_temp = 1'b1;
                    next_state = s0;
                end
        endcase // não gera leach, pois os valores já foram iniciados
    end


    // memory state
    always @(posedge clk, negedge reset) begin
        if(!reset) begin
            current_state <= s0;
        end else begin
            current_state <= next_state; 
        end
    end


    assign {Ga, Ya, Ra, Gb, Yb, Rb} = {Ga_temp, Ya_temp, Ra_temp, Gb_temp, Yb_temp, Rb_temp};

endmodule