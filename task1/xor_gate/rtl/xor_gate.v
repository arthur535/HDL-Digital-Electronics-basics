module xor_gate(
  input wire a,
  input wire b,
  input wire c,
  input wire d,
  output reg q
);

  assign q = (a&b)^(c&d);

  //always @(a or b) begin
  //  q = (a&b) ^ (c&d);
  //end

endmodule
