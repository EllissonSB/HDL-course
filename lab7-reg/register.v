module register#(parameter WIDTH = 8)(input wire clk, input wire rst, input wire load, input wire [WIDTH-1:0] data_in,output reg [WIDTH-1:0] data_out);
reg [WIDTH-1:0]REG_INT;
always@(posedge clk or posedge rst)begin
    if(rst)begin
        data_out <= 0;
        REG_INT <= 0;
    end
    else begin 
        if(load)
        begin
            REG_INT <= data_in;
            data_out <= data_in;
        end
        else begin
            data_out <= REG_INT;
        end
    end
end
endmodule