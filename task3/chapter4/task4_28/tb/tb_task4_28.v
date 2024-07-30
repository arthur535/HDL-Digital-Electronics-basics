module top_testbench();
  reg [1:0] S;
  reg En;
  reg [0:3] W;
  wire [0:3] Y;
  wire f;
  integer i;
  integer j;
  task4_28 uut (
    .S(S),
    .En(En),
    .W(W),
    .Y(Y),
    .f(f)
  );
  initial begin
    $monitor("Time = %0d, En = %b, S = %b, W = %b, Y = %b, f = %b", $time, En, S, W, Y, f);
    En = 1;
    for(i = 0; i < 4; i = i + 1) begin
      S = i;
      for(j = 0; j < 16; j = j + 1) begin
        W = j;
        #10;
      end
    end
    En = 0;
    S = 2'bx;
    W = 4'bx;
    $finish;
  end
endmodule
