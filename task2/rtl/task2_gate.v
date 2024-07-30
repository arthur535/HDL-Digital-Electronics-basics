// Code your design here
module task2_gate (
  a,
  b,
  c,
  q
);
  input a;
  input b;
  input c;
  output q;
  
  assign q = ~c&(a^b) | c&(~a | b);
  
endmodule
