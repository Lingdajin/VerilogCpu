
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

    reg [31:0] mul_temp;    //乘法结果暂存


    always @(*) begin : P1
        
        integer I1;

        reg [15:0] temp1, temp2, temp3;
        reg [31:0] res32;   //32位结果暂存，可用于循环移位

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
            4'b0101 : begin    //逻辑左移
                res32 = {alu_b,16'b0000_0000_0000_0000} << alu_a[3:0];    //将源操作数作为移位次数（取低4位，即移位0~15次，再高就是循环），目的操作数作为被移位数
                temp2 = res32[31:16];   //截取缓存的高16位作为结果
            end
            4'b0110 : begin   //逻辑右移
                res32 = {16'b0000_0000_0000_0000,alu_b} >> alu_a[3:0];    //将源操作数作为移位次数（取低4位，即移位0~15次，再高就是循环），目的操作数作为被移位数
                temp2 = res32[15:0];   //截取缓存的低16位作为结果
            end
            4'b0111 : begin     //dest_reg取反
                temp2 = ~alu_b;
            end
            4'b1000 : begin     //除法赋值
                // if(div_done) begin
                //     temp2 = div_result;
                // end
                temp2 = alu_b / alu_a;
            end
            4'b1001 :  begin    //乘法赋值
                mul_temp = alu_b * alu_a;
                temp2 = mul_temp[15:0];
            end
            4'b1010 : begin     //循环左移
                res32 = {alu_b,alu_b} << alu_a[3:0];    //将源操作数作为移位次数（取低4位，即移位0~15次，再高就是循环），目的操作数作为被移位数
                temp2 = res32[31:16];   //截取缓存的高16位作为结果
            end
            4'b1011 : begin     //循环右移
                res32 = {alu_b,alu_b} >> alu_a[3:0];    //将源操作数作为移位次数（取低4位，即移位0~15次，再高就是循环），目的操作数作为被移位数
                temp2 = res32[15:0];   //截取缓存的低16位作为结果
            end
            4'b1100 : begin     //算数右移
                case(alu_b[15])
                    1'b1 : begin
                        res32 = {16'b1111_1111_1111_1111,alu_b} >> alu_a[3:0];    //将源操作数作为移位次数（取低4位，即移位0~15次，再高就是循环），目的操作数作为被移位数
                        temp2 = res32[15:0];   //截取缓存的低16位作为结果
                    end
                    1'b0 : begin
                        res32 = {16'b0000_0000_0000_0000,alu_b} >> alu_a[3:0];    //将源操作数作为移位次数（取低4位，即移位0~15次，再高就是循环），目的操作数作为被移位数
                        temp2 = res32[15:0];   //截取缓存的低16位作为结果
                    end
                endcase
            end
            4'b1101 : begin : RBIT  //按位反转
                for(I1 = 0; I1 < 16; I1 = I1 + 1) begin
                    temp2[I1] = alu_b[15-I1];
                end
            end
            4'b1110 : begin     //按字节反转
                temp2 = {alu_b[7:0],alu_b[15:8]};
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
        case(alu_func)  //原溢出判断有问题，加法减法需分开判断
            4'b0000 : begin
                if((alu_a[15] == 1'b1 && alu_b[15] == 1'b1 && temp2[15] == 1'b0) || (alu_a[15] == 1'b0 && alu_b[15] == 1'b0 && temp2[15] == 1'b1)) begin
                    v <= 1'b1;
                end
                else begin
                    v <= 1'b0;
                end
            end
            4'b0001 : begin
                if((alu_a[15] == 1'b1 && alu_b[15] == 1'b0 && temp2[15] == 1'b1) || (alu_a[15] == 1'b0 && alu_b[15] == 1'b1 && temp2[15] == 1'b0)) begin
                    v <= 1'b1;
                end
                else begin
                    v <= 1'b0;
                end
            end
            4'b1001 : begin     //乘法溢出标志位,若高16位不全为0则溢出
                if((mul_temp[31:16] && 16'b1111_1111_1111_1111) != 0) begin
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
            4'b1100 : begin     //算术右移c值
                c <= alu_b[0];
            end
            default : begin
                c <= 1'b0;
            end
        endcase
    end


endmodule
