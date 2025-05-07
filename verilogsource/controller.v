
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
                    8'b0001_0100 : begin    //按位反转RBIT
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0010;   //使用寄存器DR作为目的操作数
                        alu_func <= 4'b1101;    //alu_func实现按位反转
                    end
                    8'b0001_0101 : begin    //反转16位半字中的字节顺序REV
                        dest_reg <= temp3;
                        sour_reg <= temp4;
                        offset <= 8'b00000000;
                        sci <= 2'b00;
                        sst <= 2'b00;
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0010;   //使用寄存器DR作为目的操作数
                        alu_func <= 4'b1110;    //alu_func实现字节反转
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
                sst <= 2'b11;   //不更新CZVS
                dest_reg <= temp3;
                sour_reg <= temp4;
                offset <= 8'b00000000;
                case(temp1)
                    /*
                    101时序中，使用立即数作为源操作数的数据设计一致，均为pc+1操作，故合并
                    */
                    8'b10000000,8'b10000001,
                    8'b1000_0110,8'b1000_0111,  //ROL_ ROR_命令,使用立即数data进行移位
                    8'b1000_1000,8'b1000_1001,  //SHL_ SHR_命令,使用立即数data进行移位
                    8'b1000_1010,  //SAR_命令,使用立即数data进行移位
                    8'b1000_1011,8'b1000_1100,  //ADD_ SUB_命令,使用目的操作数DR和立即数data进行加减
                    8'b1000_1101,8'b1000_1110,  //AND_ CMP_命令,使用目的操作数DR和立即数data进行与操作、比较操作
                    8'b1000_1111,8'b1001_0000,8'b1001_0001,  //XOR_ TEST_ OR_ 命令,使用目的操作数DR和立即数data进行异或操作、与测试操作、或操作
                    8'b1001_0010,8'b1001_0011  //ADC_ SBB_命令,使用目的操作数DR和立即数data进行带进位加操作、带借位减操作
                    : begin
                        sci <= 2'b01;   //c设置为1，可在alu中加1
                        alu_out_sel = 2'b10;    //写pc允许
                        alu_in_sel <= 4'b0100;   //使用pc作为操作数，在alu中进行加1操作，即pc+1以进行data读取
                        rec <= 2'b01;   //ar将pc值传入地址总线,预备读取data
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
                    default : begin
                    end
                endcase
            end
            3'b111 : begin
                dest_reg <= temp3;
                sour_reg <= temp4;
                offset <= 8'b00000000;
                rec <= 2'b00;   //ar ir不做任何事
                case(temp1)
                    8'b10000010,8'b10000001 : begin
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0101;
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b11;   //flag不更新CZVS
                        wr <= 1'b1;
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;    //alu_func为0000，且c为0，表示alu对输入数不进行任何操作
                    end
                    8'b10000000 : begin
                        alu_out_sel = 2'b10;
                        alu_in_sel <= 4'b0101;
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b11;   //flag不更新CZVS
                        wr <= 1'b1;
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;
                    end
                    8'b10000011 : begin
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0001;
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b11;   //flag不更新CZVS
                        wr <= 1'b0;
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;
                    end
                    8'b1000_0100 : begin    //PUSH命令
                        alu_out_sel = 2'b00;
                        alu_in_sel <= 4'b0001;   //读取堆栈指针
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b11;   //flag不更新CZVS
                        wr <= 1'b0;
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;
                    end
                    8'b1000_0101 : begin    //POP命令
                        alu_out_sel = 2'b01;
                        alu_in_sel <= 4'b0101;
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b11;   //flag不更新CZVS
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
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b1010;    //实现立即数循环左移
                    end
                    8'b1000_0111 : begin    //ROR_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b1011;    //实现立即数循环右移
                    end
                    8'b1000_1000 : begin    //SHL_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0101;    //实现立即数逻辑左移
                    end
                    8'b1000_1001 : begin    //SHR_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0110;    //实现立即数逻辑右移
                    end
                    8'b1000_1010 : begin    //SAR_命令,使用立即数data进行移位
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b1100;    //实现立即数算数右移
                    end
                    8'b1000_1011 : begin    //ADD_命令,使用立即数data进行加法
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;    //实现立即数加法
                    end
                    8'b1000_1100 : begin    //SUB_命令,使用立即数data进行减法
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0001;    //实现立即数减法
                    end
                    8'b1000_1101 : begin    //AND_命令,使用立即数data进行与操作
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0010;    //实现立即数与操作
                    end
                    8'b1000_1110 : begin    //CMP_命令,使用立即数data进行比较
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0001;    //实现立即数比较操作
                    end
                    8'b1000_1111 : begin    //XOR_命令,使用立即数data进行异或操作
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0100;    //实现立即数异或操作
                    end
                    8'b1001_0000 : begin    //TEST_命令,使用立即数data进行与测试操作
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0010;    //实现立即数与测试操作
                    end
                    8'b1001_0001 : begin    //OR_命令,使用立即数data进行或操作
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b00;   //c设为0
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0011;    //实现立即数或操作
                    end
                    8'b1001_0010 : begin    //ADC_命令,使用立即数data进行带进位加法
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b10;   //c设为flag_c
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0000;    //实现立即数带进位加法
                    end
                    8'b1001_0011 : begin    //SBB_命令,使用立即数data进行带借位减法
                        alu_out_sel = 2'b01;    //允许写reg
                        alu_in_sel <= 4'b1000;   //使用data作为源操作数，目的操作数不变
                        sci <= 2'b10;   //c设为flag_c
                        sst <= 2'b00;   //flag更新CZVS
                        wr <= 1'b1;     //t3高阻态
                        push <= 1'b0;
                        pop <= 1'b0;
                        alu_func <= 4'b0001;    //实现立即数带进位减法
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
