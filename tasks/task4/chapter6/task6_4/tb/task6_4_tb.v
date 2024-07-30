module testbench;
  reg Clock;
  reg Resetn;
  reg w;
  wire z;

  task6_4 uut (
    .Clock(Clock),
    .Resetn(Resetn),
    .w(w),
    .z(z)
  );
  
  // Clock generation
  always #5 Clock = ~Clock; // 10ns clock period

  // Test sequences
  initial begin
    Clock = 0;
    Resetn = 0;
    w = 0;
    #25;
    Resetn = 1; 
    
    #10; w = 1; 
    #10; w = 0; 
    #10; w = 0; 
    #10; w = 0; 
    #10; w = 1; 
    #10; w = 1; 
    #10; w = 0; 
    #10; w = 1; 
    #10; w = 1; 
    #10; w = 1; 
    #10; w = 1; //z = 1
    #10; w = 1; //z = 1
    #10; w = 1; //z = 1
    #10; w = 0; 
    #10; w = 0; 
    #10; w = 1; //z = 1
    #10; w = 0; 
    #10; w = 0; 
    #10; w = 1; //z = 1
    #10; w = 1; 
    #10; w = 0; 
    #10; w = 0; 
    #10; w = 0; 
    #10; w = 1;
    #10; w = 0; 
    #10; w = 0; 
    #10; w = 1; //z = 1
      
    // Finish the simulation
    #20;
    $finish;
  end

  initial begin
    $monitor("At time %t: Clock = %b, Resetn = %b, w = %b, z = %b", $time, Clock, Resetn, w, z);
  end
endmodule
