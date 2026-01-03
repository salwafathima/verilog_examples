// Half Adder - Behavioral Level Modeling
module half_adder (
    input a,
    input b,
    output sum,
    output carry
);
    
    always @(*) begin
        sum = a ^ b;      // XOR for sum
        carry = a & b;    // AND for carry
    end
    
endmodule

// Testbench for Half Adder
module tb_half_adder;
    
    reg a, b;
    wire sum, carry;
    
    // Instantiate the half adder
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );
    
    initial begin
        $display("Half Adder Truth Table:");
        $display("A | B | Sum | Carry");
        $display("--|---|-----|------");
        
        // Test case 1: 0 + 0
        a = 0; b = 0;
        #10;
        $display("%b | %b |  %b  |  %b", a, b, sum, carry);
        
        // Test case 2: 0 + 1
        a = 0; b = 1;
        #10;
        $display("%b | %b |  %b  |  %b", a, b, sum, carry);
        
        // Test case 3: 1 + 0
        a = 1; b = 0;
        #10;
        $display("%b | %b |  %b  |  %b", a, b, sum, carry);
        
        // Test case 4: 1 + 1
        a = 1; b = 1;
        #10;
        $display("%b | %b |  %b  |  %b", a, b, sum, carry);
        
        $finish;
    end
    
endmodule