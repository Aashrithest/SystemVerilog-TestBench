program test (intf aintf);
	environment env;

	initial begin
		env = new(aintf);
		env.gen.no_gen = 10;
		env.run();
	end
endprogram
