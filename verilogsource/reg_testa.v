module reg_testa(
    input clk,
    input reset,
    input [3:0] input_a,
    input [3:0] input_b,
    input [3:0] input_c,
    input cin,
    input [1:0] rec,
    input pc_en,
    input reg_en,
    output reg [15:0] q
);

always @(posedge clk or negedge reset) begin
    if (~reset) begin
        q <= 16'd0;
    end else begin
        q <= {input_a[2:0], input_b, cin, input_c, rec, pc_en, reg_en};
    end
end

endmodule
