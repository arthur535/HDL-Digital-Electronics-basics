module task6_4(
  input Clock,
  input Resetn,
  input w,
  output reg z
);
  
  typedef enum reg [3:0] {
    A = 4'b0000,
    B = 4'b0001,
    C = 4'b0010,
    D = 4'b0100,
    E = 4'b1001,
    F = 4'b0011,
    G = 4'b0111,
    H = 4'b1111
  } state_t;

    state_t y, Y; // y is current state, Y is next state

  always @(*) begin
    case (y)
      A: Y = w ? B : A;
      B: Y = w ? F : C;
      C: Y = w ? B : D;
      D: Y = w ? E : A;
      E: Y = w ? F : C;
      F: Y = w ? G : C;
      G: Y = w ? H : C;
      H: Y = w ? H : C;
      default: Y = A;
    endcase
  end

  always @(negedge Resetn or posedge Clock) begin
    if (!Resetn)
      y <= A;
    else
      y <= Y;
  end

  always @(*) begin
    case (y)
      E, H: z = 1;
      default: z = 0;
    endcase
  end
endmodule
