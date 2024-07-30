module T_FF (
    input wire clk,  // Clock input
    input wire clr,  // Asynchronous clear input
    input wire T,    // T input
    output reg Q     // Output
);

    always @(posedge clk or posedge clr) begin
        if (clr) begin
            Q <= 1'b0;  // Clear the output
        end else if (T) begin
            Q <= ~Q;  // Toggle the output
        end
    end

endmodule
