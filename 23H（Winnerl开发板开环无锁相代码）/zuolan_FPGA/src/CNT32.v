module CNT32 (
    input         CLR,
    input         CLK,
    input         CLKBASE,
    input         CLKEN,
    input         CLKBASEEN,
    output [31:0] Q,
    output [31:0] QBASE
);
  reg [31:0] Q1, Q1BASE;
  always @(posedge CLK or negedge CLR) begin
    if (!CLR) begin
      Q1 <= 32'b0;
    end else if (CLKEN) begin
      Q1 <= Q1 + 1;
    end
  end
  assign Q = Q1;
  always @(posedge CLKBASE or negedge CLR) begin
    if (!CLR) begin
      Q1BASE <= 32'b0;
    end else if (CLKBASEEN) begin
      Q1BASE <= Q1BASE + 1;
    end
  end
  assign QBASE = Q1BASE;
endmodule
