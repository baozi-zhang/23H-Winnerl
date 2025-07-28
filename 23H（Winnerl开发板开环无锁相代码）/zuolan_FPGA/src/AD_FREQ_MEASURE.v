module AD_FREQ_MEASURE #(
    parameter ADDR2 = 16'h0002,
    parameter ADDR3 = 16'h0003,
    parameter ADDR4 = 16'h0004,
    parameter ADDR5 = 16'h0005,

    parameter ADDR10 = 16'h000A,
    parameter ADDR11 = 16'h000B,
    parameter ADDR12 = 16'h000C,
    parameter ADDR13 = 16'h000D
) (
    input             CS,
    input             RD,
    input      [31:0] AD1_FREQ_DATA,
    input      [31:0] AD2_FREQ_DATA,
    input      [31:0] BASE1_FREQ_DATA,
    input      [31:0] BASE2_FREQ_DATA,
    input      [15:0] ADDR,
    output reg [15:0] AD1_FREQ_DATA_H,
    output reg [15:0] AD1_FREQ_DATA_L,
    output reg [15:0] AD2_FREQ_DATA_H,
    output reg [15:0] AD2_FREQ_DATA_L,
    output reg [15:0] BASE1_FREQ_DATA_H,
    output reg [15:0] BASE1_FREQ_DATA_L,
    output reg [15:0] BASE2_FREQ_DATA_H,
    output reg [15:0] BASE2_FREQ_DATA_L
);
  always @(*) begin
    if (!CS && RD) begin
      case (ADDR)
        ADDR2:  BASE1_FREQ_DATA_H = BASE1_FREQ_DATA[31:16];
        ADDR3:  BASE1_FREQ_DATA_L = BASE1_FREQ_DATA[15:0];
        ADDR4:  BASE2_FREQ_DATA_H = BASE2_FREQ_DATA[31:16];
        ADDR5:  BASE2_FREQ_DATA_L = BASE2_FREQ_DATA[15:0];
        ADDR10: AD1_FREQ_DATA_H = AD1_FREQ_DATA[31:16];
        ADDR11: AD1_FREQ_DATA_L = AD1_FREQ_DATA[15:0];
        ADDR12: AD2_FREQ_DATA_H = AD2_FREQ_DATA[31:16];
        ADDR13: AD2_FREQ_DATA_L = AD2_FREQ_DATA[15:0];
      endcase
    end
  end
endmodule
