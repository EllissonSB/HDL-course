//test passed
module driver#(
  parameter WIDTH=8
  ) 
  (
    output wire [WIDTH-1:0] data_out,
    input wire [WIDTH-1:0] data_in,
    input wire data_en
    );
    assign data_out = (data_en == 1) ? data_in : {WIDTH{1'bZ}};
endmodule
