
module t3(
        input wire wr,
        input wire [15:0] alu_out,
        output reg [15:0] out
    );





    always @(*) begin
        case(wr)
            1'b1 : begin
                out = 16'bZZZZZZZZZZZZZZZZ;
            end
            1'b0 : begin
                out = alu_out;
            end
        endcase
    end


endmodule
