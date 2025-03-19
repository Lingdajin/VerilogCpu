
module ir(
        input wire [15:0] mem_data,
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
                2'b10 : begin
                    q <= mem_data;
                end
                default : begin
                end
            endcase
        end
    end


endmodule
