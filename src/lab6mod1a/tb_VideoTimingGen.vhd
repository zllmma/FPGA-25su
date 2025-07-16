-- �ļ���: tb_VideoTimingGen.vhd
-- ����: ����VideoTimingGenģ��Ĺ��ܷ������ƽ̨

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- ���ñ�����ģ�鼰���������İ�
LIBRARY work;
USE work.Constants_pack.ALL;

ENTITY tb_VideoTimingGen IS
END tb_VideoTimingGen;

ARCHITECTURE Behavioral OF tb_VideoTimingGen IS

    -- ����������������Եĵ�Ԫ(DUT)
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

    -- �������������ź�
    SIGNAL s_Clk : STD_LOGIC := '0';
    SIGNAL s_Clk_en : STD_LOGIC := '0';
    SIGNAL s_Reset_n : STD_LOGIC := '0';
    SIGNAL s_Hsync : STD_LOGIC;
    SIGNAL s_Vsync : STD_LOGIC;
    SIGNAL s_Hcount : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL s_Vcount : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL s_Start_video : STD_LOGIC;
    SIGNAL s_Video_on : STD_LOGIC;

    -- ʱ�����ڶ��� (25 MHz)
    CONSTANT CLK_PERIOD : TIME := 40 ns; -- 1 / 25 MHz = 40 ns

BEGIN

    -- ʵ���������Ե�Ԫ(DUT)
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

    -- ʱ�����ɽ���
    clk_process : PROCESS
    BEGIN
        s_Clk <= '0';
        WAIT FOR CLK_PERIOD / 2;
        s_Clk <= '1';
        WAIT FOR CLK_PERIOD / 2;
    END PROCESS clk_process;

    -- �������̣����ڿ��Ƹ�λ��ʱ��ʹ��
    stimulus_process : PROCESS
    BEGIN
        -- 1. ��ʼ״̬�����ָ�λ
        s_Reset_n <= '0';
        s_Clk_en <= '0';
        WAIT FOR 100 ns;

        -- 2. �ͷŸ�λ����ʼ����
        s_Reset_n <= '1';
        WAIT FOR CLK_PERIOD;

        -- 3. ����ʱ��ʹ�ܣ��ü�������ʼ����
        s_Clk_en <= '1';

        -- 4. �����㹻����ʱ���Թ۲�������һ֡��������
        WAIT FOR 20 ms;

        -- 5. (��ѡ) ����ʱ��ʹ�ܣ���ͣ������
        s_Clk_en <= '0';
        WAIT FOR 1 ms;
        s_Clk_en <= '1';

        -- ֹͣ����
        WAIT;
    END PROCESS stimulus_process;

END Behavioral;