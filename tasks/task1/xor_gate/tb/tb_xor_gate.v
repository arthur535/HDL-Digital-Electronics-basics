module tb_xor_gate();
  reg [3:0] inputs;
  integer i;
  wire q;

  xor_gate u_xor_gate(
    .a(inputs[0]),
    .b(inputs[1]),
    .c(inputs[2]),
    .d(inputs[3]),
    .q(qq)
  );

  initial begin
     for (i = 0; i < 16; i = i + 1) begin
      inputs = i; // Assign the value to inputs
      #10; // Wait for 10 time units
    end
    $finish;
  end

endmodule
