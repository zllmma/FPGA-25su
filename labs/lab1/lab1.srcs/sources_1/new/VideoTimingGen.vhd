-- 文件名: VideoTimingGen.vhd
-- 描述: 根据Lab6Mod1a.doc文档要求生成的视频时序控制器

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- 用于unsigned类型和算术运算 [cite: 44]

-- 引用包含所有时序常量的库和包 [cite: 41]
library work;
use work.Constants_pack.all;

entity VideoTimingGen is
    Port (
        Clk         : in  std_logic;
        Clk_en      : in  std_logic;
        Reset_n     : in  std_logic;
        Hsync       : out std_logic;
        Vsync       : out std_logic;
        Hcount      : out std_logic_vector(10 downto 0);
        Vcount      : out std_logic_vector(10 downto 0);
        Start_video : out std_logic;
        Video_on    : out std_logic
    );
end VideoTimingGen; 

architecture Behavioral of VideoTimingGen is

    -- 内部计数器信号, 使用unsigned类型便于算术运算 [cite: 43]
    -- 使用11位是为了未来平滑过渡到SVGA [cite: 38]
    signal hcount_sig : unsigned(10 downto 0);
    signal vcount_sig : unsigned(10 downto 0);
    
    -- 中间信号，用于逻辑判断
    signal h_active_period : std_logic;
    signal v_active_period : std_logic;

begin

    -- 进程1: 时钟驱动的同步进程，只用于生成寄存器化的计数器 [cite: 50]
    sync_process: process(Clk)
    begin
        if rising_edge(Clk) then
            -- 实现同步、低电平有效的复位 [cite: 37, 49]
            if Reset_n = '0' then
                hcount_sig <= (others => '0');
                vcount_sig <= (others => '0');
            -- 只有当时钟使能有效时，计数器才工作 [cite: 37]
            elsif Clk_en = '1' then
                -- 水平计数器逻辑
                if hcount_sig = H_total - 1 then
                    hcount_sig <= (others => '0');
                    -- 垂直计数器在每行结束时递增
                    if vcount_sig = V_total - 1 then
                        vcount_sig <= (others => '0');
                    else
                        vcount_sig <= vcount_sig + 1;
                    end if;
                else
                    hcount_sig <= hcount_sig + 1;
                end if;
            end if;
        end if;
    end process sync_process;

    -- 进程2的替代方案: 使用并发信号赋值实现所有输出的组合逻辑 [cite: 50]
    -- 这种方式代码更简洁，且明确表示了输出是计数器的直接函数

    -- 水平同步脉冲生成 [cite: 37]
    Hsync <= '1' when hcount_sig < H_sync else '0';

    -- 垂直同步脉冲生成 [cite: 37]
    Vsync <= '1' when vcount_sig < V_sync else '0';

    -- 判断当前是否在水平有效显示区域
    h_active_period <= '1' when (hcount_sig >= (H_sync + H_bp)) and (hcount_sig < (H_sync + H_bp + H_active)) else '0';
    
    -- 判断当前是否在垂直有效显示区域
    v_active_period <= '1' when (vcount_sig >= (V_sync + V_bp)) and (vcount_sig < (V_sync + V_bp + V_active)) else '0';

    -- Video_on信号在水平和垂直都有效时才有效 [cite: 11, 37]
    Video_on <= h_active_period and v_active_period;

    -- Start_video在一帧画面的第一个有效像素点产生一个时钟周期的脉冲 [cite: 37]
    Start_video <= '1' when (hcount_sig = H_sync + H_bp) and (vcount_sig = V_sync + V_bp) else '0';
    
    -- 将内部计数器的值输出到端口, 需要进行类型转换 [cite: 48]
    Hcount <= std_logic_vector(hcount_sig);
    Vcount <= std_logic_vector(vcount_sig);

end Behavioral;