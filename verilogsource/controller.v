
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
                sci <= 2'b01;           //alu_func中的c设置为1
                sst <= 2'b11;           //不更新CZVS
                alu_out_sel = 2'b10;    //写pc允许
                alu_in_sel <= 3'b100;   //对pc值进行操作
                alu_func <= 3'b000;     //pc值加一（B组指令的data实际是这里的pc值所代表）
                wr <= 1'b1;             //禁止alu_out进入数据总线
                rec <= 2'b01;           //ar读取pc值，并将pc值传入地址总线,预备读取instruction指令（需注意pc值先进入总线，再自增一）
            end
            3'b001 : begin
                dest_reg <= 4'b0000;
                sour_reg <= 4'b0000;
                offset <= 8'b00000000;
                sci <= 2'b00;           //alu_func中的c设置为0
                sst <= 2'b11;           //不更新CZVS
                alu_out_sel = 2'b00;    //禁止写pc,禁止写reg
                alu_in_sel <= 3'b000;   //运算使用目的寄存器和源寄存器，此处并不进行运算，无用
                alu_func <= 3'b000;     //alu_func为0000，且c为0，表示alu对输入数进行相加，不过此处不对结果进行处理，无用
                wr <= 1'b1;             //禁止alu_out进入数据总线
                rec <= 2'b10;           //ir读取数据总线，此处读取instruction指令，ir再将其传入controller
            end
            3'b011 : begin
                wr <= 1'b1;             //禁止alu_out进入数据总线
                rec <= 2'b00;           //不操作
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
                wr <= 1'b1;             //禁止alu_out进入数据总线
                sst <= 2'b11;           //不更新CZVS
                dest_reg <= temp3;
                sour_reg <= temp4;
                offset <= 8'b00000000;
                case(temp1)
                    /*
                    101时序中，使用立即数作为源操作数的数据设计一致，均为pc+1操作，故合并
                    */
                    8'b10000000,8'b10000001 : begin
                        sci <= 2'b01;           //c设置为1，可在alu中加1
                        alu_out_sel = 2'b10;    //写pc允许
                        alu_in_sel <= 3'b100;   //使用pc作为操作数，在alu中进行加1操作，即pc+1以进行data读取
                        rec <= 2'b01;           //ar读取pc值，将pc值传入地址总线,预备读取data
                    end
                    8'b10000010 : begin
                        sci <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 3'b001;
                        rec <= 2'b11;           //ar将sr的值送入地址总线，预备读取sr值对应地址的内存里的值
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
                sci <= 2'b00;               //c设为0
                sst <= 2'b11;               //flag不更新CZVS
                alu_func <= 3'b000;         //alu_func为0000，且c为0，此处alu无用
                rec <= 2'b00;               //ar ir不做任何事
                case(temp1)
                    8'b10000010,8'b10000001 : begin
                        alu_out_sel = 2'b01;        //写reg允许
                        alu_in_sel <= 3'b101;       //目的操作数设置为data
                        wr <= 1'b1;                 //禁止alu_out进入数据总线
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
