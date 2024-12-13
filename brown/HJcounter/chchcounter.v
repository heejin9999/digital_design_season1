`timescale 1ns / 1ps
module pipeline_counter (
    input wire clk,
    input wire rst_n,
    output reg [6:0] cnt,
    output reg [6:0] cnt2
);

reg [6:0] stage1_out;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        stage1_out <= 7'd0;
    else if (stage1_out == 7'd49)
        stage1_out <= 7'd0;
    else
        stage1_out <= stage1_out + 1;
end

reg [6:0] stage2_out;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        stage2_out <= 7'd0;
    else
        stage2_out <= stage1_out;
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        cnt2 <= 7'd50;
    else if (cnt2 == 7'd99)
        cnt2 <= 7'd50;
    else if (stage2_out == 7'd49)
        cnt2 <= stage2_out + 1;
    else
        cnt2 <= cnt2 + 1;
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        cnt <= 7'd0;
    else
        cnt <= stage1_out;
end

endmodule

