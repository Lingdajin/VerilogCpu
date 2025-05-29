/*
        * CPU0 - A simple 16-bit CPU design
        * 
        * This module serves as the top-level design for a simple CPU with 16 registers,
        * a 16-bit data bus, and a 16-bit address bus. It integrates various components
        * such as the controller, ALU, flag register, timer, instruction register, and
        * multiple registers.
        *
        * author: Ling_da_jin
*/

module cpu0(
        input wire reset,
        input wire clk,
        output reg wr,
        output reg c,
        output reg z,
        output reg v,
        output reg s,
        input wire [1:0] sel,
        input wire [3:0] reg_sel,
        inout wire [15:0] data_bus,
        output wire [15:0] address_bus,
        output wire [15:0] reg_data
    );

 

        /*
        此处定义了各模块间的连线
        */

    wire fc; wire fz; wire fv; wire fs; wire flag_c; wire flag_z; wire flag_v; wire flag_s; wire en_pc; wire en_reg; wire alu_cin; wire en_0; wire en_1; wire en_2; wire en_3; wire en_4; wire en_5; wire en_6; wire en_7; wire en_8; wire en_9; wire en_a; wire en_b; wire en_c; wire en_d; wire en_e; wire en_f; wire wre;
    wire [1:0] sst; wire [1:0] sci; wire [1:0] rec;
    wire [2:0] tim; wire [2:0] alu_func; wire [2:0] alu_in_sel;
    wire [3:0] d_reg; wire [3:0] s_reg;
    wire [7:0] offset_8;
    wire [15:0] instruction; wire [15:0] alu_sr; wire [15:0] alu_dr; wire [15:0] alu_out; wire [15:0] reg_test; wire [15:0] offset_16; wire [15:0] ar_bus; wire [15:0] pc_bus; wire [15:0] reg_0; wire [15:0] reg_1; wire [15:0] reg_2; wire [15:0] reg_3; wire [15:0] reg_4; wire [15:0] reg_5; wire [15:0] reg_6; wire [15:0] reg_7; wire [15:0] reg_8; wire [15:0] reg_9; wire [15:0] reg_a; wire [15:0] reg_b; wire [15:0] reg_c; wire [15:0] reg_d; wire [15:0] reg_e; wire [15:0] reg_f; wire [15:0] reg_inout; wire [15:0] sr; wire [15:0] dr;

    controller f1(
                   .timer(tim),
                   .instruction(instruction),
                   .c(flag_c),
                   .z(flag_z),
                   .v(flag_v),
                   .s(flag_s),
                   .dest_reg(d_reg),
                   .sour_reg(s_reg),
                   .offset(offset_8),
                   .sst(sst),
                   .sci(sci),
                   .rec(rec),
                   .alu_func(alu_func),
                   .alu_in_sel(alu_in_sel),
                   .en_reg(en_reg),
                   .en_pc(en_pc),
                   .wr(wre));

    always @(wre, flag_c, flag_z, flag_v, flag_s) begin
        wr <= wre;
        c <= flag_c;
        z <= flag_z;
        v <= flag_v;
        s <= flag_s;
    end

    alu f2(
            .cin(alu_cin),
            .alu_a(alu_sr),
            .alu_b(alu_dr),
            .alu_func(alu_func),
            .alu_out(alu_out),
            .c(fc),
            .z(fz),
            .v(fv),
            .s(fs));

    flag_reg f3(
                 .sst(sst),
                 .c(fc),
                 .z(fz),
                 .v(fv),
                 .s(fs),
                 .clk(clk),
                 .reset(reset),
                 .flag_c(flag_c),
                 .flag_z(flag_z),
                 .flag_v(flag_v),
                 .flag_s(flag_s));

    timer f4(
              .clk(clk),
              .reset(reset),
              .ins(data_bus),
              .out(tim));

    reg_testa f5(
                  .clk(clk),
                  .reset(reset),
                  .input_a(tim),
                  .input_b(alu_func),
                  .input_c(alu_in_sel),
                  .cin(alu_cin),
                  .rec(rec),
                  .pc_en(en_pc),
                  .reg_en(en_reg),
                  .q(reg_test));

    ir f6(
           .mem_data(data_bus),
           .rec(rec),
           .clk(clk),
           .reset(reset),
           .q(instruction));

    t1 f7(
           .flag_c(flag_c),
           .sci(sci),
           .alu_cin(alu_cin));

    t2 f8(
           .offset_8(offset_8),
           .offset_16(offset_16));

    t3 f9(
           .wr(wre),
           .alu_out(alu_out),
           .out(data_bus));

    ar f10(
           .alu_out(alu_out),
           .pc(pc_bus),
           .rec(rec),
           .clk(clk),
           .reset(reset),
           .q(address_bus));

    pc f11(
           .alu_out(alu_out),
           .en(en_pc),
           .clk(clk),
           .reset(reset),
           .q(pc_bus));

    reg_out f12(
                .ir(instruction),
                .pc(pc_bus),
                .reg_in(reg_inout),
                .offset(offset_16),
                .alu_a(alu_sr),
                .alu_b(alu_dr),
                .alu_out(alu_out),
                .reg_testa(reg_test),
                .reg_sel(reg_sel),
                .sel(sel),
                .reg_data(reg_data));

    reg_ r0(
            .d(alu_out),
            //reg files
            .clk(clk),
            .reset(reset),
            .en(en_0),
            .q(reg_0));

    reg_ r1(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_1),
            .q(reg_1));

    reg_ r2(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_2),
            .q(reg_2));

    reg_ r3(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_3),
            .q(reg_3));

    reg_ r4(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_4),
            .q(reg_4));

    reg_ r5(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_5),
            .q(reg_5));

    reg_ r6(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_6),
            .q(reg_6));

    reg_ r7(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_7),
            .q(reg_7));

    reg_ r8(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_8),
            .q(reg_8));

    reg_ r9(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_9),
            .q(reg_9));

    reg_ r10(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_a),
            .q(reg_a));

    reg_ r11(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_b),
            .q(reg_b));

    reg_ r12(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_c),
            .q(reg_c));

    reg_ r13(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_d),
            .q(reg_d));

    reg_ r14(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_e),
            .q(reg_e));

    reg_ r15(
            .d(alu_out),
            .clk(clk),
            .reset(reset),
            .en(en_f),
            .q(reg_f));

    reg_mux rm(
                .reg_0(reg_0),
                .reg_1(reg_1),
                .reg_2(reg_2),
                .reg_3(reg_3),
                .reg_4(reg_4),
                .reg_5(reg_5),
                .reg_6(reg_6),
                .reg_7(reg_7),
                .reg_8(reg_8),
                .reg_9(reg_9),
                .reg_a(reg_a),
                .reg_b(reg_b),
                .reg_c(reg_c),
                .reg_d(reg_d),
                .reg_e(reg_e),
                .reg_f(reg_f),
                .dest_reg(d_reg),
                .sour_reg(s_reg),
                .reg_sel(reg_sel),
                .en(en_reg),
                .en_0(en_0),
                .en_1(en_1),
                .en_2(en_2),
                .en_3(en_3),
                .en_4(en_4),
                .en_5(en_5),
                .en_6(en_6),
                .en_7(en_7),
                .en_8(en_8),
                .en_9(en_9),
                .en_a(en_a),
                .en_b(en_b),
                .en_c(en_c),
                .en_d(en_d),
                .en_e(en_e),
                .en_f(en_f),
                .dr(dr),
                .sr(sr),
                .reg_out(reg_inout));

    bus_mux bm(
                .alu_in_sel(alu_in_sel),
                .data(data_bus),
                .pc(pc_bus),
                .offset(offset_16),
                .sr(sr),
                .dr(dr),
                .alu_sr(alu_sr),
                .alu_dr(alu_dr));


endmodule
