module fsm_detect(
    input clk,
    input reset,
    input d_in,
    output reg err
);

    reg [2:0] current_state, next_state;

    // codificar os estados
    localparam start    = 3'b000;
    localparam d0_is_1  = 3'b001;
    localparam d1_is_1  = 3'b010;
    localparam d0_not_1 = 3'b011;
    localparam d1_not_1 = 3'b100;


    // Next state
    always @(*) begin
        case(current_state)
            start   : 
                begin
                    if(d_in == 1'b0) begin
                        next_state = d0_not_1;
                    end
                    else begin
                        next_state = d0_is_1;
                    end

                end     
            d0_is_1: 
                begin
                    if(d_in == 1'b0) begin
                        next_state = d1_not_1;
                    end
                    else begin
                        next_state = d1_is_1;
                    end
                end
            d1_is_1: next_state = start;
            d0_not_1: next_state = d1_not_1;
            d1_not_1: next_state = start;
            default : next_state = start; 

        endcase
    end


    //memory state   
    always @(posedge clk, reset) begin
        if(!reset)begin
            current_state <= start;
        end
        else begin
            current_state <= next_state;
        end
    end


    // output logic
    always @(*) begin
        case(current_state)
            d1_is_1 :
                begin
                    if (d_in == 1'b1)begin
                        err = 1'b1;
                    end
                    else begin
                        err = 1'b0;
                    end
                end
            default : err = 1'b0;
        endcase
    end


endmodule 