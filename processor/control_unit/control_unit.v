module control_unit(
    input [6:0] opcode,
    output reg lui,
    output reg pcsrc,
    output reg MemRead,
    output reg MemWrite,
    output reg [2:0] AluOp,
    output reg MemtoReg,
    output reg AluSrc2,
    output reg AluSrc1,
    output reg RegWrite,
    output reg Jump,
    output reg Branch
);
    //AluOp
    localparam R_TYPE = 3'b000; // ADD, SUB, AND, OR, XOR, SLT, SLTU, SLL, SRL, SRA
    localparam I_TYPE = 3'b001; //ADDI, ANDI, ORI, XORI, SLTI, SLTIU, SLLI, SRLI, SRAI, JALR
    localparam STORE  = 3'b010; // SB, SH, SW
    localparam BRANCH = 3'b011; // BEQ, BNE, BLT, BGE, BLTU, BGEU
    localparam U_TYPE = 3'b100; // LUI, AUIPC
    localparam JUMP   = 3'b101; // JAL, JALR
    localparam LOAD   = 3'b110; // LW, LH, LB, LHU, LBU
    localparam NOP    = 3'b111; // No operation


    always @(*) begin
        lui      = 1'b0;
        pcsrc    = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        AluOp    = 1'b0;
        MemtoReg = 1'b0;
        AluSrc2  = 1'b0;
        AluSrc1  = 1'b0;
        RegWrite = 1'b0;
        Jump     = 1'b0;
        Branch   = 1'b0;
        
        case(opcode)
 
        7'b0110011 : begin //R_type
            RegWrite = 1'b1;
            aluop    = R_TYPE; 
        end
        7'b0010011 : begin // I_type
            RegWrite = 1'b1;
            AluSrc2  = 1'b1;
            aluop    = I_TYPE;
        end
        7'b0000011 : begin  // Load
            RegWrite = 1'b1;
            MemRead  = 1'b1;
            MemtoReg = 1'b1;
            AluOp    = LOAD;
        end
        7'b0100011 : begin // Store
            MemWrite = 1'b1;
            AluSrc2  = 1'b1;
            aluop    = STORE;
        end
        7'b1100011 : begin  // Branch
            Branch = 1'b1;
            AluOp  = BRANCH;
        end
        7'b1101111, 7'b1100111 : begin // JAL e JALR
            RegWrite  = 1'b1;
            jump      = 1'b1;
            AluSrc1   = 1'b1;
            pcsrc     = (opcode == 7'b1100111) ? 1 : 0; // JALR only
            AluOp     = JUMP;
        end
        7'b0110111, 7'b0010111 : begin  //LUI e AUIPC
            RegWrite = 1'b1;
            AluSrc2  = 1'b1;
            AluSrc1  = (opcode == 7'b0010111) ? 1 : 0; // AUIPC only
            lui      = (opcode == 7'b0110111) ? 1 : 0; // LUI only
            AluOp    = U_TYPE;
        end 

        default : ;

    endcase

    end

endmodule