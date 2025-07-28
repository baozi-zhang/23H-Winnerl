module MASTER_CTRL #(
    parameter ADDR1 = 16'h0001
) (
    input             CS,
    input             WR_EN,
    input      [15:0] ADDR,
    input      [15:0] DATA,
    output reg [15:0] CTRL_DATA
);
  always @(CS or WR_EN or ADDR) begin
    if (!CS && WR_EN && (ADDR == ADDR1)) begin
      CTRL_DATA <= DATA;
    end
  end

endmodule
