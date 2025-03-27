//test passed
module register#(
    parameter WIDTH = 8
    )
    (
    input wire clk, 
    input wire rst, 
    input wire load, 
    input wire [WIDTH-1:0] data_in,
    output wire [WIDTH-1:0] data_out
    );
reg [WIDTH-1:0]REG_INT;
assign data_out = REG_INT;
always@(posedge clk)begin
    if(rst)begin
        REG_INT <= 0;
    end
    else begin 
        if(load)
        begin
            REG_INT <= data_in;
        end
    end
end
endmodule