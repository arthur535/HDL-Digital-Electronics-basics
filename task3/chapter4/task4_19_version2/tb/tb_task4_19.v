module testbench();
  reg[2:0] inputs;
  wire f;
  integer i;
  
  initial begin
    for(i = 0; i < 8; i = i + 1) begin
      inputs = i;
      #10;
    end
  end
  task4_19 u_task4_19 (
    .w3 (inputs[0]),
    .w2 (inputs[1]),
    .w1 (inputs[2]),
    .f (f) 
  );
endmodule
