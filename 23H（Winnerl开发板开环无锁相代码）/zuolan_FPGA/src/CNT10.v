module CNT10 (
    input        CLK,
    output [9:0] COUT
);
  reg [9:0] CNT;
  always @(posedge CLK) begin
    CNT <= CNT + 1;
  end
  assign COUT = CNT;
endmodule
