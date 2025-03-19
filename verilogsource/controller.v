
module controller(
        input wire [2:0] timer,
        input wire [15:0] instruction,
        input wire c,
        input wire z,
        input wire v,
        input wire s,
        output reg [3:0] dest_reg,
        output reg [3:0] sour_reg,
        output reg [7:0] offset,
        output reg [1:0] sst,
        output reg [1:0] sci,
        output reg [1:0] rec,
        output reg [2:0] alu_func,
        output reg [2:0] alu_in_sel,
        output reg en_reg,
        output reg en_pc,
        output reg wr
    );





    always @(*) begin : P1
        integer I1;
        integer I2;
        
        reg [7:0] temp1, temp2;
        reg [3:0] temp3, temp4;
        reg [1:0] alu_out_sel;
        // integer I1;
        for (I1=7; I1 >= 0; I1 = I1 - 1) begin
            temp1[I1] = instruction[I1 + 8];
            temp2[I1] = instruction[I1];
        end
        // integer I2;
        for (I2=3; I2 >= 0; I2 = I2 - 1) begin
            temp3[I2] = instruction[I2 + 4];
            temp4[I2] = instruction[I2];
        end
        case(timer)
            3'b100 : begin
                dest_reg <= 4'b0000;
                sour_reg <= 4'b0000;
                offset <= 8'b00000000;
                sci <= 2'b00;
                sst <= 2'b11;
                alu_out_sel = 2'b00;
                alu_in_sel <= 3'b000;
                alu_func <= 3'b000;
                wr <= 1'b1;
                rec <= 2'b00;
            end
            3'b000 : begin
                dest_reg <= 4'b0000;
                sour_reg <= 4'b0000;
                offset <= 8'b00000000;
                sci <= 2'b01;
                sst <= 2'b11;
                alu_out_sel = 2'b10;
                alu_in_sel <= 3'b100;
                alu_func <= 3'b000;
                wr <= 1'b1;
                rec <= 2'b01;
            end
            3'b001 : begin
                dest_reg <= 4'b0000;
                sour_reg <= 4'b0000;
                offset <= 8'b00000000;
                sci <= 2'b00;
                sst <= 2'b11;
                alu_out_sel = 2'b00;
                alu_in_sel <= 3'b000;
                alu_func <= 3'b000;
                wr <= 1'b1;
                rec <= 2'b10;
            end
            3'b011 : begin
                wr <= 1'b1;
                rec <= 2'b00;
                case(temp1)
                    8'b00000000 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b000;
                    end
                    8'b00000001 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b001;
                    end
                    8'b00000010 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b010;
                    end
                    8'b00000011 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b001;
                    end
                    8'b00000100 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b100;
                    end
                    8'b00000101 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b010;
                    end
                    8'b00000110 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b011;
                    end
                    8'b00000111 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b001;
                        alu_func <= 3'b000;
                    end
                    8'b00001000 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b01;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b010;
                        alu_func <= 3'b001;
                    end
                    8'b00001001 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b01;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b010;
                        alu_func <= 3'b000;
                    end
                    8'b00001010 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b010;
                        alu_func <= 3'b101;
                    end
                    8'b00001011 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b010;
                        alu_func <= 3'b110;
                    end
                    8'b00001100 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b10;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b000;
                    end
                    8'b00001101 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b10;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b001;
                    end
                    8'b01000000 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = 2'b10;
                        alu_in_sel <= 3'b011;
                        alu_func <= 3'b000;
                    end
                    8'b01000100 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = {c,1'b0};
                        alu_in_sel <= 3'b011;
                        alu_func <= 3'b000;
                    end
                    8'b01000101 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = { ~c,1'b0};
                        alu_in_sel <= 3'b011;
                        alu_func <= 3'b000;
                    end
                    8'b01000110 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = {z,1'b0};
                        alu_in_sel <= 3'b011;
                        alu_func <= 3'b000;
                    end
                    8'b01000111 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = { ~z,1'b0};
                        alu_in_sel <= 3'b011;
                        alu_func <= 3'b000;
                    end
                    8'b01000001 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = {s,1'b0};
                        alu_in_sel <= 3'b011;
                        alu_func <= 3'b000;
                    end
                    8'b01000011 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = { ~s,1'b0};
                        alu_in_sel <= 3'b011;
                        alu_func <= 3'b000;
                    end
                    8'b01111000 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b01;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b000;
                    end
                    8'b01111010 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b10;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 3'b000;
                        alu_func <= 3'b000;
                    end
                    default : begin
                    end
                endcase
            end
            3'b101 : begin
                alu_func <= 3'b000;
                wr <= 1'b1;
                sst <= 2'b11;
                dest_reg <= temp3;
                sour_reg <= temp4;
                offset <= 8'b00000000;
                case(temp1)
                    8'b10000000,8'b10000001 : begin
                        sci <= 2'b01;
                        alu_out_sel = 2'b10;
                        alu_in_sel <= 3'b100;
                        rec <= 2'b01;
                    end
                    8'b10000010 : begin
                        sci <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 3'b001;
                        rec <= 2'b11;
                    end
                    8'b10000011 : begin
                        sci <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 3'b010;
                        rec <= 2'b11;
                    end
                    default : begin
                    end
                endcase
            end
            3'b111 : begin
                dest_reg <= temp3;
                sour_reg <= temp4;
                offset <= 8'b00000000;
                sci <= 2'b00;
                sst <= 2'b11;
                alu_func <= 3'b000;
                rec <= 2'b00;
                case(temp1)
                    8'b10000010,8'b10000001 : begin
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 3'b101;
                        wr <= 1'b1;
                    end
                    8'b10000000 : begin
                        alu_out_sel = 2'b10;
                        alu_in_sel <= 3'b101;
                        wr <= 1'b1;
                    end
                    8'b10000011 : begin
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 3'b001;
                        wr <= 1'b0;
                    end
                    default : begin
                    end
                endcase
            end
            default : begin
            end
        endcase
        en_reg <= alu_out_sel[0];
        en_pc <= alu_out_sel[1];
    end


endmodule
