// Code your design here

module seven_segment (
  input x0,
  input x1,
  input x2,
  input x3,

  output a,
  output b,
  output c,
  output d,
  output e,
  output f,
  output g
);

  assign a = x0 | x2 | ~(x1 ^ x3);

  assign b = x0 | ~x1 | ~(x2 ^ x3);

  assign c = x0 | x1 | ~x2 | x3;

  assign d = x0 | (~x1 & x2) | (~x1 & ~x3) | (x1 & ~x2 & x3) | (x2 & ~x3);

  assign e = (x2 & ~x3) | (~x1 & ~x3);

  assign f = x0 | (x1 & ~x2) | (x1 & ~x3) | (~x2 & ~x3);

  assign g = x0 | (x1 & ~x3) | (x1 ^ x2);

 endmodule
