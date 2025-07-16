-- �ļ���: tb_VideoTimingGen.vhd
-- ����: ����VideoTimingGenģ��Ĺ��ܷ������ƽ̨ (������ʱ�������߼�)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ���ñ�����ģ�鼰���������İ�
library work;
use work.Constants_pack.all;

entity tb_VideoTimingGen is
end tb_VideoTimingGen;

architecture Behavioral of tb_VideoTimingGen is

    -- ����������������Եĵ�Ԫ(DUT)
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

    -- �������������ź�
    signal s_Clk         : std_logic := '0';
    signal s_Clk_en      : std_logic := '0';
    signal s_Reset_n     : std_logic := '0';
    signal s_Hsync       : std_logic;
    signal s_Vsync       : std_logic;
    signal s_Hcount      : std_logic_vector(10 downto 0);
    signal s_Vcount      : std_logic_vector(10 downto 0);
    signal s_Start_video : std_logic;
    signal s_Video_on    : std_logic;

    -- ʱ�����ڶ��� (25 MHz)
    constant CLK_PERIOD : time := 40 ns; -- 1 / 25 MHz = 40 ns

begin

    -- ʵ���������Ե�Ԫ(DUT)
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

    -- ʱ�����ɽ��� (********** ������ **********)
    clk_process: process
    begin
        --loop -- <<-- ����������ѭ��
            s_Clk <= '0';
            wait for CLK_PERIOD / 2;
            s_Clk <= '1';
            wait for CLK_PERIOD / 2;
        --end loop; -- <<-- ����������ѭ��
    end process clk_process;

    -- �������̣����ڿ��Ƹ�λ��ʱ��ʹ��
    stimulus_process: process
    begin
        -- 1. ��ʼ״̬�����ָ�λ
        s_Reset_n <= '0';
        s_Clk_en  <= '0';
        wait for 100 ns;

        -- 2. �ͷŸ�λ����ʼ����
        s_Reset_n <= '1';
        wait for CLK_PERIOD;
        
        -- 3. ����ʱ��ʹ�ܣ��ü�������ʼ����
        s_Clk_en  <= '1';

        -- 4. �����㹻����ʱ���Թ۲�������һ֡��������
        wait for 20 ms;
        
        -- 5. (��ѡ) ����ʱ��ʹ�ܣ���ͣ������
        s_Clk_en <= '0';
        wait for 1 ms;
        s_Clk_en <= '1';

        -- ֹͣ����
        wait;
    end process stimulus_process;

end Behavioral;