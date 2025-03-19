
module bus_dir(
        input wire wr,
        inout reg [15:0] data_bus,
        input wire [15:0] alu_out,
        output reg [15:0] mem_data
    );





    always @(*) begin
        case(wr)
            1'b1 : begin
                mem_data <= data_bus;
            end
            1'b0 : begin
                data_bus <= alu_out;
            end
        endcase
    end


endmodule
