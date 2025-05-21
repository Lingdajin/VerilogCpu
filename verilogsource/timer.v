
module timer(
        input wire clk,
        input wire reset,
        input wire [15:0] ins,
        output reg [3:0] out
    );




    parameter [2:0]
              s0 = 0,
              s1 = 1,
              s2 = 2,
              s3 = 3,
              s4 = 4,
              s5 = 5,
              s6 = 6;

    reg [2:0] state;
    reg [2:0] order;    //控制时序，A组指令，B组指令，C组指令切换

    always @(posedge clk or negedge reset) begin
        if(reset == 1'b0) begin
            state <= s0;
        end else begin
            case(state)
                s0 : begin
                    state <= s1;
                end
                s1 : begin
                    state <= s2;
                end
                s2 : begin
                    if(ins[15] == 1'b0) begin
                        state <= s3;
                        order <= 3'b000; // A组指令
                    end
                    else if(ins[15:14] == 2'b10) begin
                        state <= s4;
                        order <= 3'b001; // B组指令
                    end
                    else if(ins[15:14] == 2'b11) begin
                        state <= s4;
                        order <= 3'b010; // C组指令
                    end
                end
                s3 : begin
                    state <= s1;
                end
                s4 : begin
                    if(order == 3'b001) begin   // B组指令
                        state <= s5;
                    end
                    else if(order == 3'b010)begin  // C组指令
                        state <= s6;
                    end
                end
                s5 : begin
                    state <= s1;
                end
                s6 : begin
                    state <= s4;
                    order <= 3'b001; // 切换为B组指令，由于C组指令和B组指令是交替的，所以这里需要切换
                end
                // s7 : begin
                //     state <= s5;
                // end
            endcase
        end
    end

    always @(*) begin
        case(state)
            s0 : begin
                out = 4'b0100;
            end
            s1 : begin
                out = 4'b0000;
            end
            s2 : begin
                out = 4'b0001;
            end
            s3 : begin
                out = 4'b0011;
            end
            s4 : begin
                out = 4'b0101;
            end
            s5 : begin
                out = 4'b0111;
            end
            s6 : begin
                out = 4'b1101;
            end
            // s7 : begin
            //     out = 4'b1111;
            // end
        endcase
    end


endmodule
