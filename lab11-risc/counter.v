//test passed
module counter#(parameter WIDTH =5)
(
    input wire [WIDTH-1:0]cnt_in,
    input wire clk,
    input wire rst,
    input wire enab,
    input wire load,
    output wire [WIDTH-1:0]cnt_out
);
reg [WIDTH-1:0]cnt_interno;//contador interno
assign cnt_out = cnt_interno;
always @(posedge clk) begin
    if (rst == 1) begin
        cnt_interno <= 0;
    end else if (load == 1) begin
        $display("time=%0d: Loading PC with value %b", $time, cnt_in);
        cnt_interno <= cnt_in;
    end else if (enab == 1) begin
        cnt_interno <= cnt_interno + 1;
    end
end
endmodule