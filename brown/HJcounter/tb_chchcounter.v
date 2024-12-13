`timescale 1ns / 1ps
module tb_pipeline_counter;

    reg clk;
    reg rst_n;
    wire [6:0] cnt;
    wire [6:0] cnt2;
 pipeline_counter  DUT (
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt),
        .cnt2(cnt2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;
        #200;
        $finish;
    end

    initial begin
        $display("Time(ns) | rst_n | cnt | cnt2");
         end

endmodule

