
module t1(
        input wire flag_c,
        input wire [1:0] sci,
        output reg alu_cin
    );





    always @(sci, flag_c) begin
        case(sci)
            2'b00 : begin
                alu_cin <= 1'b0;
            end
            2'b01 : begin
                alu_cin <= 1'b1;
            end
            2'b10 : begin
                alu_cin <= flag_c;
            end
            default : begin
                alu_cin <= 1'b0;
            end
        endcase
    end


endmodule
