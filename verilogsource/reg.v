module reg_(
        input wire [15:0] d,
        input wire clk,
        input wire reset,
        input wire en,
        output reg [15:0] q
    );





    always @(posedge clk or negedge reset) begin
        if(reset == 1'b0) begin
            q <= 16'b0000000000000000;
        end else begin
            if(en == 1'b1) begin
                q <= d;
            end
        end
    end


endmodule
