module task4_19 (w1,w2,w3,f);
  input w1,w2,w3;
  output reg f;

  always @(*) begin
    case(w1) 
      0: f = w2 | w3;
      1: f = w2 ^ w3; 
      default: f = 0;
    endcase
  end
endmodule
