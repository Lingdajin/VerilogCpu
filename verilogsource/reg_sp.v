module reg_sp(
        //input wire [15:0] d,
        input wire push,
        input wire pop,
        input wire clk,
        input wire reset,

        output reg [15:0] q
    );

    // reg [15:0] temp; // 用于存储栈顶指针的临时变量

    // always @(*) begin
    //     if(!reset) begin
    //         q = 16'h01FF;
    //     end
    //     else begin
    //         if(push == 1'b1) begin
    //             q = temp - 1'b1; // 栈顶指针向下移动
    //         end
    //         else if(pop == 1'b1) begin
    //             if(temp == 16'h01FF) begin
    //                 q = temp; // 判断是否空栈
    //             end
    //             else begin
    //                 q = temp + 1'b1; // 栈顶指针向上移动
    //             end
    //         end
    //         else begin
    //             //q = q; // 默认保持栈顶指针不变
    //         end
    //     end
    // end


    // always @(posedge clk or negedge reset) begin
    //     if(reset == 1'b0) begin
    //         temp <= 16'h01FF; // 以内存最高位为栈顶
    //     end else begin
    //         temp <= q; // 更新栈顶指针
    //     end
    // end

    always @(posedge clk or negedge reset) begin
        if(!reset) begin
            q <= 16'h03FF; // 以内存最高位为栈顶
        end else begin
            if(push == 1'b1)begin
                q <= q - 1'b1; // 栈顶指针向下移动
            end
            else if(pop == 1'b1) begin
                q <= q + 1'b1;
            end
            else begin
                q <= q; // 默认保持栈顶指针不变
            end
        end
    end


endmodule
