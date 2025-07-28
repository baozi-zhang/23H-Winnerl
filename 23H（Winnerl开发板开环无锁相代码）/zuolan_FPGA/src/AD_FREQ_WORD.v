module AD_FREQ_WORD #(
    parameter ADDR6 = 16'h0006,
    parameter ADDR7 = 16'h0007,
    parameter ADDR8 = 16'h0008,
    parameter ADDR9 = 16'h0009
) (
    input             CS,
    input             WR_EN,
    input      [15:0] DATA0,
    input      [15:0] DATA1,
    input      [15:0] DATA2,
    input      [15:0] DATA3,
    input      [15:0] ADDR,
    output reg [15:0] AD1_OUTH,
    output reg [15:0] AD1_OUTL,
    output reg [15:0] AD2_OUTH,
    output reg [15:0] AD2_OUTL
);

  always @(*) begin
    if (!CS && WR_EN) begin
      case (ADDR)
        ADDR6: AD1_OUTH <= DATA0;
        ADDR7: AD1_OUTL <= DATA1;
        ADDR8: AD2_OUTH <= DATA2;
        ADDR9: AD2_OUTL <= DATA3;
      endcase
    end
  end
endmodule
