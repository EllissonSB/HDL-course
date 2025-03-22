module controller(input wire zero, input wire [2:0] phase, input [2:0] opcode, output reg sel, output reg rd, output reg ld_ir, output reg halt, output reg inc_pc, output reg ld_ac, output reg wr, output reg ld_pc, output reg data_e);
always @(*)begin
    case(phase)
    3'b000:begin
        sel=1;
        rd=0;
        ld_ir=0;
        halt=0;
        inc_pc=0;
        ld_ac=0;
        wr=0;
        ld_pc=0;
        data_e=0;
    end
    3'b001:begin
        sel=1;
        rd=1;
        ld_ir=0;
        halt=0;
        inc_pc=0;
        ld_ac=0;
        wr=0;
        ld_pc=0;
        data_e=0;
    end
    3'b010:begin
        sel=1;
        rd=1;
        ld_ir=1;
        halt=0;
        inc_pc=0;
        ld_ac=0;
        wr=0;
        ld_pc=0;
        data_e=0;
    end
    3'b011:begin
        sel=1;
        rd=1;
        ld_ir=1;
        halt=0;
        inc_pc=0;
        ld_ac=0;
        wr=0;
        ld_pc=0;
        data_e=0;
    end
    3'b100:begin
        sel=0;
        rd=0;
        ld_ir=0;
        halt=(opcode ==3'b000)?1:0;
        inc_pc=1;
        ld_ac=0;
        wr=0;
        ld_pc=0;
        data_e=0;
    end
    3'b101:begin
        sel=0;
        rd=((opcode == 3'b010) || (opcode == 3'b011)||(opcode == 3'b100)||(opcode == 3'b101))?1:0;
        ld_ir=0;
        halt=0;
        inc_pc=0;
        ld_ac=0;
        wr=0;
        ld_pc=0;
        data_e=0;
    end
    3'b110:begin
        sel=0;
        rd=((opcode == 3'b010) || (opcode == 3'b011)||(opcode == 3'b100)||(opcode == 3'b101))?1:0;
        ld_ir=0;
        halt=0;
        inc_pc=zero && (opcode == 3'b001);
        ld_ac=0;
        wr=0;
        ld_pc=(opcode == 3'b111)?1:0;
        data_e=(opcode ==3'b110)?1:0;
    end
    3'b111:begin
        sel=0;
        rd=((opcode == 3'b010) || (opcode == 3'b011)||(opcode == 3'b100)||(opcode == 3'b101))?1:0;
        ld_ir=0;
        halt=0;
        inc_pc=0;
        ld_ac=((opcode == 3'b010) || (opcode == 3'b011)||(opcode == 3'b100)||(opcode == 3'b101))?1:0;
        wr=(opcode ==3'b110)?1:0;
        ld_pc=(opcode == 3'b111)?1:0;
        data_e=(opcode ==3'b110)?1:0;
    end
    default:begin
        sel=1'bZ;
        rd=1'bZ;
        ld_ir=1'bZ;
        halt=1'bZ;
        inc_pc=1'bZ;
        ld_ac=1'bZ;
        wr=1'bZ;
        ld_pc=1'bZ;
        data_e=1'bZ;
    end
    endcase

end
endmodule
