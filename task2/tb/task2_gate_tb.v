// Code your testbench here
// or browse Examples
module task2_gate_tb ();
  reg a;
  reg b;
  reg c;
  wire q;
  
  initial begin
    // Test case 1: a = 0, b = 0, c = 0
    a = 1'b0; b = 1'b0; c = 1'b0;
    #10;
    
    // Test case 2: a = 0, b = 0, c = 1
    a = 1'b0; b = 1'b0; c = 1'b1;
    #10;
    
    // Test case 3: a = 0, b = 1, c = 0
    a = 1'b0; b = 1'b1; c = 1'b0;
    #10;
    
    // Test case 4: a = 0, b = 1, c = 1
    a = 1'b0; b = 1'b1; c = 1'b1;
    #10;
    
    // Test case 5: a = 1, b = 0, c = 0
    a = 1'b1; b = 1'b0; c = 1'b0;
    #10;
    
    // Test case 6: a = 1, b = 0, c = 1
    a = 1'b1; b = 1'b0; c = 1'b1;
    #10;
    
    // Test case 7: a = 1, b = 1, c = 0
    a = 1'b1; b = 1'b1; c = 1'b0;
    #10;
    
    // Test case 8: a = 1, b = 1, c = 1
    a = 1'b1; b = 1'b1; c = 1'b1;
    #10;
    $finish;
  end
  
  task2_gate u_task2_gate (
    .a (a),
    .b (b),
    .c (c),
    .q (q)
  );
  
endmodule
