module modulo12 (
	input clock,
	input resetn, //synchronous reset
	output reg[3:0] q // counting up to 12 requires 4 registers
);

	always @(posedge clock) begin
		if(!resetn) begin
			q <= 4'b0000;
		end else if (q < 11) begin
			q = q + 1;
		end else begin 
			q <= 4'b0000;
		end
	end
endmodule
