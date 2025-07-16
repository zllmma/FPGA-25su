-- �ļ���: VideoTimingGen.vhd
-- ����: ����Lab6Mod1a.doc�ĵ�Ҫ�����ɵ���Ƶʱ�������

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- ����unsigned���ͺ��������� [cite: 44]

-- ���ð�������ʱ�����Ŀ�Ͱ� [cite: 41]
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

    -- �ڲ��������ź�, ʹ��unsigned���ͱ����������� [cite: 43]
    -- ʹ��11λ��Ϊ��δ��ƽ�����ɵ�SVGA [cite: 38]
    signal hcount_sig : unsigned(10 downto 0);
    signal vcount_sig : unsigned(10 downto 0);
    
    -- �м��źţ������߼��ж�
    signal h_active_period : std_logic;
    signal v_active_period : std_logic;

begin

    -- ����1: ʱ��������ͬ�����̣�ֻ�������ɼĴ������ļ����� [cite: 50]
    sync_process: process(Clk)
    begin
        if rising_edge(Clk) then
            -- ʵ��ͬ�����͵�ƽ��Ч�ĸ�λ [cite: 37, 49]
            if Reset_n = '0' then
                hcount_sig <= (others => '0');
                vcount_sig <= (others => '0');
            -- ֻ�е�ʱ��ʹ����Чʱ���������Ź��� [cite: 37]
            elsif Clk_en = '1' then
                -- ˮƽ�������߼�
                if hcount_sig = H_total - 1 then
                    hcount_sig <= (others => '0');
                    -- ��ֱ��������ÿ�н���ʱ����
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

    -- ����2���������: ʹ�ò����źŸ�ֵʵ���������������߼� [cite: 50]
    -- ���ַ�ʽ�������࣬����ȷ��ʾ������Ǽ�������ֱ�Ӻ���

    -- ˮƽͬ���������� [cite: 37]
    Hsync <= '1' when hcount_sig < H_sync else '0';

    -- ��ֱͬ���������� [cite: 37]
    Vsync <= '1' when vcount_sig < V_sync else '0';

    -- �жϵ�ǰ�Ƿ���ˮƽ��Ч��ʾ����
    h_active_period <= '1' when (hcount_sig >= (H_sync + H_bp)) and (hcount_sig < (H_sync + H_bp + H_active)) else '0';
    
    -- �жϵ�ǰ�Ƿ��ڴ�ֱ��Ч��ʾ����
    v_active_period <= '1' when (vcount_sig >= (V_sync + V_bp)) and (vcount_sig < (V_sync + V_bp + V_active)) else '0';

    -- Video_on�ź���ˮƽ�ʹ�ֱ����Чʱ����Ч [cite: 11, 37]
    Video_on <= h_active_period and v_active_period;

    -- Start_video��һ֡����ĵ�һ����Ч���ص����һ��ʱ�����ڵ����� [cite: 37]
    Start_video <= '1' when (hcount_sig = H_sync + H_bp) and (vcount_sig = V_sync + V_bp) else '0';
    
    -- ���ڲ���������ֵ������˿�, ��Ҫ��������ת�� [cite: 48]
    Hcount <= std_logic_vector(hcount_sig);
    Vcount <= std_logic_vector(vcount_sig);

end Behavioral;