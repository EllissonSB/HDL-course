//test passed
module memory #(
    parameter AWIDTH = 5,   // Largura do endereço (5 bits = 32 endereços)
    parameter DWIDTH = 8    // Largura do dado (8 bits)
)(
    input wire clk,                   // Clock
    input wire wr,                    // Sinal de escrita
    input wire rd,                    // Sinal de leitura
    input wire [AWIDTH-1:0] addr,      // Endereço
    inout wire [DWIDTH-1:0] data       // Porta bidirecional de dados
);

    // A matriz de memória
    reg [DWIDTH-1:0] array [2**AWIDTH-1:0];

    // Registrador para saída
    reg [DWIDTH-1:0] data_out;

    // Tri-state buffer: quando `rd = 1`, a memória coloca os dados no barramento
    assign data = (rd) ? data_out : {DWIDTH{1'bz}};

    always @(posedge clk) begin
        if (wr) begin
            array[addr] <= data;  // Escreve na memória
        end
        else if (rd) begin
            data_out <= array[addr];  // Lê da memória
        end
    end
endmodule
