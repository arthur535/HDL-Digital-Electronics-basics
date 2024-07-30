module T_FF_tb();
    reg clk;
    reg clr;
    reg T;
    wire Q;

    T_FF u_tff (
        .clk(clk),
        .clr(clr),
        .T(T),
        .Q(Q)
    );

    // Generate clock signal
    always #5 clk = ~clk;  // Clock period of 10 units

    initial begin
        // Initialize signals
        clk = 0;
        clr = 0;
        T = 0;

        // Apply test stimulus
        #10 clr = 1;  // Clear the flip-flop
        #10 clr = 0;
        #10 T = 1;    // Toggle the flip-flop
        #20 T = 0;
        #10 T = 1;
        #10 T = 0;
        #10 T = 1;
        #10 clr = 1;  // Clear the flip-flop again
        #10 clr = 0;
        #20 $finish;  
    end

    initial begin
        $monitor("At time %t, clr = %b, T = %b, Q = %b", $time, clr, T, Q);
    end
endmodule

