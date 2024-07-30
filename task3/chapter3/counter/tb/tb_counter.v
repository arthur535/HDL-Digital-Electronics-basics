module tb_counter();
  reg[2:0] inputs;
  wire o0;
  wire o1;
  integer i;

  initial begin
    for(i = 0; i < 8; i = i + 1) begin
      inputs = i;
      #10;
    end
  end

  counter u_counter (
    .i0 (inputs[0]),
    .i1 (inputs[1]),
    .i2 (inputs[2]),
    .o0 (o0),
    .o1 (o1) 
  );

endmodule


