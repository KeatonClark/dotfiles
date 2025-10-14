module shift_register (
    input wire clk,
    input wire reset,
    input wire serial_in,
    output reg [7:0] data
);
    always @(posedge clk) begin
        if (reset) begin
            data <= 8'b00000000;
        end else begin
            data <= {serial_in, data[7:1]};
        end
    end
endmodule
