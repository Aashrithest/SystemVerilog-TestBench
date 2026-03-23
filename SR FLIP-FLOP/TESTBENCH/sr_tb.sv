`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module sr_tb;

bit clk, rst;

intf aintf(clk, rst);

test t1 (aintf);

sr_ff dut(.clk(aintf.clk), 
	.rst(aintf.rst), 
	.s(aintf.s), 
	.r(aintf.r), 
	.q(aintf.q), 
	.qb(aintf.qb));

initial begin
	$dumpfile("SR.vcd");
	$dumpvars(0,sr_tb);
	rst =1;
	#10 rst =0;
end
always #5 clk = ~clk;
endmodule



