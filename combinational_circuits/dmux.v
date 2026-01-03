// 4x1 DMUX (Demultiplexer)
module dmux_4x1 (
    input din,
    input [1:0] sel,
    output reg out0,
    output reg out1,
    output reg out2,
    output reg out3
);

    always @(*) begin
        // Default: all outputs low
        out0 = 1'b0;
        out1 = 1'b0;
        out2 = 1'b0;
        out3 = 1'b0;
        
        // Route input to selected output
        case (sel)
            2'b00: out0 = din;
            2'b01: out1 = din;
            2'b10: out2 = din;
            2'b11: out3 = din;
            default: begin
                out0 = 1'b0;
                out1 = 1'b0;
                out2 = 1'b0;
                out3 = 1'b0;
            end
        endcase
    end

endmodule

// Testbench for 4x1 DMUX
module tb_dmux_4x1;
    reg din;
    reg [1:0] sel;
    wire out0, out1, out2, out3;
    
    dmux_4x1 uut (
        .din(din),
        .sel(sel),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );
    
    initial begin
        $display("4x1 DMUX Testbench");
        $display("Time\tdin\tsel\tout0\tout1\tout2\tout3");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", 
                 $time, din, sel, out0, out1, out2, out3);
        
        // Test cases
        din = 1'b1;
        
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        
        din = 1'b0;
        sel = 2'b00; #10;
        
        $finish;
    end

endmodule