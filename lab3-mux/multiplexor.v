module multiplexor #(parameter WIDTH = 5) (input wire [WIDTH-1:0] in0,input wire [WIDTH-1:0] in1,input wire sel,output reg [WIDTH-1:0] mux_out);
  always @(*) begin //Qualquer mudança nos sinais de entrada ativa o always
    if (sel) begin // se sel for 1 a saída é in1
      mux_out = in1;
    end
    else begin //se sel for 0 a saída é in0
      mux_out = in0;
    end
  end
  endmodule