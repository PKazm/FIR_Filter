library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FIR_Filter_T4 is
generic (
    SAMPLE_WIDTH    : natural := 24;
    TAP_WIDTH       : natural := 16;
    FILTER_LENGTH   : natural := 64;
    ACCUM_WIDTH     : natural := 24 + 21;      -- SAMPLE_WIDTH + ceil(log2(sum(coefficients)))
    ACCUM_LSHIFT    : natural := 0
);
port (
    clk             : in std_logic;
    rst             : in std_logic;

    enable          : in std_logic;
    samples_full    : out std_logic;

    data_in         : in std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
    data_in_wen     : in std_logic;

    data_out        : out std_logic_vector(SAMPLE_WIDTH - 1 downto 0);
    data_out_valid  : out std_logic
);
end FIR_Filter_T4;
architecture architecture_FIR_Filter_T4 of FIR_Filter_T4 is


begin

end architecture_FIR_Filter_T4;