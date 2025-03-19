
module timer(
        input wire clk,
        input wire reset,
        input wire [15:0] ins,
        output reg [2:0] out
    );




    parameter [2:0]
              s0 = 0,
              s1 = 1,
              s2 = 2,
              s3 = 3,
              s4 = 4,
              s5 = 5;

    reg [2:0] state;

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
                    end
                    else begin
                        state <= s4;
                    end
                end
                s3 : begin
                    state <= s1;
                end
                s4 : begin
                    state <= s5;
                end
                s5 : begin
                    state <= s1;
                end
            endcase
        end
    end

    always @(*) begin
        case(state)
            s0 : begin
                out = 3'b100;
            end
            s1 : begin
                out = 3'b000;
            end
            s2 : begin
                out = 3'b001;
            end
            s3 : begin
                out = 3'b011;
            end
            s4 : begin
                out = 3'b101;
            end
            s5 : begin
                out = 3'b111;
            end
        endcase
    end


endmodule
