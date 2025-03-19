
module ar(
        input wire [15:0] alu_out,
        input wire [15:0] pc,
        input wire [1:0] rec,
        input wire clk,
        input wire reset,
        output reg [15:0] q
    );





    always @(posedge clk or negedge reset) begin
        if(reset == 1'b0) begin
            q <= 16'b0000000000000000;
        end else begin
            case(rec)
                2'b01 : begin
                    q <= pc;
                end
                2'b11 : begin
                    q <= alu_out;
                end
                default : begin
                end
            endcase
        end
    end


endmodule
