-- (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:div_gen:5.1
-- IP Revision: 14

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY div_gen_v5_1_14;
USE div_gen_v5_1_14.div_gen_v5_1_14;

ENTITY div_gen_0 IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_divisor_tvalid : IN STD_LOGIC;
    s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axis_dividend_tvalid : IN STD_LOGIC;
    s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
  );
END div_gen_0;

ARCHITECTURE div_gen_0_arch OF div_gen_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF div_gen_0_arch: ARCHITECTURE IS "yes";
  COMPONENT div_gen_v5_1_14 IS
    GENERIC (
      C_XDEVICEFAMILY : STRING;
      C_HAS_ARESETN : INTEGER;
      C_HAS_ACLKEN : INTEGER;
      C_LATENCY : INTEGER;
      ALGORITHM_TYPE : INTEGER;
      DIVISOR_WIDTH : INTEGER;
      DIVIDEND_WIDTH : INTEGER;
      SIGNED_B : INTEGER;
      DIVCLK_SEL : INTEGER;
      FRACTIONAL_B : INTEGER;
      FRACTIONAL_WIDTH : INTEGER;
      C_HAS_DIV_BY_ZERO : INTEGER;
      C_THROTTLE_SCHEME : INTEGER;
      C_TLAST_RESOLUTION : INTEGER;
      C_HAS_S_AXIS_DIVISOR_TUSER : INTEGER;
      C_HAS_S_AXIS_DIVISOR_TLAST : INTEGER;
      C_S_AXIS_DIVISOR_TDATA_WIDTH : INTEGER;
      C_S_AXIS_DIVISOR_TUSER_WIDTH : INTEGER;
      C_HAS_S_AXIS_DIVIDEND_TUSER : INTEGER;
      C_HAS_S_AXIS_DIVIDEND_TLAST : INTEGER;
      C_S_AXIS_DIVIDEND_TDATA_WIDTH : INTEGER;
      C_S_AXIS_DIVIDEND_TUSER_WIDTH : INTEGER;
      C_M_AXIS_DOUT_TDATA_WIDTH : INTEGER;
      C_M_AXIS_DOUT_TUSER_WIDTH : INTEGER
    );
    PORT (
      aclk : IN STD_LOGIC;
      aclken : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      s_axis_divisor_tvalid : IN STD_LOGIC;
      s_axis_divisor_tready : OUT STD_LOGIC;
      s_axis_divisor_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axis_divisor_tlast : IN STD_LOGIC;
      s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axis_dividend_tvalid : IN STD_LOGIC;
      s_axis_dividend_tready : OUT STD_LOGIC;
      s_axis_dividend_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axis_dividend_tlast : IN STD_LOGIC;
      s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      m_axis_dout_tvalid : OUT STD_LOGIC;
      m_axis_dout_tready : IN STD_LOGIC;
      m_axis_dout_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axis_dout_tlast : OUT STD_LOGIC;
      m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
    );
  END COMPONENT div_gen_v5_1_14;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF div_gen_0_arch: ARCHITECTURE IS "div_gen_v5_1_14,Vivado 2018.3";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF div_gen_0_arch : ARCHITECTURE IS "div_gen_0,div_gen_v5_1_14,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF div_gen_0_arch: ARCHITECTURE IS "div_gen_0,div_gen_v5_1_14,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=div_gen,x_ipVersion=5.1,x_ipCoreRevision=14,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_XDEVICEFAMILY=zynq,C_HAS_ARESETN=0,C_HAS_ACLKEN=0,C_LATENCY=18,ALGORITHM_TYPE=1,DIVISOR_WIDTH=8,DIVIDEND_WIDTH=16,SIGNED_B=0,DIVCLK_SEL=1,FRACTIONAL_B=0,FRACTIONAL_WIDTH=8,C_HAS_DIV_BY_ZERO=0,C_THROTTLE_SCHEME=3,C_TLAST_RESOLUTION=0,C_HAS_S_AXIS_DIVISOR_TUSER=0,C_HAS_S_AXIS_DIVISOR_TLAST=0,C_S_AXIS_DIVISOR_TDAT" & 
"A_WIDTH=8,C_S_AXIS_DIVISOR_TUSER_WIDTH=1,C_HAS_S_AXIS_DIVIDEND_TUSER=0,C_HAS_S_AXIS_DIVIDEND_TLAST=0,C_S_AXIS_DIVIDEND_TDATA_WIDTH=16,C_S_AXIS_DIVIDEND_TUSER_WIDTH=1,C_M_AXIS_DOUT_TDATA_WIDTH=24,C_M_AXIS_DOUT_TUSER_WIDTH=1}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_dout_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_DOUT TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axis_dout_tvalid: SIGNAL IS "XIL_INTERFACENAME M_AXIS_DOUT, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_dout_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_DOUT TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_dividend_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_DIVIDEND TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axis_dividend_tvalid: SIGNAL IS "XIL_INTERFACENAME S_AXIS_DIVIDEND, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_dividend_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_DIVIDEND TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_divisor_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_DIVISOR TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axis_divisor_tvalid: SIGNAL IS "XIL_INTERFACENAME S_AXIS_DIVISOR, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_divisor_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_DIVISOR TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aclk: SIGNAL IS "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF S_AXIS_DIVIDEND:S_AXIS_DIVISOR:M_AXIS_DOUT, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 1000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 aclk_intf CLK";
BEGIN
  U0 : div_gen_v5_1_14
    GENERIC MAP (
      C_XDEVICEFAMILY => "zynq",
      C_HAS_ARESETN => 0,
      C_HAS_ACLKEN => 0,
      C_LATENCY => 18,
      ALGORITHM_TYPE => 1,
      DIVISOR_WIDTH => 8,
      DIVIDEND_WIDTH => 16,
      SIGNED_B => 0,
      DIVCLK_SEL => 1,
      FRACTIONAL_B => 0,
      FRACTIONAL_WIDTH => 8,
      C_HAS_DIV_BY_ZERO => 0,
      C_THROTTLE_SCHEME => 3,
      C_TLAST_RESOLUTION => 0,
      C_HAS_S_AXIS_DIVISOR_TUSER => 0,
      C_HAS_S_AXIS_DIVISOR_TLAST => 0,
      C_S_AXIS_DIVISOR_TDATA_WIDTH => 8,
      C_S_AXIS_DIVISOR_TUSER_WIDTH => 1,
      C_HAS_S_AXIS_DIVIDEND_TUSER => 0,
      C_HAS_S_AXIS_DIVIDEND_TLAST => 0,
      C_S_AXIS_DIVIDEND_TDATA_WIDTH => 16,
      C_S_AXIS_DIVIDEND_TUSER_WIDTH => 1,
      C_M_AXIS_DOUT_TDATA_WIDTH => 24,
      C_M_AXIS_DOUT_TUSER_WIDTH => 1
    )
    PORT MAP (
      aclk => aclk,
      aclken => '1',
      aresetn => '1',
      s_axis_divisor_tvalid => s_axis_divisor_tvalid,
      s_axis_divisor_tuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_divisor_tlast => '0',
      s_axis_divisor_tdata => s_axis_divisor_tdata,
      s_axis_dividend_tvalid => s_axis_dividend_tvalid,
      s_axis_dividend_tuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_dividend_tlast => '0',
      s_axis_dividend_tdata => s_axis_dividend_tdata,
      m_axis_dout_tvalid => m_axis_dout_tvalid,
      m_axis_dout_tready => '0',
      m_axis_dout_tdata => m_axis_dout_tdata
    );
END div_gen_0_arch;
