module task4_19 (
  input [2:0] W,
  output reg f
);
  always @(*) begin
    case(W) 
      3'b000: f = 0;
      3'b001: f = 1;
      3'b010: f = 1;
      3'b011: f = 1;
      3'b100: f = 0;
      3'b101: f = 1;
      3'b110: f = 1;
      3'b111: f = 0;
      default: f = 0;
    endcase
  end
endmodule
