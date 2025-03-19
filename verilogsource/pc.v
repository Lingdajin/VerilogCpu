
module pc(
        input wire [15:0] alu_out,
        input wire en,
        input wire clk,
        input wire reset,
        output reg [15:0] q
    );





    always @(posedge clk or negedge reset) begin
        if(reset == 1'b0) begin
            q <= 16'b0000000000000000;
        end else begin
            if(en == 1'b1) begin
                q <= alu_out;
            end
        end
    end


endmodule
