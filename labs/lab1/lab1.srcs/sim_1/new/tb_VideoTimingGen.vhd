-- 文件名: tb_VideoTimingGen.vhd
-- 描述: 用于VideoTimingGen模块的功能仿真测试平台 (已修正时钟生成逻辑)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 引用被测试模块及其所依赖的包
library work;
use work.Constants_pack.all;

entity tb_VideoTimingGen is
end tb_VideoTimingGen;

architecture Behavioral of tb_VideoTimingGen is

    -- 组件声明，即被测试的单元(DUT)
    component VideoTimingGen
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
    end component;

    -- 定义输入和输出信号
    signal s_Clk         : std_logic := '0';
    signal s_Clk_en      : std_logic := '0';
    signal s_Reset_n     : std_logic := '0';
    signal s_Hsync       : std_logic;
    signal s_Vsync       : std_logic;
    signal s_Hcount      : std_logic_vector(10 downto 0);
    signal s_Vcount      : std_logic_vector(10 downto 0);
    signal s_Start_video : std_logic;
    signal s_Video_on    : std_logic;

    -- 时钟周期定义 (25 MHz)
    constant CLK_PERIOD : time := 40 ns; -- 1 / 25 MHz = 40 ns

begin

    -- 实例化被测试单元(DUT)
    UUT: VideoTimingGen
        port map (
            Clk         => s_Clk,
            Clk_en      => s_Clk_en,
            Reset_n     => s_Reset_n,
            Hsync       => s_Hsync,
            Vsync       => s_Vsync,
            Hcount      => s_Hcount,
            Vcount      => s_Vcount,
            Start_video => s_Start_video,
            Video_on    => s_Video_on
        );

    -- 时钟生成进程 (********** 已修正 **********)
    clk_process: process
    begin
        --loop -- <<-- 增加了无限循环
            s_Clk <= '0';
            wait for CLK_PERIOD / 2;
            s_Clk <= '1';
            wait for CLK_PERIOD / 2;
        --end loop; -- <<-- 增加了无限循环
    end process clk_process;

    -- 激励进程，用于控制复位和时钟使能
    stimulus_process: process
    begin
        -- 1. 初始状态，保持复位
        s_Reset_n <= '0';
        s_Clk_en  <= '0';
        wait for 100 ns;

        -- 2. 释放复位，开始运行
        s_Reset_n <= '1';
        wait for CLK_PERIOD;
        
        -- 3. 激活时钟使能，让计数器开始工作
        s_Clk_en  <= '1';

        -- 4. 运行足够长的时间以观察完整的一帧甚至更多
        wait for 20 ms;
        
        -- 5. (可选) 测试时钟使能，暂停计数器
        s_Clk_en <= '0';
        wait for 1 ms;
        s_Clk_en <= '1';

        -- 停止仿真
        wait;
    end process stimulus_process;

end Behavioral;