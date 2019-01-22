/* 
Filename    : nonblocking.v
Description : nonblocking assignment in always block
*/

 module nonblocking (
   clk,
   rst_n,
   a_i,
   b_i,
   a_o,
   b_o
 );
 
 input clk;
 input rst_n;
 input a_i;
 input b_i;
 output a_o;
 output b_o;
 
 reg a;
 reg b;
 
 assign a_o = a;
 assign b_o = b;
 
 always@(posedge clk or negedge rst_n) begin
   if (~rst_n) begin
     a <= a_i;
     b <= b_i;
   end
   else begin
     a <= b;
     b <= a;
   end
 end
 
 endmodule
