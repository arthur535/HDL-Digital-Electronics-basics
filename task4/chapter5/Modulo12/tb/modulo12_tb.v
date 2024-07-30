module testbench();
	reg clock;
	reg resetn;
	wire [3:0] q;

	initial begin 
		clock <= 0;
		forever #5 clock <= ~clock;
	end

	initial begin 
		resetn <= 0;
	        #50 
		resetn <= 1;
	end

	initial begin
		#1000
		$finish;
	end

	modulo12 dut_modulo12 (
		.clock (clock),
		.resetn (resetn),
		.q (q)
	);	
endmodule
