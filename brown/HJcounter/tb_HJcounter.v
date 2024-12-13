`timescale 1ns / 1ps
module tb_hjcounter;

    reg clk;
    reg rst_n;
    wire [6:0] cnt;
    wire [6:0] cnt2;

    hjcounter uut (
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
        $display("Time(ns) | rst_n | cnt  | cnt2");
        $monitor("%8t |   %b   | %3d  | %3d", $time, rst_n, cnt, cnt2);
    end

    initial begin
        $dumpfile("hjcounter_waveform.vcd");
        $dumpvars(0, tb_hjcounter);
    end

endmodule

