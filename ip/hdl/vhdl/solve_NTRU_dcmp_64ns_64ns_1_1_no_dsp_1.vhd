-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
Library ieee;
use ieee.std_logic_1164.all;

entity solve_NTRU_dcmp_64ns_64ns_1_1_no_dsp_1 is
    generic (
        ID         : integer := 1;
        NUM_STAGE  : integer := 1;
        din0_WIDTH : integer := 32;
        din1_WIDTH : integer := 32;
        dout_WIDTH : integer := 1
    );
    port (
        din0   : in  std_logic_vector(din0_WIDTH-1 downto 0);
        din1   : in  std_logic_vector(din1_WIDTH-1 downto 0);
        opcode : in  std_logic_vector(4 downto 0);
        dout   : out std_logic_vector(dout_WIDTH-1 downto 0)
    );
end entity;

architecture arch of solve_NTRU_dcmp_64ns_64ns_1_1_no_dsp_1 is
    --------------------- Component ---------------------
    component solve_NTRU_dcmp_64ns_64ns_1_1_no_dsp_1_ip is
        port (
            s_axis_a_tvalid         : in  std_logic;
            s_axis_a_tdata       : in  std_logic_vector(din0_WIDTH-1 downto 0);
            s_axis_b_tvalid         : in  std_logic;
            s_axis_b_tdata       : in  std_logic_vector(din1_WIDTH-1 downto 0);
            s_axis_operation_tvalid : in  std_logic;
            s_axis_operation_tdata  : in  std_logic_vector(7 downto 0);
            m_axis_result_tvalid    : out std_logic;
            m_axis_result_tdata     : out std_logic_vector(7 downto 0)
        );
    end component;
    --------------------- Constant ----------------------
    -- AutoESL opcode
    constant AP_OEQ : std_logic_vector(4 downto 0) := "00001";
    constant AP_OGT : std_logic_vector(4 downto 0) := "00010";
    constant AP_OGE : std_logic_vector(4 downto 0) := "00011";
    constant AP_OLT : std_logic_vector(4 downto 0) := "00100";
    constant AP_OLE : std_logic_vector(4 downto 0) := "00101";
    constant AP_ONE : std_logic_vector(4 downto 0) := "00110";
    constant AP_UNO : std_logic_vector(4 downto 0) := "01000";
    -- FPV6 opcode
    constant OP_EQ  : std_logic_vector(7 downto 0) := "00010100";
    constant OP_GT  : std_logic_vector(7 downto 0) := "00100100";
    constant OP_GE  : std_logic_vector(7 downto 0) := "00110100";
    constant OP_LT  : std_logic_vector(7 downto 0) := "00001100";
    constant OP_LE  : std_logic_vector(7 downto 0) := "00011100";
    constant OP_NE  : std_logic_vector(7 downto 0) := "00101100";
    constant OP_UO  : std_logic_vector(7 downto 0) := "00000100";
    --------------------- Local signal ------------------
    signal a_tvalid  : std_logic;
    signal a_tdata  : std_logic_vector(din0_WIDTH-1 downto 0);
    signal b_tvalid  : std_logic;
    signal b_tdata  : std_logic_vector(din1_WIDTH-1 downto 0);
    signal op_tvalid : std_logic;
    signal op_tdata  : std_logic_vector(7 downto 0);
    signal r_tvalid  : std_logic;
    signal r_tdata   : std_logic_vector(7 downto 0);
begin
    --------------------- Instantiation -----------------
    solve_NTRU_dcmp_64ns_64ns_1_1_no_dsp_1_ip_u : component solve_NTRU_dcmp_64ns_64ns_1_1_no_dsp_1_ip
    port map (
        s_axis_a_tvalid         => a_tvalid,
        s_axis_a_tdata          => a_tdata,
        s_axis_b_tvalid         => b_tvalid,
        s_axis_b_tdata          => b_tdata,
        s_axis_operation_tvalid => op_tvalid,
        s_axis_operation_tdata  => op_tdata,
        m_axis_result_tvalid    => r_tvalid,
        m_axis_result_tdata     => r_tdata
    );

    --------------------- Assignment --------------------
    a_tvalid  <= '1';
    a_tdata   <= din0;
    b_tvalid  <= '1';
    b_tdata   <= din1;
    op_tvalid <= '1';
    dout      <= r_tdata(0 downto 0);

    --------------------- Opcode ------------------------
    process (opcode) begin
        case (opcode) is
            when AP_OEQ => op_tdata <= OP_EQ;
            when AP_OGT => op_tdata <= OP_GT;
            when AP_OGE => op_tdata <= OP_GE;
            when AP_OLT => op_tdata <= OP_LT;
            when AP_OLE => op_tdata <= OP_LE;
            when AP_ONE => op_tdata <= OP_NE;
            when AP_UNO => op_tdata <= OP_UO;
            when others => op_tdata <= OP_EQ;
        end case;
    end process;

end architecture;
