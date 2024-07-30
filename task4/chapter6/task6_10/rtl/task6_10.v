module task6_10(
  input clk,
  input rst,
  input w1,
  input w2,
  output reg z
);

  wire w;
  reg [3:0] shift_reg;

  assign w = w1 ^ w2; // Xor 2 inputs to get one input

  always @(posedge clk or negedge rst) begin
      if(!rst) begin
        shift_reg <= 4'b1111; // Initialize shift register at reset
        z <= 0;
      end else begin
        shift_reg <= {shift_reg[2:0], w}; // Shift left and add new w value to right
        z <= ~(|shift_reg); // Output z is 1 if all bits in shift_reg are 0
      end
  end
endmodule
