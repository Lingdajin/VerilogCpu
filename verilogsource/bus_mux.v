
module bus_mux(
        input wire [3:0] alu_in_sel,
        input wire [15:0] data,
        input wire [15:0] pc,
        input wire [15:0] offset,
        input wire [15:0] sr,
        input wire [15:0] dr,
        input wire [15:0] sp,

        output reg [15:0] alu_sr,
        output reg [15:0] alu_dr
    );



    reg [15:0] alu_dr_tmp; // 目的操作数缓存使用总线传来的data（为了兼容C组指令，其他指令用不到）

    always @(*) begin
        case(alu_in_sel)
            4'b0000 : begin
                alu_sr <= sr;
                alu_dr <= dr;
            end
            4'b0001 : begin
                alu_sr <= sr;
                alu_dr <= 16'b0000000000000000;
            end
            4'b0010 : begin
                alu_sr <= 16'b0000000000000000;
                alu_dr <= dr;
            end
            4'b0011 : begin
                alu_sr <= offset;
                alu_dr <= pc;
            end
            4'b0100 : begin
                alu_sr <= 16'b0000000000000000;
                alu_dr <= pc;
            end
            4'b0101 : begin     //源操作数清零，目的操作数使用总线传来的data
                alu_sr <= 16'b0000000000000000;
                alu_dr <= data;
            end
            4'b0110 : begin  //满递减堆栈
                alu_sr <= 16'b0000000000000000;
                alu_dr <= sp - 1'b1; // 栈顶指针预移动，由于push置一后，sp指针不会立即变化
            end
            4'b0111 : begin  //满递减堆栈
                alu_sr <= sp;
                alu_dr <= 16'b0000000000000000;
            end
            4'b1000 : begin     //目的操作数不变，源操作数使用总线传来的data
                alu_sr <= data;
                alu_dr <= dr;
            end
            4'b1001 : begin     //目的操作数不变，源操作数使用总线传来的data
                alu_sr <= 16'b0000000000000000;
                alu_dr <= 16'b0000000000000000;
                alu_dr_tmp <= data; // 目的操作数缓存使用总线传来的data（为了兼容C组指令，其他指令用不到）
            end
            4'b1010 : begin     //目的操作数不变（C组指令与0101配合,为了保留上一时序的data值），源操作数使用总线传来的data
                alu_sr <= data;
                alu_dr <= alu_dr_tmp;
            end
            default : begin
                alu_sr <= 16'b0000000000000000;
                alu_dr <= 16'b0000000000000000;
            end
        endcase
    end


endmodule
