
module fmc_control (
    input        clk,           //	时钟
    input        rst,           //	复位
    input        fpga_nl_nadv,  // 地址复用有效信号
    input        fpga_cs_ne1,   // 片选
    input        fpga_wr_nwe,   // 写使能
    input        fpga_rd_noe,   // 读使能
    inout [15:0] fpga_db,       //	双向地址/数据总线

    input [15:0] write_data_0_,   // FPGA  -> STM32 通道0
    input [15:0] write_data_1_,   // FPGA  -> STM32 通道1
    input [15:0] write_data_2_,   // FPGA  -> STM32 通道2
    input [15:0] write_data_3_,   // FPGA  -> STM32 通道3
    input [15:0] write_data_4_,   // FPGA  -> STM32 通道4
    input [15:0] write_data_5_,   // FPGA  -> STM32 通道5
    input [15:0] write_data_6_,   // FPGA  -> STM32 通道6
    input [15:0] write_data_7_,   // FPGA  -> STM32 通道7
    input [15:0] write_data_8_,   // FPGA  -> STM32 通道8
    input [15:0] write_data_9_,   // FPGA  -> STM32 通道9
    input [15:0] write_data_10_,  // FPGA  -> STM32 通道10
    input [15:0] write_data_11_,  // FPGA  -> STM32 通道11
    input [15:0] write_data_12_,  // FPGA  -> STM32 通道12
    input [15:0] write_data_13_,  // FPGA  -> STM32 通道13
    input [15:0] write_data_14_,  // FPGA  -> STM32 通道14
    input [15:0] write_data_15_,  // FPGA  -> STM32 通道15

    output [15:0] read_data_0_,   // STM32 -> FPGA  通道0
    output [15:0] read_data_1_,   // STM32 -> FPGA  通道1
    output [15:0] read_data_2_,   // STM32 -> FPGA  通道2
    output [15:0] read_data_3_,   // STM32 -> FPGA  通道3
    output [15:0] read_data_4_,   // STM32 -> FPGA  通道4
    output [15:0] read_data_5_,   // STM32 -> FPGA  通道5
    output [15:0] read_data_6_,   // STM32 -> FPGA  通道6
    output [15:0] read_data_7_,   // STM32 -> FPGA  通道7
    output [15:0] read_data_8_,   // STM32 -> FPGA  通道8
    output [15:0] read_data_9_,   // STM32 -> FPGA  通道9
    output [15:0] read_data_10_,  // STM32 -> FPGA  通道10
    output [15:0] read_data_11_,  // STM32 -> FPGA  通道11
    output [15:0] read_data_12_,  // STM32 -> FPGA  通道12
    output [15:0] read_data_13_,  // STM32 -> FPGA  通道13
    output [15:0] read_data_14_,  // STM32 -> FPGA  通道14
    output [15:0] read_data_15_,  // STM32 -> FPGA  通道15

    output [15:0] addr,
	 output  fmc_wr_en,
	 output  fmc_rd_en
);

  reg [15:0] read_data_0__reg;  // STM32 -> FPGA  通道0寄存器
  reg [15:0] read_data_1__reg;  // STM32 -> FPGA  通道1寄存器
  reg [15:0] read_data_2__reg;  // STM32 -> FPGA  通道2寄存器
  reg [15:0] read_data_3__reg;  // STM32 -> FPGA  通道3寄存器
  reg [15:0] read_data_4__reg;  // STM32 -> FPGA  通道4寄存器
  reg [15:0] read_data_5__reg;  // STM32 -> FPGA  通道5寄存器
  reg [15:0] read_data_6__reg;  // STM32 -> FPGA  通道6寄存器
  reg [15:0] read_data_7__reg;  // STM32 -> FPGA  通道7寄存器
  reg [15:0] read_data_8__reg;  // STM32 -> FPGA  通道8寄存器
  reg [15:0] read_data_9__reg;  // STM32 -> FPGA  通道9寄存器
  reg [15:0] read_data_10__reg;  // STM32 -> FPGA  通道10寄存器
  reg [15:0] read_data_11__reg;  // STM32 -> FPGA  通道11寄存器
  reg [15:0] read_data_12__reg;  // STM32 -> FPGA  通道12寄存器
  reg [15:0] read_data_13__reg;  // STM32 -> FPGA  通道13寄存器
  reg [15:0] read_data_14__reg;  // STM32 -> FPGA  通道14寄存器
  reg [15:0] read_data_15__reg;  // STM32 -> FPGA  通道15寄存器

  assign read_data_0_  = read_data_0__reg;
  assign read_data_1_  = read_data_1__reg;
  assign read_data_2_  = read_data_2__reg;
  assign read_data_3_  = read_data_3__reg;
  assign read_data_4_  = read_data_4__reg;
  assign read_data_5_  = read_data_5__reg;
  assign read_data_6_  = read_data_6__reg;
  assign read_data_7_  = read_data_7__reg;
  assign read_data_8_  = read_data_8__reg;
  assign read_data_9_  = read_data_9__reg;
  assign read_data_10_ = read_data_10__reg;
  assign read_data_11_ = read_data_11__reg;
  assign read_data_12_ = read_data_12__reg;
  assign read_data_13_ = read_data_13__reg;
  assign read_data_14_ = read_data_14__reg;
  assign read_data_15_ = read_data_15__reg;

  //wire fmc_wr_en;  //写使能
  assign fmc_wr_en = ((!fpga_cs_ne1) & (!fpga_wr_nwe) & fpga_nl_nadv);

  //wire fmc_rd_en;  //读使能
  assign fmc_rd_en = ((!fpga_cs_ne1) & (!fpga_rd_noe) & fpga_nl_nadv);

  reg [15:0] rd_data_reg;  //读取数据缓存器
  //当读使能为高时，fpga_db=fmc_rd_en；为低时，fpga_db为高阻抗；
  assign fpga_db = fmc_rd_en ? rd_data_reg : 16'hzzzz;
  //wire [15:0] addr;  //地址
  assign addr    = ((fpga_nl_nadv == 1'b0) & (fpga_cs_ne1 == 1'b0)) ? fpga_db : addr;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      read_data_0__reg  <= 16'd0;
      read_data_1__reg  <= 16'd0;
      read_data_2__reg  <= 16'd0;
      read_data_3__reg  <= 16'd0;
      read_data_4__reg  <= 16'd0;
      read_data_5__reg  <= 16'd0;
      read_data_6__reg  <= 16'd0;
      read_data_7__reg  <= 16'd0;
      read_data_8__reg  <= 16'd0;
      read_data_9__reg  <= 16'd0;
      read_data_10__reg <= 16'd0;
      read_data_11__reg <= 16'd0;
      read_data_12__reg <= 16'd0;
      read_data_13__reg <= 16'd0;
      read_data_14__reg <= 16'd0;
      read_data_15__reg <= 16'd0;
    end
	else if(fmc_wr_en)	//接收STM32发送的数据
		begin
      case (addr)
        16'h0000: read_data_0__reg <= fpga_db;
        16'h0001: read_data_1__reg <= fpga_db;
        16'h0002: read_data_2__reg <= fpga_db;
        16'h0003: read_data_3__reg <= fpga_db;
        16'h0004: read_data_4__reg <= fpga_db;
        16'h0005: read_data_5__reg <= fpga_db;
        16'h0006: read_data_6__reg <= fpga_db;
        16'h0007: read_data_7__reg <= fpga_db;
        16'h0008: read_data_8__reg <= fpga_db;
        16'h0009: read_data_9__reg <= fpga_db;
        16'h000A: read_data_10__reg <= fpga_db;
        16'h000B: read_data_11__reg <= fpga_db;
        16'h000C: read_data_12__reg <= fpga_db;
        16'h000D: read_data_13__reg <= fpga_db;
        16'h000E: read_data_14__reg <= fpga_db;
        16'h000F: read_data_15__reg <= fpga_db;
        default:  ;
      endcase
    end
	else if(fmc_rd_en)	//向STM32发送数据
		begin
      case (addr)
        16'h0000: rd_data_reg <= write_data_0_;
        16'h0001: rd_data_reg <= write_data_1_;
        16'h0002: rd_data_reg <= write_data_2_;
        16'h0003: rd_data_reg <= write_data_3_;
        16'h0004: rd_data_reg <= write_data_4_;
        16'h0005: rd_data_reg <= write_data_5_;
        16'h0006: rd_data_reg <= write_data_6_;
        16'h0007: rd_data_reg <= write_data_7_;
        16'h0008: rd_data_reg <= write_data_8_;
        16'h0009: rd_data_reg <= write_data_9_;
        16'h000A: rd_data_reg <= write_data_10_;
        16'h000B: rd_data_reg <= write_data_11_;
        16'h000C: rd_data_reg <= write_data_12_;
        16'h000D: rd_data_reg <= write_data_13_;
        16'h000E: rd_data_reg <= write_data_14_;
        16'h000F: rd_data_reg <= write_data_15_;
      endcase
    end
  end

endmodule
