
module reg_mux(
        input wire [15:0] reg_0,
        input wire [15:0] reg_1,
        input wire [15:0] reg_2,
        input wire [15:0] reg_3,
        input wire [15:0] reg_4,
        input wire [15:0] reg_5,
        input wire [15:0] reg_6,
        input wire [15:0] reg_7,
        input wire [15:0] reg_8,
        input wire [15:0] reg_9,
        input wire [15:0] reg_a,
        input wire [15:0] reg_b,
        input wire [15:0] reg_c,
        input wire [15:0] reg_d,
        input wire [15:0] reg_e,
        input wire [15:0] reg_f,
        input wire [3:0] dest_reg,
        input wire [3:0] sour_reg,
        input wire [3:0] reg_sel,
        input wire en,
        output reg en_0,
        output reg en_1,
        output reg en_2,
        output reg en_3,
        output reg en_4,
        output reg en_5,
        output reg en_6,
        output reg en_7,
        output reg en_8,
        output reg en_9,
        output reg en_a,
        output reg en_b,
        output reg en_c,
        output reg en_d,
        output reg en_e,
        output reg en_f,
        output reg [15:0] dr,
        output reg [15:0] sr,
        output reg [15:0] reg_out
    );





    always @(dest_reg, sour_reg, reg_sel, reg_0, reg_1, reg_2, reg_3, reg_4, reg_5, reg_6, reg_7, reg_8, reg_9, reg_a, reg_b, reg_c, reg_d, reg_e, reg_f, en) begin : P1
        reg [15:0] temp;

        case(dest_reg)
            4'b0000 : begin
                dr <= reg_0;
                temp = 16'b0000000000000001;
            end
            4'b0001 : begin
                dr <= reg_1;
                temp = 16'b0000000000000010;
            end
            4'b0010 : begin
                dr <= reg_2;
                temp = 16'b0000000000000100;
            end
            4'b0011 : begin
                dr <= reg_3;
                temp = 16'b0000000000001000;
            end
            4'b0100 : begin
                dr <= reg_4;
                temp = 16'b0000000000010000;
            end
            4'b0101 : begin
                dr <= reg_5;
                temp = 16'b0000000000100000;
            end
            4'b0110 : begin
                dr <= reg_6;
                temp = 16'b0000000001000000;
            end
            4'b0111 : begin
                dr <= reg_7;
                temp = 16'b0000000010000000;
            end
            4'b1000 : begin
                dr <= reg_8;
                temp = 16'b0000000100000000;
            end
            4'b1001 : begin
                dr <= reg_9;
                temp = 16'b0000001000000000;
            end
            4'b1010 : begin
                dr <= reg_a;
                temp = 16'b0000010000000000;
            end
            4'b1011 : begin
                dr <= reg_b;
                temp = 16'b0000100000000000;
            end
            4'b1100 : begin
                dr <= reg_c;
                temp = 16'b0001000000000000;
            end
            4'b1101 : begin
                dr <= reg_d;
                temp = 16'b0010000000000000;
            end
            4'b1110 : begin
                dr <= reg_e;
                temp = 16'b0100000000000000;
            end
            4'b1111 : begin
                dr <= reg_f;
                temp = 16'b1000000000000000;
            end
        endcase
        if(en == 1'b0) begin
            temp = 16'b0000000000000000;
        end
        en_0 <= temp[0];
        en_1 <= temp[1];
        en_2 <= temp[2];
        en_3 <= temp[3];
        en_4 <= temp[4];
        en_5 <= temp[5];
        en_6 <= temp[6];
        en_7 <= temp[7];
        en_8 <= temp[8];
        en_9 <= temp[9];
        en_a <= temp[10];
        en_b <= temp[11];
        en_c <= temp[12];
        en_d <= temp[13];
        en_e <= temp[14];
        en_f <= temp[15];
        case(sour_reg)
            4'b0000 : begin
                sr <= reg_0;
            end
            4'b0001 : begin
                sr <= reg_1;
            end
            4'b0010 : begin
                sr <= reg_2;
            end
            4'b0011 : begin
                sr <= reg_3;
            end
            4'b0100 : begin
                sr <= reg_4;
            end
            4'b0101 : begin
                sr <= reg_5;
            end
            4'b0110 : begin
                sr <= reg_6;
            end
            4'b0111 : begin
                sr <= reg_7;
            end
            4'b1000 : begin
                sr <= reg_8;
            end
            4'b1001 : begin
                sr <= reg_9;
            end
            4'b1010 : begin
                sr <= reg_a;
            end
            4'b1011 : begin
                sr <= reg_b;
            end
            4'b1100 : begin
                sr <= reg_c;
            end
            4'b1101 : begin
                sr <= reg_d;
            end
            4'b1110 : begin
                sr <= reg_e;
            end
            4'b1111 : begin
                sr <= reg_f;
            end
        endcase
        case(reg_sel)
            4'b0000 : begin
                reg_out <= reg_0;
            end
            4'b0001 : begin
                reg_out <= reg_1;
            end
            4'b0010 : begin
                reg_out <= reg_2;
            end
            4'b0011 : begin
                reg_out <= reg_3;
            end
            4'b0100 : begin
                reg_out <= reg_4;
            end
            4'b0101 : begin
                reg_out <= reg_5;
            end
            4'b0110 : begin
                reg_out <= reg_6;
            end
            4'b0111 : begin
                reg_out <= reg_7;
            end
            4'b1000 : begin
                reg_out <= reg_8;
            end
            4'b1001 : begin
                reg_out <= reg_9;
            end
            4'b1010 : begin
                reg_out <= reg_a;
            end
            4'b1011 : begin
                reg_out <= reg_b;
            end
            4'b1100 : begin
                reg_out <= reg_c;
            end
            4'b1101 : begin
                reg_out <= reg_d;
            end
            4'b1110 : begin
                reg_out <= reg_e;
            end
            4'b1111 : begin
                reg_out <= reg_f;
            end
        endcase
    end


endmodule
