-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity solve_NTRU_modp_mkgm2_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    vla1_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    vla1_ce0 : OUT STD_LOGIC;
    vla1_we0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    vla1_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    gm : IN STD_LOGIC_VECTOR (13 downto 0);
    igm : IN STD_LOGIC_VECTOR (13 downto 0);
    logn : IN STD_LOGIC_VECTOR (31 downto 0);
    g : IN STD_LOGIC_VECTOR (30 downto 0);
    p : IN STD_LOGIC_VECTOR (24 downto 0);
    p0i : IN STD_LOGIC_VECTOR (30 downto 0) );
end;


architecture behav of solve_NTRU_modp_mkgm2_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (12 downto 0) := "0000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (12 downto 0) := "0000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (12 downto 0) := "0000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (12 downto 0) := "0000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (12 downto 0) := "0000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (12 downto 0) := "0000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (12 downto 0) := "0001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (12 downto 0) := "0010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (12 downto 0) := "0100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (12 downto 0) := "1000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv6_1E : STD_LOGIC_VECTOR (5 downto 0) := "011110";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv32_80000000 : STD_LOGIC_VECTOR (31 downto 0) := "10000000000000000000000000000000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv25_1FFFFFF : STD_LOGIC_VECTOR (24 downto 0) := "1111111111111111111111111";
    constant ap_const_lv25_0 : STD_LOGIC_VECTOR (24 downto 0) := "0000000000000000000000000";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv32_FFFFFFFE : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111110";
    constant ap_const_lv6_3F : STD_LOGIC_VECTOR (5 downto 0) := "111111";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (12 downto 0) := "0000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal REV10_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal REV10_ce0 : STD_LOGIC;
    signal REV10_q0 : STD_LOGIC_VECTOR (9 downto 0);
    signal grp_modp_montymul_fu_184_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal reg_211 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal tmp_173_fu_404_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal p0i_cast_fu_218_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p0i_cast_reg_597 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_cast_cast_cast_cast_fu_227_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_cast_cast_cast_cast_reg_603 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_90_fu_232_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_90_reg_610 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_91_reg_617 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal n_fu_338_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal n_reg_637 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln757_10_fu_344_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln757_10_reg_642 : STD_LOGIC_VECTOR (31 downto 0);
    signal e_fu_383_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal e_reg_664 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal icmp_ln954_fu_361_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sext_ln808_fu_400_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln808_reg_669 : STD_LOGIC_VECTOR (31 downto 0);
    signal sh_prom9_fu_480_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sh_prom9_reg_698 : STD_LOGIC_VECTOR (63 downto 0);
    signal x1_02_load_reg_706 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal icmp_ln962_fu_487_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal x2_load_reg_711 : STD_LOGIC_VECTOR (31 downto 0);
    signal lshr_ln34_reg_721 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal grp_modp_montymul_fu_184_ap_ready : STD_LOGIC;
    signal grp_modp_montymul_fu_184_a : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_modp_montymul_fu_184_b : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_modp_montymul_fu_184_p : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_modp_montymul_fu_184_p0i : STD_LOGIC_VECTOR (31 downto 0);
    signal x2_3_modp_montymul_fu_193_ap_ready : STD_LOGIC;
    signal x2_3_modp_montymul_fu_193_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal z_fu_280_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal g_cast_fu_329_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal shl_ln966_fu_506_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln967_2_fu_554_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln968_fu_574_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state13 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state13 : signal is "none";
    signal g_assign_9_fu_88 : STD_LOGIC_VECTOR (31 downto 0);
    signal k_06_fu_92 : STD_LOGIC_VECTOR (31 downto 0);
    signal k_fu_367_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_78_fu_96 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_89_fu_464_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_100 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_14_fu_412_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal u_01_fu_104 : STD_LOGIC_VECTOR (63 downto 0);
    signal u_199_fu_492_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal x1_02_fu_108 : STD_LOGIC_VECTOR (31 downto 0);
    signal x2_fu_112 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_cast_cast_cast_fu_223_p0 : STD_LOGIC_VECTOR (24 downto 0);
    signal p_cast_cast_cast_fu_223_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal shl_ln685_fu_238_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln685_fu_244_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_250_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln685_fu_258_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal and_ln685_fu_266_p1 : STD_LOGIC_VECTOR (24 downto 0);
    signal and_ln685_fu_266_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal sext_ln685_fu_272_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal zext_ln685_fu_276_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln735_fu_288_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln757_fu_292_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal and_ln757_fu_300_p1 : STD_LOGIC_VECTOR (24 downto 0);
    signal and_ln757_fu_300_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal sext_ln757_fu_305_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal zext_ln757_fu_309_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln757_fu_313_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln946_fu_334_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln808_fu_400_p0 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_173_fu_404_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_14_fu_412_p0 : STD_LOGIC_VECTOR (5 downto 0);
    signal lshr_ln813_fu_442_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln813_fu_446_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln813_fu_436_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln813_fu_450_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal and_ln813_fu_458_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal k_12_fu_475_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal shl_ln_fu_527_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln967_fu_535_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal add_ln967_fu_539_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal lshr_ln_fu_544_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln968_fu_559_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component solve_NTRU_modp_montymul IS
    port (
        ap_ready : OUT STD_LOGIC;
        a : IN STD_LOGIC_VECTOR (31 downto 0);
        b : IN STD_LOGIC_VECTOR (31 downto 0);
        p : IN STD_LOGIC_VECTOR (31 downto 0);
        p0i : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component solve_NTRU_modp_mkgm2_1_REV10_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (9 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (9 downto 0) );
    end component;



begin
    REV10_U : component solve_NTRU_modp_mkgm2_1_REV10_ROM_AUTO_1R
    generic map (
        DataWidth => 10,
        AddressRange => 1024,
        AddressWidth => 10)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => REV10_address0,
        ce0 => REV10_ce0,
        q0 => REV10_q0);

    grp_modp_montymul_fu_184 : component solve_NTRU_modp_montymul
    port map (
        ap_ready => grp_modp_montymul_fu_184_ap_ready,
        a => grp_modp_montymul_fu_184_a,
        b => grp_modp_montymul_fu_184_b,
        p => grp_modp_montymul_fu_184_p,
        p0i => grp_modp_montymul_fu_184_p0i,
        ap_return => grp_modp_montymul_fu_184_ap_return);

    x2_3_modp_montymul_fu_193 : component solve_NTRU_modp_montymul
    port map (
        ap_ready => x2_3_modp_montymul_fu_193_ap_ready,
        a => x2_fu_112,
        b => reg_211,
        p => p_cast_cast_cast_cast_reg_603,
        p0i => p0i_cast_reg_597,
        ap_return => x2_3_modp_montymul_fu_193_ap_return);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    i_fu_100_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_0))) then 
                i_fu_100 <= ap_const_lv6_1E;
            elsif (((tmp_173_fu_404_p3 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
                i_fu_100 <= i_14_fu_412_p2;
            end if; 
        end if;
    end process;

    k_06_fu_92_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                k_06_fu_92 <= logn;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_1))) then 
                k_06_fu_92 <= k_fu_367_p2;
            end if; 
        end if;
    end process;

    u_01_fu_104_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
                u_01_fu_104 <= ap_const_lv64_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_0))) then 
                u_01_fu_104 <= u_199_fu_492_p2;
            end if; 
        end if;
    end process;

    x1_02_fu_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
                x1_02_fu_108 <= z_90_reg_610;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_0))) then 
                x1_02_fu_108 <= grp_modp_montymul_fu_184_ap_return;
            end if; 
        end if;
    end process;

    x2_fu_112_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
                x2_fu_112 <= z_90_reg_610;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_0))) then 
                x2_fu_112 <= x2_3_modp_montymul_fu_193_ap_return;
            end if; 
        end if;
    end process;

    z_78_fu_96_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_0))) then 
                z_78_fu_96 <= z_90_reg_610;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
                z_78_fu_96 <= z_89_fu_464_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_0))) then
                e_reg_664 <= e_fu_383_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state6) or ((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_1)))) then
                g_assign_9_fu_88 <= grp_modp_montymul_fu_184_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state12)) then
                lshr_ln34_reg_721 <= add_ln968_fu_559_p2(13 downto 2);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                n_reg_637 <= n_fu_338_p2;
                    zext_ln757_10_reg_642(30 downto 0) <= zext_ln757_10_fu_344_p1(30 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                    p0i_cast_reg_597(30 downto 0) <= p0i_cast_fu_218_p1(30 downto 0);
                    p_cast_cast_cast_cast_reg_603(30 downto 0) <= p_cast_cast_cast_cast_fu_227_p1(30 downto 0);
                z_90_reg_610 <= z_90_fu_232_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state10) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or ((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8)) or ((tmp_173_fu_404_p3 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1)))) then
                reg_211 <= grp_modp_montymul_fu_184_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state8)) then
                sext_ln808_reg_669 <= sext_ln808_fu_400_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state10)) then
                    sh_prom9_reg_698(31 downto 0) <= sh_prom9_fu_480_p1(31 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_0))) then
                x1_02_load_reg_706 <= x1_02_fu_108;
                x2_load_reg_711 <= x2_fu_112;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                z_91_reg_617 <= add_ln757_fu_313_p2(31 downto 1);
            end if;
        end if;
    end process;
    p0i_cast_reg_597(31) <= '0';
    p_cast_cast_cast_cast_reg_603(31) <= '0';
    zext_ln757_10_reg_642(31) <= '0';
    sh_prom9_reg_698(63 downto 32) <= "00000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state8, tmp_173_fu_404_p3, ap_CS_fsm_state7, icmp_ln954_fu_361_p2, ap_CS_fsm_state11, icmp_ln962_fu_487_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state8 => 
                if (((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state12;
                end if;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXX";
        end case;
    end process;
    REV10_address0 <= shl_ln966_fu_506_p2(10 - 1 downto 0);

    REV10_ce0_assign_proc : process(ap_CS_fsm_state11)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
            REV10_ce0 <= ap_const_logic_1;
        else 
            REV10_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln757_fu_313_p2 <= std_logic_vector(unsigned(zext_ln757_fu_309_p1) + unsigned(grp_modp_montymul_fu_184_ap_return));
    add_ln967_fu_539_p2 <= std_logic_vector(unsigned(zext_ln967_fu_535_p1) + unsigned(gm));
    add_ln968_fu_559_p2 <= std_logic_vector(unsigned(zext_ln967_fu_535_p1) + unsigned(igm));
    and_ln685_fu_266_p1 <= p;
    and_ln685_fu_266_p2 <= (select_ln685_fu_258_p3 and and_ln685_fu_266_p1);
    and_ln757_fu_300_p1 <= p;
    and_ln757_fu_300_p2 <= (select_ln757_fu_292_p3 and and_ln757_fu_300_p1);
    and_ln813_fu_458_p2 <= (xor_ln813_fu_436_p2 and select_ln813_fu_450_p3);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state12 <= ap_CS_fsm(11);
    ap_CS_fsm_state13 <= ap_CS_fsm(12);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;
    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;
    ap_ST_fsm_state13_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state11, icmp_ln962_fu_487_p2)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)) or ((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state11, icmp_ln962_fu_487_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    e_fu_383_p2 <= std_logic_vector(unsigned(p_cast_cast_cast_cast_reg_603) + unsigned(ap_const_lv32_FFFFFFFE));
    g_cast_fu_329_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(g),32));

    grp_modp_montymul_fu_184_a_assign_proc : process(ap_CS_fsm_state1, reg_211, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state8, tmp_173_fu_404_p3, ap_CS_fsm_state10, ap_CS_fsm_state5, ap_CS_fsm_state6, zext_ln757_10_reg_642, ap_CS_fsm_state7, icmp_ln954_fu_361_p2, ap_CS_fsm_state11, icmp_ln962_fu_487_p2, z_fu_280_p2, g_cast_fu_329_p1, ap_CS_fsm_state9, g_assign_9_fu_88, z_78_fu_96, x1_02_fu_108)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_0))) then 
            grp_modp_montymul_fu_184_a <= x1_02_fu_108;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_modp_montymul_fu_184_a <= zext_ln757_10_reg_642;
        elsif ((((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8)) or ((tmp_173_fu_404_p3 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8)))) then 
            grp_modp_montymul_fu_184_a <= z_78_fu_96;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_1))) then 
            grp_modp_montymul_fu_184_a <= g_assign_9_fu_88;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            grp_modp_montymul_fu_184_a <= g_cast_fu_329_p1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            grp_modp_montymul_fu_184_a <= reg_211;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            grp_modp_montymul_fu_184_a <= z_fu_280_p2;
        else 
            grp_modp_montymul_fu_184_a <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_modp_montymul_fu_184_b_assign_proc : process(ap_CS_fsm_state1, reg_211, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state8, tmp_173_fu_404_p3, ap_CS_fsm_state10, ap_CS_fsm_state5, ap_CS_fsm_state6, zext_ln757_10_fu_344_p1, ap_CS_fsm_state7, icmp_ln954_fu_361_p2, ap_CS_fsm_state11, icmp_ln962_fu_487_p2, z_fu_280_p2, ap_CS_fsm_state9, g_assign_9_fu_88, z_78_fu_96)
    begin
        if (((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
            grp_modp_montymul_fu_184_b <= ap_const_lv32_1;
        elsif (((tmp_173_fu_404_p3 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
            grp_modp_montymul_fu_184_b <= z_78_fu_96;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state9) or ((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_1)))) then 
            grp_modp_montymul_fu_184_b <= g_assign_9_fu_88;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            grp_modp_montymul_fu_184_b <= zext_ln757_10_fu_344_p1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state10) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            grp_modp_montymul_fu_184_b <= reg_211;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            grp_modp_montymul_fu_184_b <= z_fu_280_p2;
        else 
            grp_modp_montymul_fu_184_b <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_modp_montymul_fu_184_p_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state8, tmp_173_fu_404_p3, ap_CS_fsm_state10, p_cast_cast_cast_cast_fu_227_p1, p_cast_cast_cast_cast_reg_603, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, icmp_ln954_fu_361_p2, ap_CS_fsm_state11, icmp_ln962_fu_487_p2, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or ((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8)) or ((tmp_173_fu_404_p3 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8)) or ((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_1)))) then 
            grp_modp_montymul_fu_184_p <= p_cast_cast_cast_cast_reg_603;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            grp_modp_montymul_fu_184_p <= p_cast_cast_cast_cast_fu_227_p1;
        else 
            grp_modp_montymul_fu_184_p <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_modp_montymul_fu_184_p0i_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state8, tmp_173_fu_404_p3, ap_CS_fsm_state10, p0i_cast_fu_218_p1, p0i_cast_reg_597, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, icmp_ln954_fu_361_p2, ap_CS_fsm_state11, icmp_ln962_fu_487_p2, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or ((tmp_173_fu_404_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8)) or ((tmp_173_fu_404_p3 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8)) or ((ap_const_logic_1 = ap_CS_fsm_state11) and (icmp_ln962_fu_487_p2 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln954_fu_361_p2 = ap_const_lv1_1)))) then 
            grp_modp_montymul_fu_184_p0i <= p0i_cast_reg_597;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            grp_modp_montymul_fu_184_p0i <= p0i_cast_fu_218_p1;
        else 
            grp_modp_montymul_fu_184_p0i <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    i_14_fu_412_p0 <= i_fu_100;
    i_14_fu_412_p2 <= std_logic_vector(signed(i_14_fu_412_p0) + signed(ap_const_lv6_3F));
    icmp_ln954_fu_361_p2 <= "1" when (unsigned(k_06_fu_92) < unsigned(ap_const_lv32_A)) else "0";
    icmp_ln962_fu_487_p2 <= "1" when (u_01_fu_104 = n_reg_637) else "0";
    k_12_fu_475_p2 <= std_logic_vector(unsigned(ap_const_lv32_A) - unsigned(logn));
    k_fu_367_p2 <= std_logic_vector(unsigned(k_06_fu_92) + unsigned(ap_const_lv32_1));
    lshr_ln813_fu_442_p2 <= std_logic_vector(shift_right(unsigned(e_reg_664),to_integer(unsigned('0' & sext_ln808_reg_669(31-1 downto 0)))));
    lshr_ln_fu_544_p4 <= add_ln967_fu_539_p2(13 downto 2);
    n_fu_338_p2 <= std_logic_vector(shift_left(unsigned(ap_const_lv64_1),to_integer(unsigned('0' & zext_ln946_fu_334_p1(31-1 downto 0)))));
    p0i_cast_fu_218_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p0i),32));
    p_cast_cast_cast_cast_fu_227_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_cast_cast_cast_fu_223_p1),32));
    p_cast_cast_cast_fu_223_p0 <= p;
        p_cast_cast_cast_fu_223_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(p_cast_cast_cast_fu_223_p0),31));

    select_ln685_fu_258_p3 <= 
        ap_const_lv25_1FFFFFF when (tmp_fu_250_p3(0) = '1') else 
        ap_const_lv25_0;
    select_ln757_fu_292_p3 <= 
        ap_const_lv25_1FFFFFF when (trunc_ln735_fu_288_p1(0) = '1') else 
        ap_const_lv25_0;
    select_ln813_fu_450_p3 <= 
        ap_const_lv32_FFFFFFFF when (trunc_ln813_fu_446_p1(0) = '1') else 
        ap_const_lv32_0;
        sext_ln685_fu_272_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(and_ln685_fu_266_p2),31));

        sext_ln757_fu_305_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(and_ln757_fu_300_p2),31));

    sext_ln808_fu_400_p0 <= i_fu_100;
        sext_ln808_fu_400_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln808_fu_400_p0),32));

    sh_prom9_fu_480_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(k_12_fu_475_p2),64));
    shl_ln685_fu_238_p2 <= std_logic_vector(shift_left(unsigned(z_90_fu_232_p2),to_integer(unsigned('0' & ap_const_lv32_1(31-1 downto 0)))));
    shl_ln966_fu_506_p2 <= std_logic_vector(shift_left(unsigned(u_01_fu_104),to_integer(unsigned('0' & sh_prom9_reg_698(31-1 downto 0)))));
    shl_ln_fu_527_p3 <= (REV10_q0 & ap_const_lv2_0);
    sub_ln685_fu_244_p2 <= std_logic_vector(unsigned(shl_ln685_fu_238_p2) - unsigned(p_cast_cast_cast_cast_fu_227_p1));
    tmp_173_fu_404_p1 <= i_fu_100;
    tmp_173_fu_404_p3 <= tmp_173_fu_404_p1(5 downto 5);
    tmp_fu_250_p3 <= sub_ln685_fu_244_p2(31 downto 31);
    trunc_ln735_fu_288_p1 <= grp_modp_montymul_fu_184_ap_return(1 - 1 downto 0);
    trunc_ln813_fu_446_p1 <= lshr_ln813_fu_442_p2(1 - 1 downto 0);
    u_199_fu_492_p2 <= std_logic_vector(unsigned(u_01_fu_104) + unsigned(ap_const_lv64_1));

    vla1_address0_assign_proc : process(ap_CS_fsm_state12, zext_ln967_2_fu_554_p1, zext_ln968_fu_574_p1, ap_CS_fsm_state13)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state13)) then 
            vla1_address0 <= zext_ln968_fu_574_p1(12 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
            vla1_address0 <= zext_ln967_2_fu_554_p1(12 - 1 downto 0);
        else 
            vla1_address0 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    vla1_ce0_assign_proc : process(ap_CS_fsm_state12, ap_CS_fsm_state13)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state13) or (ap_const_logic_1 = ap_CS_fsm_state12))) then 
            vla1_ce0 <= ap_const_logic_1;
        else 
            vla1_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    vla1_d0_assign_proc : process(x1_02_load_reg_706, x2_load_reg_711, ap_CS_fsm_state12, ap_CS_fsm_state13)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state13)) then 
            vla1_d0 <= x2_load_reg_711;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
            vla1_d0 <= x1_02_load_reg_706;
        else 
            vla1_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    vla1_we0_assign_proc : process(ap_CS_fsm_state12, ap_CS_fsm_state13)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state13) or (ap_const_logic_1 = ap_CS_fsm_state12))) then 
            vla1_we0 <= ap_const_lv4_F;
        else 
            vla1_we0 <= ap_const_lv4_0;
        end if; 
    end process;

    xor_ln813_fu_436_p2 <= (reg_211 xor grp_modp_montymul_fu_184_ap_return);
    z_89_fu_464_p2 <= (reg_211 xor and_ln813_fu_458_p2);
    z_90_fu_232_p2 <= std_logic_vector(signed(ap_const_lv32_80000000) - signed(p_cast_cast_cast_cast_fu_227_p1));
    z_fu_280_p2 <= std_logic_vector(unsigned(zext_ln685_fu_276_p1) + unsigned(sub_ln685_fu_244_p2));
    zext_ln685_fu_276_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln685_fu_272_p1),32));
    zext_ln757_10_fu_344_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(z_91_reg_617),32));
    zext_ln757_fu_309_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln757_fu_305_p1),32));
    zext_ln946_fu_334_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(logn),64));
    zext_ln967_2_fu_554_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln_fu_544_p4),64));
    zext_ln967_fu_535_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_527_p3),14));
    zext_ln968_fu_574_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln34_reg_721),64));
end behav;
