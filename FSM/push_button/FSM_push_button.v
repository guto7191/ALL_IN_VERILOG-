module FSM_push_button(
    input press,
    input clk,
    input reset,
    output reg open_cw,
    output reg close_cw
);

    reg state, nst_state;

    // Codificando os estados
    localparam close = 1'b0;
    localparam open  = 1'b1;


// Next state 
   always @(*) begin
        case (state)
        open  : 
            begin
                if(press == 1'b1)begin
                    nst_state = close;
                end 
                else begin
                    nst_state = open;
                end
            end

        close : 
            begin
                if(press == 1'b1)begin
                    nst_state = open;
                end 
                else begin
                    nst_state = close;
                end
            end
        
        default : nst_state = close;
        endcase
   end 


// Memory State
   always @(posedge clk, reset) begin
        if(reset)begin
            state <= close;    
        end 
        else begin
            state <= nst_state;
        end
   end


// Output logic
   always @(*) begin
        case(state)
            open    : 
                begin
                    if(press == 1'b1)begin
                        open_cw  = 1'b0;
                        close_cw = 1'b1;
                    end
                    else begin
                        open_cw  = 1'b0;
                        close_cw = 1'b0;
                    end
                end

            close   :
                begin
                    if(press == 1'b1) begin
                        open_cw  = 1'b1;
                        close_cw = 1'b0;
                    end
                    else begin
                        open_cw  = 1'b0;
                        close_cw = 1'b0;
                    end
                end
            
            default : 
                begin
                    open_cw  = 1'b0;
                    close_cw = 1'b0;
                end
        endcase
   end   
endmodule