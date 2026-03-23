class generator;
	transaction trans;
	mailbox gen2driv;
	int no_gen;
	event ended;

	function new(mailbox gen2driv);
		this.gen2driv = gen2driv;
	endfunction

	task main();
		repeat(no_gen) begin
			trans = new();
			assert (trans.randomize()) $display("[GEN]-- RANDOMIZATION PASSED");
			else $fatal("[GEN] RANDOMIZATION FAILED");
		       trans.display("GENERATOR");
			gen2driv.put(trans);
			trans.cov_sample();
	 	end
		trans.cov_display();
	-> ended;
	endtask
endclass	
