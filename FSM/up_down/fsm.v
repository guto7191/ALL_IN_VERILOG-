module fsm(
    input clk,
    input reset,
    input up,
    output reg [1:0] count
);

    reg [1:0] current_state, next_state;
    
    //codificação dos estados
    localparam c0 = 2'b00;
    localparam c1 = 2'b01;
    localparam c2 = 2'b10;
    localparam c3 = 2'b11;


    //next state
    always @(*) begin
        case(current_state)
            c0 : 
                begin
                    if(up == 1'b1) begin
                        next_state = c1;
                    end 
                    else  begin
                        next_state = c3;
                    end
                end
            c1 : 
                begin
                    if(up == 1'b1) begin
                        next_state = c2;
                    end 
                    else begin
                        next_state = c0;
                    end
                end
            c2 : 
                begin
                    if(up == 1'b1) begin
                        next_state = c3;
                    end 
                    else begin
                        next_state = c1;
                    end
                end
            c3 :
                begin
                    if(up == 1'b1) begin
                        next_state = c0;
                    end
                    else begin
                        next_state = c2;
                    end
                end
            default : next_state = c0;
        endcase
    end

    //memory state
    always @(posedge clk, negedge reset) begin
        if(!reset) begin
            current_state <= c0;
        end 
        else begin
            current_state <= next_state;
        end
    end


    // output logic
    always @(*) begin
        case(current_state)
            c0 : 
                begin
                    if(up == 1'b1) begin
                        count = c1;
                    end 
                    else begin
                        count = c3;
                    end
                end
            c1 :
                begin
                    if(up == 1'b1) begin
                        count = c2;
                    end
                    else begin
                        count = c0;
                    end
                end
            c2 : 
                begin
                    if(up == 1'b1) begin
                        count = c3;
                    end
                    else begin
                        count = c1;
                    end
                end
            c3 :
                begin
                    if(up == 1'b1) begin
                        count = c0;
                    end
                    else begin
                        count = c2;
                    end
                end
        endcase
    end

endmodule