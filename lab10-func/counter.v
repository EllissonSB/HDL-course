module counter
#(
  parameter integer WIDTH=5
 )
 (
  input  wire clk  ,
  input  wire rst  ,
  input  wire load ,
  input  wire enab ,
  input  wire [WIDTH-1:0] cnt_in ,
  output reg  [WIDTH-1:0] cnt_out 
 );

//////////////////////////////////////////////////////////////////////////////
//TO DO: DEFINE THE COUNTER COMBINATIONAL LOGIC using FUNCTION AS INSTRUCTED//
//////////////////////////////////////////////////////////////////////////////
function [WIDTH-1:0] cnt_func;
  input rst;
  input load;
  input enab;
  input [WIDTH-1:0] cnt_in,cnt_out;
  integer cont;
  begin
    if(rst == 1) begin
      cont = 0;
      cnt_func = 0;
    end else begin
      if(enab == 1) begin
        if(load) begin
          cont = cnt_in;
          cnt_func = cont;
        end else begin
          cont = cont + 1;
          cnt_func = cont;
        end
      end else begin
        cnt_func = 0;
      end
    end
  end
endfunction

always @(posedge clk) begin
  cnt_out <= cnt_func(rst, load, enab, cnt_in,cnt_out); // function call
end

endmodule