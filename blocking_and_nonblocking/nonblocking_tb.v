/* 
Filename    : nonblocking_tb.v
Description : testbench of nonblocking assignment in always block
*/

 `include "nonblocking.v"
 
 module nonblocking_tb;
 
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
   $fsdbDumpfile("nonblocking.fsdb");
   $fsdbDumpvars(0, nonblocking_tb);
 end
 
 nonblocking nonblocking_0 (
   .clk(clk),
   .rst_n(rst_n),
   .a_i(a_i),
   .b_i(b_i),
   .a_o(a_o),
   .b_o(b_o)
 );
 
 endmodule
