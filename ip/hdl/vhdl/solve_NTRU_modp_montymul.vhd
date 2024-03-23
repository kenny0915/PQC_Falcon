-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity solve_NTRU_modp_montymul is
port (
    ap_ready : OUT STD_LOGIC;
    a : IN STD_LOGIC_VECTOR (31 downto 0);
    b : IN STD_LOGIC_VECTOR (31 downto 0);
    p : IN STD_LOGIC_VECTOR (31 downto 0);
    p0i : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of solve_NTRU_modp_montymul is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_3E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111110";
    constant ap_const_lv31_7FFFFFFF : STD_LOGIC_VECTOR (30 downto 0) := "1111111111111111111111111111111";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_logic_0 : STD_LOGIC := '0';

attribute shreg_extract : string;
    signal z_fu_58_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_fu_58_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_fu_58_p2 : STD_LOGIC_VECTOR (62 downto 0);
    signal mul_ln722_fu_72_p0 : STD_LOGIC_VECTOR (30 downto 0);
    signal mul_ln722_fu_72_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal mul_ln722_fu_72_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal w_fu_86_p0 : STD_LOGIC_VECTOR (30 downto 0);
    signal w_fu_86_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal w_fu_86_p2 : STD_LOGIC_VECTOR (61 downto 0);
    signal zext_ln718_fu_92_p1 : STD_LOGIC_VECTOR (62 downto 0);
    signal add_ln723_fu_96_p2 : STD_LOGIC_VECTOR (62 downto 0);
    signal trunc_ln_fu_102_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal d_fu_112_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_118_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln724_fu_126_p3 : STD_LOGIC_VECTOR (30 downto 0);
    signal empty_fu_46_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal and_ln724_fu_134_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal zext_ln724_fu_140_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal w_fu_86_p00 : STD_LOGIC_VECTOR (61 downto 0);
    signal w_fu_86_p10 : STD_LOGIC_VECTOR (61 downto 0);
    signal z_fu_58_p00 : STD_LOGIC_VECTOR (62 downto 0);
    signal z_fu_58_p10 : STD_LOGIC_VECTOR (62 downto 0);

    component solve_NTRU_mul_32ns_32ns_63_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (62 downto 0) );
    end component;


    component solve_NTRU_mul_31s_31s_31_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (30 downto 0);
        din1 : IN STD_LOGIC_VECTOR (30 downto 0);
        dout : OUT STD_LOGIC_VECTOR (30 downto 0) );
    end component;


    component solve_NTRU_mul_31ns_32ns_62_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (30 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (61 downto 0) );
    end component;



begin
    mul_32ns_32ns_63_1_1_U1 : component solve_NTRU_mul_32ns_32ns_63_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 63)
    port map (
        din0 => z_fu_58_p0,
        din1 => z_fu_58_p1,
        dout => z_fu_58_p2);

    mul_31s_31s_31_1_1_U2 : component solve_NTRU_mul_31s_31s_31_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 31,
        din1_WIDTH => 31,
        dout_WIDTH => 31)
    port map (
        din0 => mul_ln722_fu_72_p0,
        din1 => mul_ln722_fu_72_p1,
        dout => mul_ln722_fu_72_p2);

    mul_31ns_32ns_62_1_1_U3 : component solve_NTRU_mul_31ns_32ns_62_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 31,
        din1_WIDTH => 32,
        dout_WIDTH => 62)
    port map (
        din0 => w_fu_86_p0,
        din1 => w_fu_86_p1,
        dout => w_fu_86_p2);




    add_ln723_fu_96_p2 <= std_logic_vector(unsigned(zext_ln718_fu_92_p1) + unsigned(z_fu_58_p2));
    and_ln724_fu_134_p2 <= (select_ln724_fu_126_p3 and empty_fu_46_p1);
    ap_ready <= ap_const_logic_1;
    ap_return <= std_logic_vector(unsigned(zext_ln724_fu_140_p1) + unsigned(d_fu_112_p2));
    d_fu_112_p2 <= std_logic_vector(unsigned(trunc_ln_fu_102_p4) - unsigned(p));
    empty_fu_46_p1 <= p(31 - 1 downto 0);
    mul_ln722_fu_72_p0 <= z_fu_58_p2(31 - 1 downto 0);
    mul_ln722_fu_72_p1 <= p0i(31 - 1 downto 0);
    select_ln724_fu_126_p3 <= 
        ap_const_lv31_7FFFFFFF when (tmp_fu_118_p3(0) = '1') else 
        ap_const_lv31_0;
    tmp_fu_118_p3 <= d_fu_112_p2(31 downto 31);
    trunc_ln_fu_102_p4 <= add_ln723_fu_96_p2(62 downto 31);
    w_fu_86_p0 <= w_fu_86_p00(31 - 1 downto 0);
    w_fu_86_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(mul_ln722_fu_72_p2),62));
    w_fu_86_p1 <= w_fu_86_p10(32 - 1 downto 0);
    w_fu_86_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p),62));
    z_fu_58_p0 <= z_fu_58_p00(32 - 1 downto 0);
    z_fu_58_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(b),63));
    z_fu_58_p1 <= z_fu_58_p10(32 - 1 downto 0);
    z_fu_58_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(a),63));
    zext_ln718_fu_92_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(w_fu_86_p2),63));
    zext_ln724_fu_140_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(and_ln724_fu_134_p2),32));
end behav;