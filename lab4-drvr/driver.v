module driver#(parameter WIDTH=8) (output reg [WIDTH-1:0] data_out,input wire [WIDTH-1:0] data_in,input wire data_en);
  always @(*) begin // Combinational logic se qualquer uma das entradas variar aciona.
    if (data_en) begin // se data_en for 1 a saída é igual a entrada.
      data_out = data_in;
    end
    else begin // se data_en for 0 a saída é igual a Z.
      data_out = {WIDTH{1'bZ}}; //macete para alta impedancia usando parameter e concatenacao.
    end
  end
endmodule
