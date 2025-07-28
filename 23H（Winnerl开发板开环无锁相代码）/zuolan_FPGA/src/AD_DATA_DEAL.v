module AD_DATA_DEAL #(
    parameter ADDR6 = 16'h0006,
    parameter ADDR7 = 16'h0007,
    parameter ADDR8 = 16'h0008,
    parameter ADDR9 = 16'h0009
) (
    input             CS,
    input             RD_EN,
    input             AD1_FLAG,
    input             AD2_FLAG,
    input      [11:0] AD1_FIFO_DATA_IN,
    input      [11:0] AD2_FIFO_DATA_IN,
    input      [15:0] ADDR,
    output reg [15:0] AD1_FLAG_SHOW,
    output reg [15:0] AD2_FLAG_SHOW,
    output reg [15:0] AD1_FIFO_DATA_OUT,
    output reg [15:0] AD2_FIFO_DATA_OUT
);
  integer i;
  reg [11:0] ad1_fifo_recv, ad2_fifo_recv;
  always @(*) begin
    if (!CS && RD_EN) begin
      case (ADDR)
        ADDR6: begin
          for (i = 0; i < 12; i = i + 1) begin
            ad1_fifo_recv[i] = AD1_FIFO_DATA_IN[11-i];
          end
          AD1_FIFO_DATA_OUT = {4'b0000, ad1_fifo_recv};
        end
        ADDR7: AD1_FLAG_SHOW = (AD1_FLAG) ? 16'h0001 : 16'h0000;
        ADDR8: begin
          for (i = 0; i < 12; i = i + 1) begin
            ad2_fifo_recv[i] = AD2_FIFO_DATA_IN[11-i];
          end
          AD2_FIFO_DATA_OUT = {4'b0000, ad2_fifo_recv};
        end
        ADDR9: AD2_FLAG_SHOW = (AD2_FLAG) ? 16'h0001 : 16'h0000;
      endcase
    end
  end

endmodule
