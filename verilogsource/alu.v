
module alu(
        input wire cin,
        input wire [15:0] alu_a,
        input wire [15:0] alu_b,
        input wire [3:0] alu_func,
        output reg [15:0] alu_out,
        output reg c,
        output reg z,
        output reg v,
        output reg s
    );




    always @(*) begin : P1
        integer I1;
        integer I2;
        
        reg [15:0] temp1, temp2, temp3;

        temp1 = {15'b000000000000000,cin};
        
        case(alu_func)
            4'b0000 : begin
                temp2 = alu_b + alu_a + temp1;
            end
            4'b0001 : begin
                temp2 = alu_b - alu_a - temp1;
            end
            4'b0010 : begin
                temp2 = alu_a & alu_b;
            end
            4'b0011 : begin
                temp2 = alu_a | alu_b;
            end
            4'b0100 : begin
                temp2 = alu_a ^ alu_b;
            end
            4'b0101 : begin : P2
                temp2[0] = 1'b0;
                // integer I1;
                for (I1=15; I1 >= 1; I1 = I1 - 1) begin
                    temp2[I1] = alu_b[I1 - 1];
                end
            end
            4'b0110 : begin : P3
                temp2[15] = 1'b0;
                // integer I2;
                for (I2=14; I2 >= 0; I2 = I2 - 1) begin
                    temp2[I2] = alu_b[I2 + 1];
                end
            end
            4'b0111 : begin : P4     //dest_reg取反
                temp2 = ~alu_b;
            end
            4'b1000 : begin     //除法赋值
                // if(div_done) begin
                //     temp2 = div_result;
                // end
                temp2 = alu_b / alu_a;
            end
            default : begin
                temp2 = 16'b0000000000000000;
            end
        endcase
        alu_out <= temp2;
        if(temp2 == 16'b0000000000000000) begin
            z <= 1'b1;
        end
        else begin
            z <= 1'b0;
        end
        if(temp2[15] == 1'b1) begin
            s <= 1'b1;
        end
        else begin
            s <= 1'b0;
        end
        case(alu_func)
            4'b0000,4'b0001 : begin
                if((alu_a[15] == 1'b1 && alu_b[15] == 1'b1 && temp2[15] == 1'b0) || (alu_a[15] == 1'b0 && alu_b[15] == 1'b0 && temp2[15] == 1'b1)) begin
                    v <= 1'b1;
                end
                else begin
                    v <= 1'b0;
                end
            end
            default : begin
                v <= 1'b0;
            end
        endcase
        case(alu_func)
            4'b0000 : begin
                temp3 = 16'b1111111111111111 - alu_b - temp1;
                if(temp3 < alu_a) begin
                    c <= 1'b1;
                end
                else begin
                    c <= 1'b0;
                end
            end
            4'b0001 : begin
                if(alu_b < alu_a) begin
                    c <= 1'b1;
                end
                else begin
                    c <= 1'b0;
                end
            end
            4'b0101 : begin
                c <= alu_b[15];
            end
            4'b0110 : begin
                c <= alu_b[0];
            end
            default : begin
                c <= 1'b0;
            end
        endcase
    end


endmodule
