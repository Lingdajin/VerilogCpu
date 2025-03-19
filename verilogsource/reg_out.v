
module reg_out(
        input wire [15:0] ir,
        input wire [15:0] pc,
        input wire [15:0] reg_in,
        input wire [15:0] offset,
        input wire [15:0] alu_a,
        input wire [15:0] alu_b,
        input wire [15:0] alu_out,
        input wire [15:0] reg_testa,
        input wire [3:0] reg_sel,
        input wire [1:0] sel,
        output reg [15:0] reg_data
    );





    always @(ir, pc, reg_in, sel, reg_sel, offset, alu_a, alu_b, alu_out, reg_testa) begin : P1
        reg [5:0] temp;

        temp = {sel,reg_sel};
        case(sel)
            2'b00 : begin
                reg_data <= reg_in;
            end
            2'b01 : begin
                case(reg_sel)
                    4'b0000 : begin
                        reg_data <= offset;
                    end
                    4'b0001 : begin
                        reg_data <= alu_a;
                    end
                    4'b0010 : begin
                        reg_data <= alu_b;
                    end
                    4'b0011 : begin
                        reg_data <= alu_out;
                    end
                    4'b0100 : begin
                        reg_data <= reg_testa;
                    end
                    default : begin
                        reg_data <= 16'b0000000000000000;
                    end
                endcase
            end
            2'b11 : begin
                case(reg_sel)
                    4'b1110 : begin
                        reg_data <= pc;
                    end
                    4'b1111 : begin
                        reg_data <= ir;
                    end
                    default : begin
                        reg_data <= 16'b0000000000000000;
                    end
                endcase
            end
            default : begin
                reg_data <= 16'b0000000000000000;
            end
        endcase
    end


endmodule
