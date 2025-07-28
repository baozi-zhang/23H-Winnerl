//--------------------------------------------------------------
// 程序描述:
//     FMC实验
// 作    者: 凌智电子
// 开始日期: 2018-08-04
// 完成日期: 2018-08-04
// 修改日期:
// 版    本: V1.0: 
// 调试工具: 
// 说    明:
//     (1)
//--------------------------------------------------------------
module FMC (
    input        CLK,           //	时钟
    input        RST,           //	复位
    input        FPGA_NL_NADV,  //	地址复用有效信号
    input        FPGA_CS_NEL,   //	片选
    input        FPGA_WR_NWE,   //	写使能
    input        FPGA_RD_NOE,   //	读使能	
    inout [15:0] FPGA_DB        //	双向地址/数据总线
);

  wire        FMC_CLK;
  wire [15:0] data_0;  // 数据0
  wire [15:0] data_1;  // 数据1
  wire [15:0] data_2;  // 数据2
  wire [15:0] data_3;  // 数据3
  wire [15:0] data_4;  // 数据4
  wire [15:0] data_5;  // 数据5
  wire [15:0] data_6;  // 数据6
  wire [15:0] data_7;  // 数据7
  wire [15:0] data_8;  // 数据8
  wire [15:0] data_9;  // 数据9
  wire [15:0] data_10;  // 数据10
  wire [15:0] data_11;  // 数据11
  wire [15:0] data_12;  // 数据12
  wire [15:0] data_13;  // 数据13
  wire [15:0] data_14;  // 数据14
  wire [15:0] data_15;  // 数据15

  //时钟PLL
  PLL PLL_CLK (
      .inclk0(CLK),
      .c0    (FMC_CLK)
  );
  //FMC控制
  fmc_control fmc_control1 (
      .clk         (FMC_CLK),       // 系统时钟
      .rst         (RST),           // 复位
      .fpga_nl_nadv(FPGA_NL_NADV),  //	地址复用有效信号		
      .fpga_cs_ne1 (FPGA_CS_NEL),   //	片选		
      .fpga_wr_nwe (FPGA_WR_NWE),   //	写使能		
      .fpga_rd_noe (FPGA_RD_NOE),   //	读使能			
      .fpga_db     (FPGA_DB),       //	双向地址/数据总线

      .write_data_0 (data_0),   // FPGA  -> STM32 通道0
      .write_data_1 (data_1),   // FPGA  -> STM32 通道1
      .write_data_2 (data_2),   // FPGA  -> STM32 通道2
      .write_data_3 (data_3),   // FPGA  -> STM32 通道3
      .write_data_4 (data_4),   // FPGA  -> STM32 通道4
      .write_data_5 (data_5),   // FPGA  -> STM32 通道5
      .write_data_6 (data_6),   // FPGA  -> STM32 通道6
      .write_data_7 (data_7),   // FPGA  -> STM32 通道7
      .write_data_8 (data_8),   // FPGA  -> STM32 通道8
      .write_data_9 (data_9),   // FPGA  -> STM32 通道9
      .write_data_10(data_10),  // FPGA  -> STM32 通道10
      .write_data_11(data_11),  // FPGA  -> STM32 通道11
      .write_data_12(data_12),  // FPGA  -> STM32 通道12
      .write_data_13(data_13),  // FPGA  -> STM32 通道13
      .write_data_14(data_14),  // FPGA  -> STM32 通道14
      .write_data_15(data_15),  // FPGA  -> STM32 通道15

      .read_data_0 (data_0),   // STM32 -> FPGA  通道0
      .read_data_1 (data_1),   // STM32 -> FPGA  通道1
      .read_data_2 (data_2),   // STM32 -> FPGA  通道2
      .read_data_3 (data_3),   // STM32 -> FPGA  通道3
      .read_data_4 (data_4),   // STM32 -> FPGA  通道4
      .read_data_5 (data_5),   // STM32 -> FPGA  通道5
      .read_data_6 (data_6),   // STM32 -> FPGA  通道6
      .read_data_7 (data_7),   // STM32 -> FPGA  通道7
      .read_data_8 (data_8),   // STM32 -> FPGA  通道8
      .read_data_9 (data_9),   // STM32 -> FPGA  通道9
      .read_data_10(data_10),  // STM32 -> FPGA  通道10
      .read_data_11(data_11),  // STM32 -> FPGA  通道11
      .read_data_12(data_12),  // STM32 -> FPGA  通道12
      .read_data_13(data_13),  // STM32 -> FPGA  通道13
      .read_data_14(data_14),  // STM32 -> FPGA  通道14
      .read_data_15(data_15)   // STM32 -> FPGA  通道15
  );

endmodule
