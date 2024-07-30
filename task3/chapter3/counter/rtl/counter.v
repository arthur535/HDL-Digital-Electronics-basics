module counter(i0, i1, i2, o0, o1);
  input i0;
  input i1;
  input i2;
  output o0;
  output o1;

  //maximum count of 1 value bits in three-bit number can be 3, i will use 2 bits to represent 0,1,2,3 decimal values in binary

  assign o0 = ((~i0) & i1 & i2) | (i0 & (i1 | i2)); // first bit 
  assign o1 = i0 ^ i1 ^ i2; // second bit 

endmodule


