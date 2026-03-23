class scoreboard;

	mailbox mon2scb;
	int no_transaction;

	function new(mailbox mon2scb );
		this.mon2scb = mon2scb;
	endfunction
	
	bit pre_value;
	function bit ref_module (transaction trans);
		case({trans.s,trans.r})
			2'b00: ref_module = pre_value;
			2'b01: ref_module = 0;
			2'b10: ref_module = 1;
			2'b11: ref_module = 1'bx;
		       default:ref_module = 0;
	       endcase
	       pre_value = ref_module;
	endfunction
	
	task main();
	transaction trans;
	 bit exp_result;
 	forever begin
	 mon2scb.get(trans);
	 exp_result = ref_module(trans);
	 assert (exp_result == trans.q) $display("[SCB] RESULT AS EXPECTED");
	 else $error("[SCB] RESULT HAS ERROR|| expected : %d|| got: %d",exp_result,trans.q);
	 trans.display("SCOREBOARD");
 	no_transaction++;
end
endtask
endclass



