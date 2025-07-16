-- �ļ���: Constants_pack.vhd
-- ����: ����VGA 640x480 @ 60Hzģʽ��ʱ���� [cite: 17, 19]

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Constants_pack is
    -- ˮƽʱ���� (��λ: ����ʱ������)
    constant H_total  : integer := 800;    -- һ����ɨ����������� [cite: 24]
    constant H_active : integer := 640;    -- ˮƽ��Ч��ʾ���� [cite: 25]
    constant H_fp     : integer := 16;     -- ˮƽǰ�� (front porch) [cite: 25]
    constant H_sync   : integer := 96;     -- ˮƽͬ�������� [cite: 26]
    constant H_bp     : integer := 48;     -- ˮƽ���� (back porch) [cite: 26]

    -- ��ֱʱ���� (��λ: ��)
    constant V_total  : integer := 520;    -- һ��֡�������� [cite: 27]
    constant V_active : integer := 480;    -- ��ֱ��Ч��ʾ���� [cite: 27]
    constant V_fp     : integer := 9;      -- ��ֱǰ�� (front porch) [cite: 28]
    constant V_sync   : integer := 2;      -- ��ֱͬ�������� [cite: 28]
    constant V_bp     : integer := 29;     -- ��ֱ���� (back porch) [cite: 29]
end Constants_pack;

package body Constants_pack is
end Constants_pack;