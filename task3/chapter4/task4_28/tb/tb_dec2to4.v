module tb_dec2to4();
  reg [1:0] S;
  reg En;
  wire [0:3] Y;

  dec2to4  u_dec2to4(
    .S (S),
    .Y (Y),
    .En(En)
  );

  initial begin
	$monitor("Time = %0d, S = %d, En = %b, Y = %d", $time, S, En, Y);
        
        // Test all combinations of inputs with Enable = 1
        En = 1;
        S = 0;
        #10;
        S = 1;
        #10;
        S = 2;
        #10;
        S = 3;
        #10;

        En = 0;
        S = 2'bx;
        #10;
        $finish;
  end

endmodule
