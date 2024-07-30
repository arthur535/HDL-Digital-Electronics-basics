module dec2to4(
  input [1:0] S,
  input En,
  output reg [0:3] Y
);

  always @(S,En) begin
      if(En) begin
	  case (S)
	      2'b00 : Y = 4'b1000;
	      2'b01 : Y = 4'b0100;
	      2'b10 : Y = 4'b0010;
	      2'b11 : Y = 4'b0001;
	      default : Y = 4'b0000;
          endcase
      end
  end
endmodule
