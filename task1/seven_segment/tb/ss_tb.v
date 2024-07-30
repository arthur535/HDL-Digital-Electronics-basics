module testbench();
  reg[0:3] inputs;
  wire a;
  wire b;
  wire c;
  wire d;
  wire e;
  wire f;
  wire g;
  integer i;

  initial begin
	  for(i = 0; i < 16; i = i+1) begin
	    if(i > 9) begin
	      inputs = 4'bxxxx;
	    end else begin
	      inputs = i;
       	    end
      	     #10;
	  end
	  $finish;
  end

  seven_segment u_ss (
    .x0(inputs[0]),
    .x1(inputs[1]),
    .x2(inputs[2]),
    .x3(inputs[3]),
    .a (a),
    .b (b),
    .c (c),
    .d (d),
    .e (e),
    .f (f),
    .g (g)
  );
endmodule
