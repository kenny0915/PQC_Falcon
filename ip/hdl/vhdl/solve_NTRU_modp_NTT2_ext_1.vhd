-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity solve_NTRU_modp_NTT2_ext_1 is
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
    vla1_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    vla1_address1 : OUT STD_LOGIC_VECTOR (11 downto 0);
    vla1_ce1 : OUT STD_LOGIC;
    vla1_we1 : OUT STD_LOGIC_VECTOR (3 downto 0);
    vla1_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    vla1_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
    a : IN STD_LOGIC_VECTOR (63 downto 0);
    stride : IN STD_LOGIC_VECTOR (63 downto 0);
    gm : IN STD_LOGIC_VECTOR (63 downto 0);
    logn : IN STD_LOGIC_VECTOR (31 downto 0);
    p : IN STD_LOGIC_VECTOR (31 downto 0);
    p0i : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of solve_NTRU_modp_NTT2_ext_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (8 downto 0) := "000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (8 downto 0) := "000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (8 downto 0) := "000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (8 downto 0) := "000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (8 downto 0) := "000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (8 downto 0) := "001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (8 downto 0) := "010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv63_0 : STD_LOGIC_VECTOR (62 downto 0) := "000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv63_1 : STD_LOGIC_VECTOR (62 downto 0) := "000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv31_7FFFFFFF : STD_LOGIC_VECTOR (30 downto 0) := "1111111111111111111111111111111";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal empty_fu_206_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal empty_reg_556 : STD_LOGIC_VECTOR (30 downto 0);
    signal empty_304_fu_210_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal empty_304_reg_562 : STD_LOGIC_VECTOR (13 downto 0);
    signal stride_cast_cast_fu_218_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal stride_cast_cast_reg_568 : STD_LOGIC_VECTOR (11 downto 0);
    signal empty_306_fu_222_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal empty_306_reg_574 : STD_LOGIC_VECTOR (13 downto 0);
    signal icmp_ln1227_fu_226_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1227_reg_579 : STD_LOGIC_VECTOR (0 downto 0);
    signal n_fu_236_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal n_reg_597 : STD_LOGIC_VECTOR (63 downto 0);
    signal ht_fu_260_p4 : STD_LOGIC_VECTOR (62 downto 0);
    signal ht_reg_608 : STD_LOGIC_VECTOR (62 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln1232_fu_255_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln1236_fu_270_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1236_reg_613 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln1234_1_reg_618 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln1242_fu_284_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln1242_reg_623 : STD_LOGIC_VECTOR (11 downto 0);
    signal u_fu_293_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal u_reg_631 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal lshr_ln_reg_636 : STD_LOGIC_VECTOR (11 downto 0);
    signal icmp_ln1237_fu_288_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1237_fu_331_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal s_reg_656 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal grp_fu_530_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal mul_ln1243_reg_661 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_535_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal mul_ln1244_reg_666 : STD_LOGIC_VECTOR (11 downto 0);
    signal v_fu_363_p2 : STD_LOGIC_VECTOR (62 downto 0);
    signal v_reg_674 : STD_LOGIC_VECTOR (62 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal vla1_addr_314_reg_679 : STD_LOGIC_VECTOR (11 downto 0);
    signal icmp_ln1245_fu_358_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal vla1_addr_315_reg_685 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln1245_1_fu_439_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln1245_1_reg_690 : STD_LOGIC_VECTOR (63 downto 0);
    signal v1_2_fu_444_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln697_fu_524_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln697_reg_700 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal y_modp_montymul_fu_194_ap_ready : STD_LOGIC;
    signal y_modp_montymul_fu_194_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal v1_reg_149 : STD_LOGIC_VECTOR (63 downto 0);
    signal u_07_reg_161 : STD_LOGIC_VECTOR (63 downto 0);
    signal v_03_reg_172 : STD_LOGIC_VECTOR (62 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal idx_reg_183 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1242_fu_354_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1248_fu_419_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1249_fu_434_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal t_fu_72 : STD_LOGIC_VECTOR (63 downto 0);
    signal m_fu_76 : STD_LOGIC_VECTOR (63 downto 0);
    signal m_6_fu_340_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_305_fu_214_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1230_fu_232_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln1242_1_fu_299_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln1242_fu_303_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal shl_ln_fu_308_p3 : STD_LOGIC_VECTOR (13 downto 0);
    signal add_ln1242_1_fu_316_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal trunc_ln1245_fu_369_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln1239_fu_373_p2 : STD_LOGIC_VECTOR (11 downto 0);
    attribute use_dsp48 : string;
    attribute use_dsp48 of add_ln1239_fu_373_p2 : signal is "no";
    signal shl_ln78_fu_378_p3 : STD_LOGIC_VECTOR (13 downto 0);
    signal add_ln1239_2_fu_391_p2 : STD_LOGIC_VECTOR (11 downto 0);
    attribute use_dsp48 of add_ln1239_2_fu_391_p2 : signal is "no";
    signal shl_ln1239_1_fu_396_p3 : STD_LOGIC_VECTOR (13 downto 0);
    signal r1_fu_386_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal lshr_ln38_fu_409_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal r2_fu_404_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal lshr_ln39_fu_424_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal sub_ln685_fu_450_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln685_fu_455_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_461_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln685_fu_469_p3 : STD_LOGIC_VECTOR (30 downto 0);
    signal and_ln685_fu_477_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal zext_ln685_fu_482_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln697_fu_493_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_177_fu_499_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln697_fu_507_p3 : STD_LOGIC_VECTOR (30 downto 0);
    signal and_ln697_fu_515_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal zext_ln697_fu_520_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_530_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_535_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_535_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
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


    component solve_NTRU_mul_mul_12s_8ns_12_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (11 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (11 downto 0) );
    end component;



begin
    y_modp_montymul_fu_194 : component solve_NTRU_modp_montymul
    port map (
        ap_ready => y_modp_montymul_fu_194_ap_ready,
        a => vla1_q0,
        b => s_reg_656,
        p => p,
        p0i => p0i,
        ap_return => y_modp_montymul_fu_194_ap_return);

    mul_mul_12s_8ns_12_4_1_U19 : component solve_NTRU_mul_mul_12s_8ns_12_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 8,
        dout_WIDTH => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => trunc_ln1237_fu_331_p1,
        din1 => grp_fu_530_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_530_p2);

    mul_mul_12s_8ns_12_4_1_U20 : component solve_NTRU_mul_mul_12s_8ns_12_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 8,
        dout_WIDTH => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_535_p0,
        din1 => grp_fu_535_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_535_p2);





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


    idx_reg_183_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
                idx_reg_183 <= add_ln1245_1_reg_690;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                idx_reg_183 <= ap_const_lv64_0;
            end if; 
        end if;
    end process;

    m_fu_76_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1227_fu_226_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                m_fu_76 <= ap_const_lv64_1;
            elsif (((icmp_ln1237_fu_288_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                m_fu_76 <= m_6_fu_340_p2;
            end if; 
        end if;
    end process;

    t_fu_72_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1227_fu_226_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                t_fu_72 <= n_fu_236_p2;
            elsif (((icmp_ln1237_fu_288_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                t_fu_72 <= zext_ln1236_reg_613;
            end if; 
        end if;
    end process;

    u_07_reg_161_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln1245_fu_358_p2 = ap_const_lv1_1))) then 
                u_07_reg_161 <= u_reg_631;
            elsif (((icmp_ln1232_fu_255_p2 = ap_const_lv1_1) and (icmp_ln1227_reg_579 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                u_07_reg_161 <= ap_const_lv64_0;
            end if; 
        end if;
    end process;

    v1_reg_149_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln1245_fu_358_p2 = ap_const_lv1_1))) then 
                v1_reg_149 <= v1_2_fu_444_p2;
            elsif (((icmp_ln1232_fu_255_p2 = ap_const_lv1_1) and (icmp_ln1227_reg_579 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                v1_reg_149 <= ap_const_lv64_0;
            end if; 
        end if;
    end process;

    v_03_reg_172_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
                v_03_reg_172 <= v_reg_674;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                v_03_reg_172 <= ap_const_lv63_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln1245_fu_358_p2 = ap_const_lv1_0))) then
                add_ln1245_1_reg_690 <= add_ln1245_1_fu_439_p2;
                vla1_addr_314_reg_679 <= zext_ln1248_fu_419_p1(12 - 1 downto 0);
                vla1_addr_315_reg_685 <= zext_ln1249_fu_434_p1(12 - 1 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state8)) then
                add_ln697_reg_700 <= add_ln697_fu_524_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                empty_304_reg_562 <= empty_304_fu_210_p1;
                empty_306_reg_574 <= empty_306_fu_222_p1;
                empty_reg_556 <= empty_fu_206_p1;
                icmp_ln1227_reg_579 <= icmp_ln1227_fu_226_p2;
                    stride_cast_cast_reg_568(7 downto 0) <= stride_cast_cast_fu_218_p1(7 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1232_fu_255_p2 = ap_const_lv1_1) and (icmp_ln1227_reg_579 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                ht_reg_608 <= t_fu_72(63 downto 1);
                trunc_ln1234_1_reg_618 <= t_fu_72(12 downto 1);
                trunc_ln1242_reg_623 <= trunc_ln1242_fu_284_p1;
                    zext_ln1236_reg_613(62 downto 0) <= zext_ln1236_fu_270_p1(62 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1237_fu_288_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                lshr_ln_reg_636 <= add_ln1242_1_fu_316_p2(13 downto 2);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                mul_ln1243_reg_661 <= grp_fu_530_p2;
                mul_ln1244_reg_666 <= grp_fu_535_p2;
                s_reg_656 <= vla1_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1227_fu_226_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                n_reg_597 <= n_fu_236_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                u_reg_631 <= u_fu_293_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                v_reg_674 <= v_fu_363_p2;
            end if;
        end if;
    end process;
    stride_cast_cast_reg_568(11 downto 8) <= "0000";
    zext_ln1236_reg_613(63) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln1227_reg_579, ap_CS_fsm_state2, icmp_ln1232_fu_255_p2, ap_CS_fsm_state3, icmp_ln1237_fu_288_p2, ap_CS_fsm_state7, icmp_ln1245_fu_358_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and ((icmp_ln1232_fu_255_p2 = ap_const_lv1_0) or (icmp_ln1227_reg_579 = ap_const_lv1_1)))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((icmp_ln1237_fu_288_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln1245_fu_358_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXX";
        end case;
    end process;
    add_ln1239_2_fu_391_p2 <= std_logic_vector(unsigned(trunc_ln1245_fu_369_p1) + unsigned(mul_ln1244_reg_666));
    add_ln1239_fu_373_p2 <= std_logic_vector(unsigned(trunc_ln1245_fu_369_p1) + unsigned(mul_ln1243_reg_661));
    add_ln1242_1_fu_316_p2 <= std_logic_vector(unsigned(shl_ln_fu_308_p3) + unsigned(empty_306_reg_574));
    add_ln1242_fu_303_p2 <= std_logic_vector(unsigned(trunc_ln1242_1_fu_299_p1) + unsigned(trunc_ln1242_reg_623));
    add_ln1245_1_fu_439_p2 <= std_logic_vector(unsigned(idx_reg_183) + unsigned(stride));
    add_ln685_fu_455_p2 <= std_logic_vector(unsigned(y_modp_montymul_fu_194_ap_return) + unsigned(sub_ln685_fu_450_p2));
    add_ln697_fu_524_p2 <= std_logic_vector(unsigned(zext_ln697_fu_520_p1) + unsigned(sub_ln697_fu_493_p2));
    and_ln685_fu_477_p2 <= (select_ln685_fu_469_p3 and empty_reg_556);
    and_ln697_fu_515_p2 <= (select_ln697_fu_507_p3 and empty_reg_556);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

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

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, icmp_ln1227_reg_579, ap_CS_fsm_state2, icmp_ln1232_fu_255_p2)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state2) and ((icmp_ln1232_fu_255_p2 = ap_const_lv1_0) or (icmp_ln1227_reg_579 = ap_const_lv1_1))) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
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


    ap_ready_assign_proc : process(icmp_ln1227_reg_579, ap_CS_fsm_state2, icmp_ln1232_fu_255_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and ((icmp_ln1232_fu_255_p2 = ap_const_lv1_0) or (icmp_ln1227_reg_579 = ap_const_lv1_1)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    empty_304_fu_210_p1 <= a(14 - 1 downto 0);
    empty_305_fu_214_p1 <= stride(8 - 1 downto 0);
    empty_306_fu_222_p1 <= gm(14 - 1 downto 0);
    empty_fu_206_p1 <= p(31 - 1 downto 0);
    grp_fu_530_p1 <= stride_cast_cast_reg_568(8 - 1 downto 0);
    grp_fu_535_p0 <= std_logic_vector(signed(trunc_ln1237_fu_331_p1) + signed(trunc_ln1234_1_reg_618));
    grp_fu_535_p1 <= stride_cast_cast_reg_568(8 - 1 downto 0);
    ht_fu_260_p4 <= t_fu_72(63 downto 1);
    icmp_ln1227_fu_226_p2 <= "1" when (logn = ap_const_lv32_0) else "0";
    icmp_ln1232_fu_255_p2 <= "1" when (unsigned(m_fu_76) < unsigned(n_reg_597)) else "0";
    icmp_ln1237_fu_288_p2 <= "1" when (u_07_reg_161 = m_fu_76) else "0";
    icmp_ln1245_fu_358_p2 <= "1" when (v_03_reg_172 = ht_reg_608) else "0";
    lshr_ln38_fu_409_p4 <= r1_fu_386_p2(13 downto 2);
    lshr_ln39_fu_424_p4 <= r2_fu_404_p2(13 downto 2);
    m_6_fu_340_p2 <= std_logic_vector(shift_left(unsigned(m_fu_76),to_integer(unsigned('0' & ap_const_lv64_1(31-1 downto 0)))));
    n_fu_236_p2 <= std_logic_vector(shift_left(unsigned(ap_const_lv64_1),to_integer(unsigned('0' & zext_ln1230_fu_232_p1(31-1 downto 0)))));
    r1_fu_386_p2 <= std_logic_vector(unsigned(shl_ln78_fu_378_p3) + unsigned(empty_304_reg_562));
    r2_fu_404_p2 <= std_logic_vector(unsigned(shl_ln1239_1_fu_396_p3) + unsigned(empty_304_reg_562));
    select_ln685_fu_469_p3 <= 
        ap_const_lv31_7FFFFFFF when (tmp_fu_461_p3(0) = '1') else 
        ap_const_lv31_0;
    select_ln697_fu_507_p3 <= 
        ap_const_lv31_7FFFFFFF when (tmp_177_fu_499_p3(0) = '1') else 
        ap_const_lv31_0;
    shl_ln1239_1_fu_396_p3 <= (add_ln1239_2_fu_391_p2 & ap_const_lv2_0);
    shl_ln78_fu_378_p3 <= (add_ln1239_fu_373_p2 & ap_const_lv2_0);
    shl_ln_fu_308_p3 <= (add_ln1242_fu_303_p2 & ap_const_lv2_0);
    stride_cast_cast_fu_218_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(empty_305_fu_214_p1),12));
    sub_ln685_fu_450_p2 <= std_logic_vector(unsigned(vla1_q1) - unsigned(p));
    sub_ln697_fu_493_p2 <= std_logic_vector(unsigned(vla1_q1) - unsigned(y_modp_montymul_fu_194_ap_return));
    tmp_177_fu_499_p3 <= sub_ln697_fu_493_p2(31 downto 31);
    tmp_fu_461_p3 <= add_ln685_fu_455_p2(31 downto 31);
    trunc_ln1237_fu_331_p1 <= v1_reg_149(12 - 1 downto 0);
    trunc_ln1242_1_fu_299_p1 <= u_07_reg_161(12 - 1 downto 0);
    trunc_ln1242_fu_284_p1 <= m_fu_76(12 - 1 downto 0);
    trunc_ln1245_fu_369_p1 <= idx_reg_183(12 - 1 downto 0);
    u_fu_293_p2 <= std_logic_vector(unsigned(u_07_reg_161) + unsigned(ap_const_lv64_1));
    v1_2_fu_444_p2 <= std_logic_vector(unsigned(t_fu_72) + unsigned(v1_reg_149));
    v_fu_363_p2 <= std_logic_vector(unsigned(v_03_reg_172) + unsigned(ap_const_lv63_1));

    vla1_address0_assign_proc : process(ap_CS_fsm_state5, ap_CS_fsm_state7, vla1_addr_315_reg_685, ap_CS_fsm_state9, zext_ln1242_fu_354_p1, zext_ln1249_fu_434_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            vla1_address0 <= vla1_addr_315_reg_685;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            vla1_address0 <= zext_ln1249_fu_434_p1(12 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            vla1_address0 <= zext_ln1242_fu_354_p1(12 - 1 downto 0);
        else 
            vla1_address0 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    vla1_address1_assign_proc : process(ap_CS_fsm_state7, vla1_addr_314_reg_679, ap_CS_fsm_state8, zext_ln1248_fu_419_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            vla1_address1 <= vla1_addr_314_reg_679;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            vla1_address1 <= zext_ln1248_fu_419_p1(12 - 1 downto 0);
        else 
            vla1_address1 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    vla1_ce0_assign_proc : process(ap_CS_fsm_state5, ap_CS_fsm_state7, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            vla1_ce0 <= ap_const_logic_1;
        else 
            vla1_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    vla1_ce1_assign_proc : process(ap_CS_fsm_state7, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            vla1_ce1 <= ap_const_logic_1;
        else 
            vla1_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    vla1_d0 <= add_ln697_reg_700;
    vla1_d1 <= std_logic_vector(unsigned(zext_ln685_fu_482_p1) + unsigned(add_ln685_fu_455_p2));

    vla1_we0_assign_proc : process(ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            vla1_we0 <= ap_const_lv4_F;
        else 
            vla1_we0 <= ap_const_lv4_0;
        end if; 
    end process;


    vla1_we1_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            vla1_we1 <= ap_const_lv4_F;
        else 
            vla1_we1 <= ap_const_lv4_0;
        end if; 
    end process;

    zext_ln1230_fu_232_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(logn),64));
    zext_ln1236_fu_270_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ht_fu_260_p4),64));
    zext_ln1242_fu_354_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln_reg_636),64));
    zext_ln1248_fu_419_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln38_fu_409_p4),64));
    zext_ln1249_fu_434_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln39_fu_424_p4),64));
    zext_ln685_fu_482_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(and_ln685_fu_477_p2),32));
    zext_ln697_fu_520_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(and_ln697_fu_515_p2),32));
end behav;
