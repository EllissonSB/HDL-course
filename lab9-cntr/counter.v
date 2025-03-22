module counter#(parameter WIDTH =5)
(
    input wire [WIDTH-1:0]cnt_in,
    input wire clk,
    input wire rst,
    input wire enab,
    input wire load,
    output reg [WIDTH-1:0]cnt_out
);
reg [WIDTH-1:0]cnt_interno;//contador interno
always @(posedge clk or posedge rst) begin
    if (rst ==1) begin
        cnt_interno <= 0; //reseta o contador interno
        cnt_out <= {WIDTH{1'b0}}; //atribui 0 ao contador de saída
    end
    else begin
        if (enab == 1) begin //verifica se o modulo está ativo
            if (load == 1)begin //verifica se o contador deve ser carregado
                cnt_interno <= cnt_in; //carrega o contador interno
                cnt_out <= cnt_in;//valor de saida igual ao carregado
            end
            else begin 
                cnt_interno <= cnt_interno + 1; //incrementa 1 no contadot interno
                cnt_out <= cnt_interno + 1; //atribui o valor do contador interno ao contador de saida
            end
        end
        else begin
            cnt_out <= {WIDTH{1'b0}}; //atribui 0 ao contador de saida
        end
    end
end
endmodule