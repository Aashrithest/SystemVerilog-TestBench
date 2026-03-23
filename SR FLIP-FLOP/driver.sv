class driver;
	mailbox gen2driv;
	virtual intf vif;

	int no_transaction;


	function new(mailbox gen2driv, virtual intf vif);
		this.gen2driv = gen2driv;
		this.vif = vif;
	endfunction

	task reset();
		wait(vif.rst);
		$display("DRIVER STARTED THE RESET");
		vif.valid <=0;
		vif.s <=0;
		vif.r <=0;
		wait(!vif.rst);
		$display("DRIVER COMPLTED THE RESET");
	endtask

	task main();
		transaction trans;
		forever begin
			gen2driv.get(trans);
			@(posedge vif.clk);
			vif.valid <=1;
			vif.s <= trans.s;
			vif.r <= trans.r;
			@(posedge vif.clk);
			vif.valid <= 0;
			trans.q <= vif.q;
			trans.qb <= vif.qb;
			@(posedge vif.clk);
			trans.display("DRIVER");
			no_transaction++;
		end
	endtask
endclass

