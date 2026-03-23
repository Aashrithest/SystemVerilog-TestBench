class transaction;
	rand bit s;
	rand bit r;

	bit q;
	bit qb;

	covergroup cgp;
		c1: coverpoint s;
		c2: coverpoint r;
		cx: cross c1, c2;
	endgroup

	function new();
		cgp = new();
	endfunction

	function void cov_sample();
		cgp.sample(); 
	endfunction

	function void cov_display();
		$display("COVERAGE : %0.2f", cgp.get_inst_coverage());
	endfunction

	function void display(string name);
		$display("-----------------------------------------------");
		$display("-------------[%s]------------------------------", name);
		$display("||S:%d|| R:%d||", s,r);
		$display("||Q:%d|| Qb:%d||", q, qb);
		$display("-----------------------------------------------");
	endfunction
endclass
