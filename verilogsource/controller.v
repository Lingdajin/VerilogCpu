
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
        output reg [3:0] alu_func,
        output reg [3:0] alu_in_sel,
        output reg en_reg,
        output reg en_pc,
        output reg wr,
        output reg push,
        output reg pop
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
                alu_in_sel <= 4'b0000;
                alu_func <= 4'b00000;
                wr <= 1'b1;
                rec <= 2'b00;
                push <= 1'b0;
                pop <= 1'b0;
            end
            3'b000 : begin
                dest_reg <= 4'b0000;
                sour_reg <= 4'b0000;
                offset <= 8'b00000000;
                sci <= 2'b01;
                sst <= 2'b11;
                alu_out_sel = 2'b10;
                alu_in_sel <= 4'b0100;
                alu_func <= 4'b00000;
                wr <= 1'b1;
                rec <= 2'b01;
                push <= 1'b0;
                pop <= 1'b0;
            end
            3'b001 : begin
                dest_reg <= 4'b0000;
                sour_reg <= 4'b0000;
                offset <= 8'b00000000;
                sci <= 2'b00;
                sst <= 2'b11;
                alu_out_sel = 2'b00;
                alu_in_sel <= 4'b0000;
                alu_func <= 4'b00000;
                wr <= 1'b1;
                rec <= 2'b10;
                push <= 1'b0;
                pop <= 1'b0;
            end
            3'b011 : begin
                wr <= 1'b1;
                rec <= 2'b00;
                push <= 1'b0;
                pop <= 1'b0;
                case(temp1)
                    8'b00000000 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0000;
                    end
                    8'b00000001 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0001;
                    end
                    8'b00000010 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0010;
                    end
                    8'b00000011 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0001;
                    end
                    8'b00000100 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0100;
                    end
                    8'b00000101 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0010;
                    end
                    8'b00000110 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0011;
                    end
                    8'b00000111 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0001;
                        alu_func <= 4'b0000;
                    end
                    8'b00001000 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b01;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0010;
                        alu_func <= 4'b0001;
                    end
                    8'b00001001 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b01;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0010;
                        alu_func <= 4'b0000;
                    end
                    8'b00001010 : begin     //修改，逻辑左移，使用寄存器作为移位次数
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;   //更新czvs
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b0000;  //使用寄存器作为源操作数和目的操作数
                        alu_func <= 4'b0101;    //alu_func实现逻辑左移
                    end
                    8'b00001011 : begin     //修改，逻辑右移，使用寄存器作为移位次数
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0110;    //alu_func实现逻辑右移
                    end
                    8'b00001100 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b10;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0000;
                    end
                    8'b00001101 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b10;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0001;
                    end
                    8'b00001110 : begin     //取反NOT
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b10;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0111;     //添加运算指令取反
                    end
                    8'b00001111 : begin     //除法DIV
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b10;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b1000;     //添加除法指令
                    end
                    8'b00010000 : begin
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b10;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b1001;     //添加乘法指令
                    end
                    8'b0001_0001 : begin    //循环左移ROL
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b1010;
                    end
                    8'b0001_0010 : begin    //循环右移ROR
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b1011;
                    end
                    //由于算数左移与逻辑左移一致，故不另行添加
                    8'b0001_0011 : begin   //算数右移SHL
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b1100;    //alu_func实现算数右移
                    end
                    8'b01000000 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = 2'b10;
                        alu_in_sel <= 4'b0011;
                        alu_func <= 4'b0000;
                    end
                    8'b01000100 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = {c,1'b0};
                        alu_in_sel <= 4'b0011;
                        alu_func <= 4'b0000;
                    end
                    8'b01000101 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = { ~c,1'b0};
                        alu_in_sel <= 4'b0011;
                        alu_func <= 4'b0000;
                    end
                    8'b01000110 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = {z,1'b0};
                        alu_in_sel <= 4'b0011;
                        alu_func <= 4'b0000;
                    end
                    8'b01000111 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = { ~z,1'b0};
                        alu_in_sel <= 4'b0011;
                        alu_func <= 4'b0000;
                    end
                    8'b01000001 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = {s,1'b0};
                        alu_in_sel <= 4'b0011;
                        alu_func <= 4'b0000;
                    end
                    8'b01000011 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b11;
                        alu_out_sel = { ~s,1'b0};
                        alu_in_sel <= 4'b0011;
                        alu_func <= 4'b0000;
                    end
                    8'b01111000 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b01;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0000;
                    end
                    8'b01111010 : begin
                        dest_reg <= 4'b0000;
                        sour_reg <= 4'b0000;
                        offset <= temp2;
                        sci <= 2'b00;
                        sst <= 2'b10;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0000;
                        alu_func <= 4'b0000;
                    end
                    default : begin
                    end
                endcase
            end
            3'b101 : begin
                alu_func <= 4'b0000;
                wr <= 1'b1;
                sst <= 2'b11;
                dest_reg <= temp3;
                sour_reg <= temp4;
                offset <= 8'b00000000;
                case(temp1)
                    8'b10000000,8'b10000001 : begin
                        sci <= 2'b01;
                        alu_out_sel = 2'b10;
                        alu_in_sel <= 4'b0100;
                        rec <= 2'b01;
                        push <= 1'b0;
                        pop <= 1'b0;
                    end
                    8'b10000010 : begin
                        sci <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0001;
                        rec <= 2'b11;
                        push <= 1'b0;
                        pop <= 1'b0;
                    end
                    8'b10000011 : begin
                        sci <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0010;
                        rec <= 2'b11;
                        push <= 1'b0;
                        pop <= 1'b0;
                    end
                    8'b1000_0100 : begin    //PUSH命令
                        sci <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0110;   //读取堆栈指针
                        rec <= 2'b11;
                        push <= 1'b1;   //sp已经在上一time减一，不再操作
                        pop <= 1'b0;
                    end
                    8'b1000_0101 : begin    //POP命令
                        sci <= 2'b00;
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0111;
                        rec <= 2'b11;
                        push <= 1'b0;
                        pop <= 1'b0;  //先读取，再sp+1
                    end
                    8'b1000_0110,8'b1000_0111 : begin    //ROL_ ROR_命令,使用立即数data进行移位
                        sci <= 2'b01;   //c设置为1，可在alu中加1
                        alu_out_sel = 2'b10;    //写pc允许
                        alu_in_sel <= 4'b0100;   //使用pc作为操作数，在alu中进行加1操作，即pc+1以进行data读取
                        rec <= 2'b01;
                        push <= 1'b0;
                        pop <= 1'b0;
                    end
                    8'b1000_1000,8'b1000_1001 : begin    //SHL_ SHR_命令,使用立即数data进行移位
                        sci <= 2'b01;   //c设置为1，可在alu中加1
                        alu_out_sel = 2'b10;    //写pc允许
                        alu_in_sel <= 4'b0100;   //使用pc作为操作数，在alu中进行加1操作，即pc+1以进行data读取
                        rec <= 2'b01;
                        push <= 1'b0;
                        pop <= 1'b0;
                    end
                    8'b1000_1010 : begin    //SAR_命令,使用立即数data进行移位
                        sci <= 2'b01;   //c设置为1，可在alu中加1
                        alu_out_sel = 2'b10;    //写pc允许
                        alu_in_sel <= 4'b0100;   //使用pc作为操作数，在alu中进行加1操作，即pc+1以进行data读取
                        rec <= 2'b01;
                        push <= 1'b0;
                        pop <= 1'b0;
                    end
                    default : begin
                    end
                endcase
            end
            3'b111 : begin
                dest_reg <= temp3;
                sour_reg <= temp4;
                offset <= 8'b00000000;
                sci <= 2'b00;   //c设为1
                sst <= 2'b11;   //flag不做任何事
                rec <= 2'b00;   //ar ir不做任何事
                case(temp1)
                    8'b10000010,8'b10000001 : begin
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0101;
                        wr <= 1'b1;
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;    //alu_func为0000，且c为0，表示alu对输入数不进行任何操作
                    end
                    8'b10000000 : begin
                        alu_out_sel = 2'b10;
                        alu_in_sel <= 4'b0101;
                        wr <= 1'b1;
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;
                    end
                    8'b10000011 : begin
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0001;
                        wr <= 1'b0;
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;
                    end
                    8'b1000_0100 : begin    //PUSH命令
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0001;   //读取堆栈指针
                        wr <= 1'b0;
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;
                    end
                    8'b1000_0101 : begin    //POP命令
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0101;
                        wr <= 1'b1;
                        push <= 1'b0;
                        pop <= 1'b1;   //sp已在上一time加一，不再进行操作
                        alu_func <= 4'b0000;
                    end
                    default : begin
                    end
                    8'b1000_0110 : begin    //ROL_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b1010;    //实现立即数循环左移
                    end
                    8'b1000_0111 : begin    //ROR_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b1011;    //实现立即数循环右移
                    end
                    8'b1000_1000 : begin    //SHL_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0101;    //实现立即数逻辑左移
                    end
                    8'b1000_1001 : begin    //SHR_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0110;    //实现立即数逻辑右移
                    end
                    8'b1000_1010 : begin    //SAR_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b1100;    //实现立即数算数右移
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
