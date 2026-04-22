module FSM_vender(
    input clk,
    input reset,
    input dollar_in,
    input quarter_in,
    output reg dispense,
    output reg change
);

    reg [1:0] next_state, current_state;
    // codificar os estados
    localparam WAIT = 2'b00;
    localparam c_25 = 2'b01;
    localparam c_50 = 2'b10;
    
    
    //Next State e output logic
    always @(*) begin
        case(current_state)

            WAIT : 
                begin
                    if(quarter_in == 1'b1)begin
                        next_state = c_25;
                        dispense = 1'b0;
                        change = 1'b0;
                    end
                    else if(dollar_in == 1'b1)begin
                        next_state = WAIT;
                        dispense = 1'b1;
                        change = 1'b1;
                    end 
                    else begin
                        next_state = WAIT;
                        dispense = 1'b0;
                        change = 1'b0;
                    end
                end
            c_25 :
                begin
                    if(quarter_in == 1'b1)begin
                        next_state = c_50;
                        dispense = 1'b0;
                        change = 1'b0;
                    end 
                    else begin
                        next_state = WAIT;
                        dispense = 1'b0;
                        change = 1'b0;
                    end
                end
            c_50 :
                begin
                    if(quarter_in == 1'b1) begin
                        next_state = WAIT;
                        dispense = 1'b1;
                        change = 1'b0;
                    end 
                    else begin
                        next_state = WAIT;
                        dispense = 1'b0;
                        change = 1'b0;
                    end
                end
            default: 
                begin
                    next_state = WAIT;    
                    dispense = 1'b0;
                    change = 1'b0;
                end 
        endcase
    end

    // Memory State
    always @(posedge clk, reset) begin
        if(!reset) begin
            current_state <= WAIT;
        end 
        else begin
            current_state <= next_state;
        end
    end

endmodule