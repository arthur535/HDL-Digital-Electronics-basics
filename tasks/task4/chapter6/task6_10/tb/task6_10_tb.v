module testbench();
  reg clk;             
  reg rst;             
  reg w1;              
  reg w2;              
  wire z;              
  
  task6_10 uut (
    .clk(clk),
    .rst(rst),
    .w1(w1),
    .w2(w2),
    .z(z)
  );
    
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 0;
    w1  = 0;
    w2  = 0;
    
    #25;
    rst = 1;
    // Apply the sequence W = w1 ^ w2 = 1000010000001
    #10; w1 = 0; w2 = 1;
    #10; w1 = 1; w2 = 1;
    #10; w1 = 1; w2 = 1;
    #10; w1 = 0; w2 = 0;
    #10; w1 = 1; w2 = 1;
    #10; w1 = 1; w2 = 0;
    #10; w1 = 1; w2 = 1;
    #10; w1 = 0; w2 = 0;
    #10; w1 = 0; w2 = 0;
    #10; w1 = 0; w2 = 0;
    #10; w1 = 1; w2 = 1;
    #10; w1 = 1; w2 = 1;
    #10; w1 = 0; w2 = 1;

    
    #25;
    $finish;
  end

    // Monitor the outputs
  initial begin
    $monitor("Time = %0t, w1 = %b, w2 = %b, W = %b, Shift Reg = %b, z = %b",$time, w1, w2, uut.w, uut.shift_reg, z);
  end
endmodule
