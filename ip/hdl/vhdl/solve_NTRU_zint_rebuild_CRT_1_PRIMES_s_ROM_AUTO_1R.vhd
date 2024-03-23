-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity solve_NTRU_zint_rebuild_CRT_1_PRIMES_s_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 31; 
             AddressWidth     : integer := 10; 
             AddressRange    : integer := 522
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of solve_NTRU_zint_rebuild_CRT_1_PRIMES_s_ROM_AUTO_1R is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 => "0000000000000000010011111111111", 
    1 => "0011100000110010000110011100001", 
    2 => "1001111001111000000101100011001", 
    3 => "0111001101101011110101010111110", 
    4 => "0000111111001010010110111101111", 
    5 => "0100011101011110101011110110001", 
    6 => "0111110111101010011010010100000", 
    7 => "0011001000111000101001100110110", 
    8 => "1000010001110111001010100110010", 
    9 => "0111110000110111011011010011101", 
    10 => "0000001001010001010000110100001", 
    11 => "0010101000011101110000101111000", 
    12 => "1100101100011111011100111001011", 
    13 => "1001011000010011001011010111101", 
    14 => "1000000111100111110100111010001", 
    15 => "1110100000000010011111011001100", 
    16 => "1010000010010100000010011000100", 
    17 => "0101001110010101110110010110011", 
    18 => "0100100110100110011001011000110", 
    19 => "0001001011100001011100001101101", 
    20 => "0011111001010001010100110001111", 
    21 => "0000010001110000000110101000101", 
    22 => "1000011100011011010010110001100", 
    23 => "0000100011001110000100011010001", 
    24 => "0100110111011000100100100101011", 
    25 => "0111011010100001010110110110101", 
    26 => "0100101110110000010001000101001", 
    27 => "1110110010100011001110101001100", 
    28 => "0010001110001101100000011101010", 
    29 => "0010001011001001010111000001101", 
    30 => "0110110100101111000111101110010", 
    31 => "0000010110110100100011101000100", 
    32 => "0100110100001010111011101011111", 
    33 => "1011111001111001111111010111011", 
    34 => "1001001001100110010111000001000", 
    35 => "1000110000111100001100100100101", 
    36 => "0111110111000011001010101001110", 
    37 => "0110111101000101110010001001001", 
    38 => "1010011110101110101011101000110", 
    39 => "1011010010000001000100010001101", 
    40 => "0010110111010110001010100000011", 
    41 => "0100000000010101011111101111001", 
    42 => "1101011010000011010010001100101", 
    43 => "1010000011001110110100100110000", 
    44 => "1011010101100001111100110111000", 
    45 => "1001110001000011011010111111001", 
    46 => "0111100101111010101011001000101", 
    47 => "0000010010011001011100011100000", 
    48 => "0011111101111000010011101110010", 
    49 => "0110101011011101011010111101010", 
    50 => "1001111001001100100000001010100", 
    51 => "0111001001000111100010000000101", 
    52 => "0010001000111110110100011011000", 
    53 => "1110111110010110111010101000110", 
    54 => "1010001000000110001000110000000", 
    55 => "1101010101101010000011011100000", 
    56 => "1011110011101101010010000100011", 
    57 => "0100100001011111110110001110010", 
    58 => "1110001000100101010101111101111", 
    59 => "1110110011011100000010001011111", 
    60 => "0110010101010010111101111111000", 
    61 => "1100010101011011001100011100100", 
    62 => "0010000010011111110011010010111", 
    63 => "0011011110111000001000010000111", 
    64 => "1011010110101011010001110011110", 
    65 => "1000101110010011000010010001110", 
    66 => "0111111011110000110110010111011", 
    67 => "1010011110110101010110101010111", 
    68 => "1111100011110100101101101000001", 
    69 => "0101001001010101101011011011010", 
    70 => "0010010110010001001101001100010", 
    71 => "0111010000001110000100001100001", 
    72 => "1111111000101111111000011101100", 
    73 => "0010101011110111010000000111001", 
    74 => "1110100010110001101111011101110", 
    75 => "1111011101110000110101010100001", 
    76 => "1101000100000000000001101001110", 
    77 => "1111001001111001100111001010110", 
    78 => "1000101111100000101001001101100", 
    79 => "1001100010111111100010001001010", 
    80 => "0110110000000110010111010101000", 
    81 => "0111110001100101101111010111100", 
    82 => "1010011011011110011001100001100", 
    83 => "1001110111100101011000010111010", 
    84 => "0100001000001101010100110010111", 
    85 => "0011001011110001011010000111111", 
    86 => "0010010110111101100101010010010", 
    87 => "1100100011001000100101010100000", 
    88 => "0101011001101001010111110011100", 
    89 => "0011001101110101100100010110100", 
    90 => "1100000100010110000000100101001", 
    91 => "0111010100101101111111111100011", 
    92 => "1001101000100111111011111111100", 
    93 => "0110100100011101101110101101101", 
    94 => "0110001111010010010110011111100", 
    95 => "0110010110000110001111110101011", 
    96 => "0100101110111101000111001011000", 
    97 => "1100011111110000111100000110001", 
    98 => "0001011111101100011100101001000", 
    99 => "1101011110101010110000111010010", 
    100 => "0000101101011100110101110010001", 
    101 => "1010101001001111100101010011111", 
    102 => "0001001011111110111111110100110", 
    103 => "1011110101110000100010110011101", 
    104 => "1011101000100110100000101100010", 
    105 => "0000100111111111011000001101111", 
    106 => "0100110001110110111000111110010", 
    107 => "1011011000110101001100110000111", 
    108 => "0000011111011000010110101001100", 
    109 => "1110010011011010111010000010000", 
    110 => "1001001010010010100110011100010", 
    111 => "1110101000100010011011111101101", 
    112 => "0011010110101001100011001111111", 
    113 => "1101010111101100000101110000100", 
    114 => "1001011110110000101000001111110", 
    115 => "1010010010001101010111001001001", 
    116 => "1001110011111011101100110010010", 
    117 => "1010010111101010010010001011100", 
    118 => "0101010111100100001111101001110", 
    119 => "1100010011011110100011101110011", 
    120 => "1010011000011010100111110100100", 
    121 => "0000001111001110101001011111011", 
    122 => "1111000010111011110010110000000", 
    123 => "1101101110000101110010010011110", 
    124 => "0001001011010101010110000100111", 
    125 => "1111110110111111011110101100100", 
    126 => "1111011101111110011010001011000", 
    127 => "1111000111111101110001000101100", 
    128 => "0011000001111001010001110010100", 
    129 => "1011001011110001010101011100010", 
    130 => "1111100010000101000111000000111", 
    131 => "1101000000110000011001001001011", 
    132 => "0101010101101000110000101101001", 
    133 => "1101100101100111110001000110001", 
    134 => "1101101011110001111101000010001", 
    135 => "0011111000000110001011111011100", 
    136 => "0110010110101110011001110111001", 
    137 => "0011110000110011001010010011111", 
    138 => "1100000011000111010110010010110", 
    139 => "0001001010010011010010011001011", 
    140 => "1101100011110100000101101101100", 
    141 => "0111001011001010101010100101111", 
    142 => "0000000001001011011010110011001", 
    143 => "0000111011001110000000011011011", 
    144 => "1001011000110110010111101100110", 
    145 => "1011101100010001011010111110011", 
    146 => "1101100110100001100001100011011", 
    147 => "0010100111101011011100101110101", 
    148 => "0111001000111001100001000101101", 
    149 => "0100000001101010010010000100110", 
    150 => "0110110110011111111011011111111", 
    151 => "1010110010101110010100011011100", 
    152 => "0100011001011100001010111111000", 
    153 => "1010110111110110001000110100000", 
    154 => "1100010010010100000000001100110", 
    155 => "0011010101010110011001010000110", 
    156 => "0110101001110101101110101100111", 
    157 => "0110101101100100000101110111110", 
    158 => "1011101011100111100011100000000", 
    159 => "1001010011000101101110100101110", 
    160 => "0011110101111110001110000101110", 
    161 => "0101101111100101010011101110110", 
    162 => "0111001011110011111110110111000", 
    163 => "0001100001100010110011111111000", 
    164 => "1111100101000100110110111110000", 
    165 => "1011010100001011001000000010010", 
    166 => "0011100010110100010111011001111", 
    167 => "1000110001000111100101011111110", 
    168 => "0101110111001010110011000001011", 
    169 => "1011101000111101010111101110011", 
    170 => "0000101001100100000110111110011", 
    171 => "0010111100000101111111010110110", 
    172 => "0000111111110101100110111001100", 
    173 => "1101110111101011010001101000011", 
    174 => "1001111101000001011110011000001", 
    175 => "0000110001000111010010011000100", 
    176 => "1000100111101001110010111010100", 
    177 => "1110010110100111001000110110011", 
    178 => "1101000101101001111001111111001", 
    179 => "0111010110011101100010110111101", 
    180 => "0010110001010011101111100110001", 
    181 => "1111000101000110110010111001110", 
    182 => "1010010110010101110000011000110", 
    183 => "1100111010001011101110111000110", 
    184 => "1101100110011011010100100100010", 
    185 => "1000000000000001011000101100001", 
    186 => "0111000100100110010010011001101", 
    187 => "1100010011110000001011110011110", 
    188 => "1000001011000110101000000100010", 
    189 => "0011100100001110111011110110111", 
    190 => "1011100011010110011110001010100", 
    191 => "1101100101111001110101010100101", 
    192 => "1011111100110110100010111110110", 
    193 => "0011101111011010101110101011100", 
    194 => "0111110010000111110010110110111", 
    195 => "1110001011001010100101011110110", 
    196 => "1111010100110010011100001001011", 
    197 => "1110101001011010111111101000011", 
    198 => "1011010110010110001000011000101", 
    199 => "0101101100100011111101111011100", 
    200 => "1110010011110110010010001001100", 
    201 => "1111010001011010001001010000001", 
    202 => "0101011011011001001001001110001", 
    203 => "0100011111100011101101111000000", 
    204 => "0000000011111110110010000000111", 
    205 => "0101001011000001100100111111111", 
    206 => "1110110000000110110011101000101", 
    207 => "1111000110001001111110010110110", 
    208 => "0010110011111110111001001011011", 
    209 => "0111010010111100100000010110001", 
    210 => "1010110011000001111110101100000", 
    211 => "1100111101100001111010100111101", 
    212 => "0111011011000000011001000110010", 
    213 => "1000101100011001010111001010110", 
    214 => "0100111011101001110111000100110", 
    215 => "1101010100001011110101000100111", 
    216 => "0101000010000001100110011010110", 
    217 => "1001110110111001101101110100101", 
    218 => "1010100001001111000100100100111", 
    219 => "1010101101111000110011110111111", 
    220 => "1101001010111110110100110011010", 
    221 => "0010101011100011101101000000111", 
    222 => "0011110101000011111111000111110", 
    223 => "0001101000011001100111010010001", 
    224 => "0011000110101100010001111001001", 
    225 => "1010000110111110101010011010011", 
    226 => "1111011100111101110100001001010", 
    227 => "1100010001100000110100110100011", 
    228 => "1011000011001100110110000001000", 
    229 => "1000011101101010000110100000001", 
    230 => "1011011010011111110001000000001", 
    231 => "1100110110110100000110011010010", 
    232 => "0001010110110011110100110001001", 
    233 => "0101001110011110010110101110111", 
    234 => "0011000100011011001010010101011", 
    235 => "1011010011011101000001000110101", 
    236 => "1011101111010110111011110111111", 
    237 => "1101001011100100010001110001100", 
    238 => "1101101010011001011110001110100", 
    239 => "1100110001101010110010111000101", 
    240 => "0111111110011111101001011010101", 
    241 => "0101001110110100001000101011001", 
    242 => "0011001101101100001100100101011", 
    243 => "1111010011011010001000001101110", 
    244 => "0111101100000001001010010110000", 
    245 => "0101010011111000000100110111111", 
    246 => "0110001000000101110111111100011", 
    247 => "1101001001101111101101001100010", 
    248 => "0100110010101101000011100111101", 
    249 => "1001101010111000011101101111110", 
    250 => "0111011101000010100100100000010", 
    251 => "1100100000110011010000001001001", 
    252 => "0011011111001101111000000000101", 
    253 => "0011010110001111101101111010011", 
    254 => "0110010001011011110001010010101", 
    255 => "0101100010101011101101000101100", 
    256 => "0010111111100010100010101100110", 
    257 => "1100110100010100100001001001100", 
    258 => "0100111100100100000001100101001", 
    259 => "1101100011011101110101001001010", 
    260 => "1010011101000010111010010110000", 
    261 => "1011010110011110110100111100101", 
    262 => "0011011101000010100111110001100", 
    263 => "1111110101001111101010100011010", 
    264 => "0111000000011000110111111010001", 
    265 => "0011100011100001001100111111011", 
    266 => "1000010111010001110000101011010", 
    267 => "1010001111000101100110101000001", 
    268 => "0010001101100100010001100101010", 
    269 => "1011110100001110010000000010011", 
    270 => "1101011011011110101000100010000", 
    271 => "0101010011110111101111010010100", 
    272 => "1001010100001011001101110011101", 
    273 => "0010101001110000010010101101010", 
    274 => "0111111001110011010111010100010", 
    275 => "1000101101000101100110001000010", 
    276 => "0101011101101000010001101011011", 
    277 => "0111000100001101000111000000100", 
    278 => "1111110111101001011001110101110", 
    279 => "1101101111001101101011000011010", 
    280 => "1101000010101011111110010100000", 
    281 => "0001011000110001001011001010000", 
    282 => "1101111110110111101010101000111", 
    283 => "1001111110111101110110010011100", 
    284 => "1000000110101101100111011010101", 
    285 => "1101010011110010011001111110001", 
    286 => "0111000000100011010101110111001", 
    287 => "0111011001100010101100000110010", 
    288 => "0010001001110100001011001010111", 
    289 => "0011110010001010110010111000010", 
    290 => "0010010100011010101010111110001", 
    291 => "0010000101111101101010100100110", 
    292 => "0010110010110101001010011100110", 
    293 => "0001001110100010001001000101100", 
    294 => "0111001100101101010100101011011", 
    295 => "1001100111100010110100011011110", 
    296 => "0010110010111111010001001101101", 
    297 => "0101110110011111100001100010100", 
    298 => "0110001110111001100011001111101", 
    299 => "0111011101101101101101111010001", 
    300 => "1111101000110000001111011111100", 
    301 => "0110111000101001001000101011010", 
    302 => "1111001111010011101101010011110", 
    303 => "1101011010011100101010001010000", 
    304 => "1111101100100110001100001100011", 
    305 => "1110000011010011110001011001011", 
    306 => "1000001011100111110111011011011", 
    307 => "1101011000101111110010110110111", 
    308 => "0010110011111010100111011011010", 
    309 => "1011001101011001111000001011001", 
    310 => "0010101010110110001011001001000", 
    311 => "1110001110010110001111011110111", 
    312 => "1000110000011100001110111011110", 
    313 => "0011111010010101111100010011111", 
    314 => "0111101011101100100000000000110", 
    315 => "0111101011000111100111101011000", 
    316 => "1100011111010011110011100110101", 
    317 => "0110010011011010100111100011100", 
    318 => "1101100010000110101110101100101", 
    319 => "1001101010011010111001010011001", 
    320 => "0001000110001100000100100101100", 
    321 => "1010000011010001110011011001011", 
    322 => "1101110111001001100001000000010", 
    323 => "1101010101101010010010101100011", 
    324 => "0001000111100010100111000010000", 
    325 => "0010111100100110000010010010111", 
    326 => "0110001100011100110111000110101", 
    327 => "0101001100100001011001111101101", 
    328 => "0001110100010010011111110101010", 
    329 => "1010011001110010110011100000010", 
    330 => "1110000111111000010001011110001", 
    331 => "1111001111010001100001100111101", 
    332 => "0101110110011010111100111001011", 
    333 => "0011111111111111110111011101111", 
    334 => "1100111101111001110110011011101", 
    335 => "0000001010000010011011011010110", 
    336 => "0010011000100010111000010001101", 
    337 => "1011000101110101011100100000110", 
    338 => "1110111111011010001010100010110", 
    339 => "1100000001010110010011011111000", 
    340 => "1001100010101010010100100001001", 
    341 => "1000110101010111000010111111100", 
    342 => "0010110001110000011100111101011", 
    343 => "0001100111011001101011101101011", 
    344 => "1101010011001001110111000101000", 
    345 => "1011010001100110111101000010011", 
    346 => "0110011001001101111101111011011", 
    347 => "1011110010111101010011100001000", 
    348 => "0001010101101100000100101010100", 
    349 => "0111001011111101101001001000100", 
    350 => "0101101100100111110010000100010", 
    351 => "1001110010011100111010100100100", 
    352 => "0011110111100101000110110100001", 
    353 => "1101001011110101111101000100000", 
    354 => "0110000111010110111111101010101", 
    355 => "0011100001010001111100110101101", 
    356 => "1010100001011100110110001010011", 
    357 => "1011111111011001110111000100011", 
    358 => "1100101001000011110011000100101", 
    359 => "1011110011110000011000111101000", 
    360 => "0111000101000011011001010111110", 
    361 => "1100001011110111000110010001010", 
    362 => "1100011110011011010110000000101", 
    363 => "1011000011010111111011011010000", 
    364 => "1100111110100000011100000001100", 
    365 => "1001010000100111001101001110101", 
    366 => "1111110011001110111111101110001", 
    367 => "1010101000100100001100001001001", 
    368 => "0100101001000100110010101100010", 
    369 => "1011111101100010111100011101110", 
    370 => "0110001011000000100010101111111", 
    371 => "1101010100100111101010100000011", 
    372 => "0100011011110000011000010111110", 
    373 => "0100010001011011100001000110001", 
    374 => "0110100110010111111001110011011", 
    375 => "1001000110001111101000101110111", 
    376 => "1100110110000100100000001100100", 
    377 => "1011111111010010110110011101110", 
    378 => "1000011110011001011111111000001", 
    379 => "0111001100000001001011010111011", 
    380 => "0101101000101110110100100010000", 
    381 => "0110100101111010101111111001011", 
    382 => "1000111101010011001001010110100", 
    383 => "0100101101011110010001010001010", 
    384 => "0001101110011100101011111000010", 
    385 => "0110001111110000011100000011111", 
    386 => "0011000000110111001001010101010", 
    387 => "1001100011101111010110111000001", 
    388 => "0000110001010101101110100011111", 
    389 => "0111011001101111101000001001101", 
    390 => "0111110111011111101001001101001", 
    391 => "1100101101100101001010101100101", 
    392 => "0011000001011100010010001111001", 
    393 => "1110101000111000001001000001101", 
    394 => "1001010010101010000101101110001", 
    395 => "1011101111100001111100101011101", 
    396 => "0111011001110000011110100100111", 
    397 => "0111110001011100001000101010011", 
    398 => "0101111101100010010111110111011", 
    399 => "1010110011101110101001011001110", 
    400 => "0010100011010111101011000010000", 
    401 => "0101000000110000011000110001110", 
    402 => "1011011101110010101110000001100", 
    403 => "0101000111100010110111100010110", 
    404 => "1010101100010101000011111110110", 
    405 => "1001100111010101101010110110101", 
    406 => "1110111110111111000101001010110", 
    407 => "1000000001010001100100110111011", 
    408 => "1111101101101001000111110111001", 
    409 => "0001011110011111101111011111101", 
    410 => "1001100000111011000100011000000", 
    411 => "1110101110101000111010111111101", 
    412 => "1110101111110010110001111010101", 
    413 => "0001100001000000100011100001000", 
    414 => "0100101011101001000110000111101", 
    415 => "0101101001101011001011011101000", 
    416 => "0111010010001000100101010101010", 
    417 => "1110111011111010110110010010111", 
    418 => "0111110100001101000000001111100", 
    419 => "1010101111101110100100110101001", 
    420 => "1100010001011010101100100011111", 
    421 => "1101000000110101110000011011010", 
    422 => "0101110100100110111011111111100", 
    423 => "1100000101101011000001111100011", 
    424 => "0111101000111100111111001100111", 
    425 => "0110001010010111111101111111010", 
    426 => "0101100101011110000111011100101", 
    427 => "1111110110001000011010000111111", 
    428 => "1110000110101000100111000011001", 
    429 => "1011010111011010110000111100111", 
    430 => "1001011000100111010101011101010", 
    431 => "1100111001100010000100000000010", 
    432 => "1100001000001111101000100110011", 
    433 => "1000010000101001000010011011000", 
    434 => "0111100101011010010010010010010", 
    435 => "1010000100100101000000110010000", 
    436 => "0111110110001001110001001100101", 
    437 => "1001010110000010111011010010101", 
    438 => "0110101011101110001000011100100", 
    439 => "1001010100100010011100010001101", 
    440 => "0010101111100000110101010010000", 
    441 => "0111101101101101001000110110001", 
    442 => "1000100111011111100001110111110", 
    443 => "1100100100001101101101101011111", 
    444 => "1100100001100110111111010001011", 
    445 => "0100101100101010111010010101111", 
    446 => "1110000110001110000011010110011", 
    447 => "0000010111000110110001100001101", 
    448 => "1100110000111110111000110010101", 
    449 => "1010010001100000011011001011111", 
    450 => "1110100001111010010100011100100", 
    451 => "1011001011101000011101011000001", 
    452 => "1011001011000001111000011111100", 
    453 => "0100001001010011011101001101101", 
    454 => "0011000100110100011100011100011", 
    455 => "1110100011110011100010001100001", 
    456 => "0110011010100100011000110100000", 
    457 => "0111010011100110101101010110010", 
    458 => "1101010111000100011111011010101", 
    459 => "1010100000011101100001001011101", 
    460 => "1110101001111100000100101001111", 
    461 => "1110011100101110110010000110111", 
    462 => "0101101001111000001100001110101", 
    463 => "0001101000010001001111001111010", 
    464 => "1111001111011100111001111001001", 
    465 => "0011110111000110001100101011011", 
    466 => "0101000001101110000101010101000", 
    467 => "0110001100001110110001100010010", 
    468 => "1011100101100111000010000000110", 
    469 => "1101111100011000000110111111111", 
    470 => "0110000011000110010100110011000", 
    471 => "1000110101000011010000100001001", 
    472 => "1100110010000110110011000100111", 
    473 => "1111100010100001010011111110001", 
    474 => "1010000011100011010110001010011", 
    475 => "1010110011011001010010110110011", 
    476 => "1010001100111011110101010100100", 
    477 => "0000110001100010000001000101010", 
    478 => "1100011000111101101000110010011", 
    479 => "0000000010010000100111100011010", 
    480 => "0100010000000000010100111111011", 
    481 => "1011101011110110001110111000010", 
    482 => "0010000010011101111111100000100", 
    483 => "1000110011010001000110110011100", 
    484 => "1100100001001111001111000010011", 
    485 => "0000000110101011100101111000011", 
    486 => "1000011010011011000011011001011", 
    487 => "1101101100101100010000001110101", 
    488 => "1010001010010111110010010110100", 
    489 => "1011101000000011001000101010100", 
    490 => "0101111101011110100000000011100", 
    491 => "1010101011010110101000111001100", 
    492 => "1110010011010101111000010011110", 
    493 => "0001001110111101011011111111111", 
    494 => "0001100111100011010111000100001", 
    495 => "0111000000000011110001110001111", 
    496 => "1100000100011100001111000101100", 
    497 => "0000010000101110000110101000101", 
    498 => "1010110100011111011100010001100", 
    499 => "0110001001010011011001110001001", 
    500 => "1011010111101011010110000100110", 
    501 => "1011011001110110111011000100111", 
    502 => "1101011100100110100001000000101", 
    503 => "0010100000101011101110010111010", 
    504 => "1110001100010111001000101110111", 
    505 => "0001010010000110100101110001011", 
    506 => "0010101111111101111110111011110", 
    507 => "1100001110000001000100100111010", 
    508 => "0000100100000010101011011001001", 
    509 => "1110101011011010010000100000101", 
    510 => "0100000000011011001001110100011", 
    511 => "1011011011001110010101000000011", 
    512 => "1101010111000110101110001011010", 
    513 => "0010001100000111011001111110111", 
    514 => "0111100111101000111110111101010", 
    515 => "1011010010011100011001101101010", 
    516 => "1111010111000100001001000001000", 
    517 => "1101100001010101000100010011001", 
    518 => "1001010100011010000110000000001", 
    519 => "1000011011110110101111111001100", 
    520 => "1100100101010011000010101101100", 
    521 => "0000000000000000000000000000000" );


begin 


memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(address0_tmp)); 
        end if;
    end if;
end process;

end rtl;

