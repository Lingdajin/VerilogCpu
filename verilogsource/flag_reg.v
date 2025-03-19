
module flag_reg(
        input wire [1:0] sst,
        input wire c,
        input wire z,
        input wire v,
        input wire s,
        input wire clk,
        input wire reset,
        output reg flag_c,
        output reg flag_z,
        output reg flag_v,
        output reg flag_s
    );





    always @(posedge clk or negedge reset) begin
        if(reset == 1'b0) begin
            flag_c <= 1'b0;
            flag_z <= 1'b0;
            flag_v <= 1'b0;
            flag_s <= 1'b0;
        end else begin
            case(sst)
                2'b00 : begin
                    flag_c <= c;
                    flag_z <= z;
                    flag_v <= v;
                    flag_s <= s;
                end
                2'b01 : begin
                    flag_c <= 1'b0;
                end
                2'b10 : begin
                    flag_c <= 1'b1;
                end
                2'b11 : begin
                end
            endcase
        end
    end


endmodule
