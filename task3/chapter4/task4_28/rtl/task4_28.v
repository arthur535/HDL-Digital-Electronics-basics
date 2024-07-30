module task4_28 (
  input [1:0] S,
  input En,
  input [0:3] W,
  output wire [0:3] Y,
    output reg f
);
  integer i;
  
  dec2to4 u_dec2to4 (
    .S (S),
    .Y (Y),
    .En (En)
  );
  
  reg [0:3] A;
  always @(W, Y) begin
    for(i = 0; i < 4; i = i+1) begin
      A[i] = W[i] & Y[i];
    end
    f = |A;
  end 
endmodule
