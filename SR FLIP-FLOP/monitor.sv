class monitor;

	mailbox mon2scb;
	virtual intf vif;

	function new(mailbox mon2scb, virtual intf vif);
		this.mon2scb = mon2scb;
		this.vif = vif;
	endfunction

	task main();
		transaction trans;
		forever begin
			trans = new();
			@(posedge vif.clk);
			wait(vif.valid);
			trans.s = vif.s;
			trans.r = vif.r;
			@(posedge vif.clk);
			trans.q = vif.q;
			trans.qb = vif.qb;
			@(posedge vif.clk);
			mon2scb.put(trans);
			trans.display("MONITOR");
		end
	endtask
endclass
