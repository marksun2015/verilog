/* 
Filename    : blocking_tb.v
Description : testbench of blocking assignment in always block
*/

 `include "blocking.v"
 
 module blocking_tb;
 
 reg clk;
 reg rst_n;
 reg a_i;
 reg b_i;
 wire a_o;
 wire b_o;
 
 initial begin
   clk = 1'b0;
   rst_n = 1'b0;
   a_i = 1'b1;
   b_i = 1'b0;
   #5;
   rst_n = 1'b1;
   #100;
   $finish;
 end
 
 always #10 clk = ~clk;
 
 initial begin
   $fsdbDumpfile("blocking.fsdb");
   $fsdbDumpvars(0, blocking_tb);
 end
 
 blocking blocking_0 (
   .clk(clk),
   .rst_n(rst_n),
   .a_i(a_i),
   .b_i(b_i),
   .a_o(a_o),
   .b_o(b_o)
 );
 
 endmodule
