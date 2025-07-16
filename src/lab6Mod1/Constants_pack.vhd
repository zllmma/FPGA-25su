-- 文件名: Constants_pack.vhd
-- 描述: 包含VGA 640x480 @ 60Hz模式的时序常量 [cite: 17, 19]

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Constants_pack is
    -- 水平时序常量 (单位: 像素时钟周期)
    constant H_total  : integer := 800;    -- 一整行扫描的总周期数 [cite: 24]
    constant H_active : integer := 640;    -- 水平有效显示区域 [cite: 25]
    constant H_fp     : integer := 16;     -- 水平前沿 (front porch) [cite: 25]
    constant H_sync   : integer := 96;     -- 水平同步脉冲宽度 [cite: 26]
    constant H_bp     : integer := 48;     -- 水平后沿 (back porch) [cite: 26]

    -- 垂直时序常量 (单位: 行)
    constant V_total  : integer := 520;    -- 一整帧的总行数 [cite: 27]
    constant V_active : integer := 480;    -- 垂直有效显示行数 [cite: 27]
    constant V_fp     : integer := 9;      -- 垂直前沿 (front porch) [cite: 28]
    constant V_sync   : integer := 2;      -- 垂直同步脉冲宽度 [cite: 28]
    constant V_bp     : integer := 29;     -- 垂直后沿 (back porch) [cite: 29]
end Constants_pack;

package body Constants_pack is
end Constants_pack;