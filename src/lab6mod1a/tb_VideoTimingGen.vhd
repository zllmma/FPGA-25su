-- 文件名: tb_VideoTimingGen.vhd
-- 描述: 用于VideoTimingGen模块的功能仿真测试平台

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- 引用被测试模块及其所依赖的包
LIBRARY work;
USE work.Constants_pack.ALL;

ENTITY tb_VideoTimingGen IS
END tb_VideoTimingGen;

ARCHITECTURE Behavioral OF tb_VideoTimingGen IS

    -- 组件声明，即被测试的单元(DUT)
    COMPONENT VideoTimingGen
        PORT (
            Clk : IN STD_LOGIC;
            Clk_en : IN STD_LOGIC;
            Reset_n : IN STD_LOGIC;
            Hsync : OUT STD_LOGIC;
            Vsync : OUT STD_LOGIC;
            Hcount : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
            Vcount : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
            Start_video : OUT STD_LOGIC;
            Video_on : OUT STD_LOGIC
        );
    END COMPONENT;

    -- 定义输入和输出信号
    SIGNAL s_Clk : STD_LOGIC := '0';
    SIGNAL s_Clk_en : STD_LOGIC := '0';
    SIGNAL s_Reset_n : STD_LOGIC := '0';
    SIGNAL s_Hsync : STD_LOGIC;
    SIGNAL s_Vsync : STD_LOGIC;
    SIGNAL s_Hcount : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL s_Vcount : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL s_Start_video : STD_LOGIC;
    SIGNAL s_Video_on : STD_LOGIC;

    -- 时钟周期定义 (25 MHz)
    CONSTANT CLK_PERIOD : TIME := 40 ns; -- 1 / 25 MHz = 40 ns

BEGIN

    -- 实例化被测试单元(DUT)
    UUT : VideoTimingGen
    PORT MAP(
        Clk => s_Clk,
        Clk_en => s_Clk_en,
        Reset_n => s_Reset_n,
        Hsync => s_Hsync,
        Vsync => s_Vsync,
        Hcount => s_Hcount,
        Vcount => s_Vcount,
        Start_video => s_Start_video,
        Video_on => s_Video_on
    );

    -- 时钟生成进程
    clk_process : PROCESS
    BEGIN
        s_Clk <= '0';
        WAIT FOR CLK_PERIOD / 2;
        s_Clk <= '1';
        WAIT FOR CLK_PERIOD / 2;
    END PROCESS clk_process;

    -- 激励进程，用于控制复位和时钟使能
    stimulus_process : PROCESS
    BEGIN
        -- 1. 初始状态，保持复位
        s_Reset_n <= '0';
        s_Clk_en <= '0';
        WAIT FOR 100 ns;

        -- 2. 释放复位，开始运行
        s_Reset_n <= '1';
        WAIT FOR CLK_PERIOD;

        -- 3. 激活时钟使能，让计数器开始工作
        s_Clk_en <= '1';

        -- 4. 运行足够长的时间以观察完整的一帧甚至更多
        WAIT FOR 20 ms;

        -- 5. (可选) 测试时钟使能，暂停计数器
        s_Clk_en <= '0';
        WAIT FOR 1 ms;
        s_Clk_en <= '1';

        -- 停止仿真
        WAIT;
    END PROCESS stimulus_process;

END Behavioral;