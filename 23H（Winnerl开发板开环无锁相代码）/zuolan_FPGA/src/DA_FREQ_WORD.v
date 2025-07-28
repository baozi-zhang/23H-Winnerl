module DA_FREQ_WORD #(
    parameter ADDR2 = 16'h0002,
    parameter ADDR3 = 16'h0003,
    parameter ADDR4 = 16'h0004,
    parameter ADDR5 = 16'h0005
) (
    input             CS,
    input             WR_EN,
    input      [15:0] DATA0,
    input      [15:0] DATA1,
    input      [15:0] DATA2,
    input      [15:0] DATA3,
    input      [15:0] ADDR,
    output reg [15:0] DA1_OUTH,
    output reg [15:0] DA1_OUTL,
    output reg [15:0] DA2_OUTH,
    output reg [15:0] DA2_OUTL
);

  always @(*) begin
    if (!CS && WR_EN) begin
      case (ADDR)
        ADDR2: DA1_OUTH <= DATA0;
        ADDR3: DA1_OUTL <= DATA1;
        ADDR4: DA2_OUTH <= DATA2;
        ADDR5: DA2_OUTL <= DATA3;
      endcase
    end
  end

endmodule
