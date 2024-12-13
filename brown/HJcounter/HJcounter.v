`timescale 1ns / 1ps 
module hjcounter  (
	clk ,
	rst_n ,
	cnt,
        cnt2
);

input wire clk ;
input wire rst_n ;
output reg [6:0] cnt ;
output reg [6:0] cnt2 ;

reg [6:0]temp_cnt1;

always @(posedge clk,negedge rst_n)
begin

 if(~rst_n) 
 begin
 cnt<= 7'd0 ;
 temp_cnt1<=7'd0 ;
 end

 else if(cnt==7'd49)
 begin
 temp_cnt1<=cnt ;   
 cnt <= 7'd0;
 end

 else cnt <= cnt + 1;
 

end

always @(posedge clk,negedge rst_n)
begin 

if(~rst_n)
 begin
  cnt2 <= temp_cnt1 ;
  temp_cnt1<= 7'd49;
 end

else if(cnt2==99)
 
 cnt2<=temp_cnt1;

else cnt2 <= temp_cnt1+1 ;

end

endmodule 
