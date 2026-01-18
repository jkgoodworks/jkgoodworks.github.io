--------------------------------------------------------------------------------
--                         selFunction7_4_Freq50_uid4
-- VHDL generated for Zynq7000 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X
-- Output signals: Y
--  approx. input signal timings: X: (c0, 0.000000ns)
--  approx. output signal timings: Y: (c0, 1.248000ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity selFunction7_4_Freq50_uid4 is
    port (X : in  std_logic_vector(6 downto 0);
          Y : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of selFunction7_4_Freq50_uid4 is
signal Y0 :  std_logic_vector(3 downto 0);
   -- timing of Y0: (c0, 1.248000ns)
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(3 downto 0);
   -- timing of Y1: (c0, 1.248000ns)
begin
   with X  select  Y0 <= 
      "0000" when "0000000",
      "0000" when "0000001",
      "0000" when "0000010",
      "0000" when "0000011",
      "0001" when "0000100",
      "0001" when "0000101",
      "0001" when "0000110",
      "0001" when "0000111",
      "0001" when "0001000",
      "0001" when "0001001",
      "0001" when "0001010",
      "0001" when "0001011",
      "0010" when "0001100",
      "0010" when "0001101",
      "0010" when "0001110",
      "0010" when "0001111",
      "0011" when "0010000",
      "0011" when "0010001",
      "0010" when "0010010",
      "0010" when "0010011",
      "0011" when "0010100",
      "0011" when "0010101",
      "0011" when "0010110",
      "0011" when "0010111",
      "0100" when "0011000",
      "0100" when "0011001",
      "0011" when "0011010",
      "0011" when "0011011",
      "0101" when "0011100",
      "0100" when "0011101",
      "0100" when "0011110",
      "0100" when "0011111",
      "0101" when "0100000",
      "0101" when "0100001",
      "0101" when "0100010",
      "0100" when "0100011",
      "0110" when "0100100",
      "0110" when "0100101",
      "0101" when "0100110",
      "0101" when "0100111",
      "0111" when "0101000",
      "0110" when "0101001",
      "0110" when "0101010",
      "0101" when "0101011",
      "0111" when "0101100",
      "0111" when "0101101",
      "0110" when "0101110",
      "0110" when "0101111",
      "0111" when "0110000",
      "0111" when "0110001",
      "0111" when "0110010",
      "0110" when "0110011",
      "0111" when "0110100",
      "0111" when "0110101",
      "0111" when "0110110",
      "0111" when "0110111",
      "0111" when "0111000",
      "0111" when "0111001",
      "0111" when "0111010",
      "0111" when "0111011",
      "0111" when "0111100",
      "0111" when "0111101",
      "0111" when "0111110",
      "0111" when "0111111",
      "1001" when "1000000",
      "1001" when "1000001",
      "1001" when "1000010",
      "1001" when "1000011",
      "1001" when "1000100",
      "1001" when "1000101",
      "1001" when "1000110",
      "1001" when "1000111",
      "1001" when "1001000",
      "1001" when "1001001",
      "1001" when "1001010",
      "1001" when "1001011",
      "1001" when "1001100",
      "1001" when "1001101",
      "1001" when "1001110",
      "1001" when "1001111",
      "1001" when "1010000",
      "1001" when "1010001",
      "1010" when "1010010",
      "1010" when "1010011",
      "1001" when "1010100",
      "1010" when "1010101",
      "1010" when "1010110",
      "1010" when "1010111",
      "1010" when "1011000",
      "1010" when "1011001",
      "1011" when "1011010",
      "1011" when "1011011",
      "1011" when "1011100",
      "1011" when "1011101",
      "1011" when "1011110",
      "1011" when "1011111",
      "1011" when "1100000",
      "1011" when "1100001",
      "1100" when "1100010",
      "1100" when "1100011",
      "1100" when "1100100",
      "1100" when "1100101",
      "1100" when "1100110",
      "1100" when "1100111",
      "1100" when "1101000",
      "1101" when "1101001",
      "1101" when "1101010",
      "1101" when "1101011",
      "1101" when "1101100",
      "1101" when "1101101",
      "1101" when "1101110",
      "1101" when "1101111",
      "1110" when "1110000",
      "1110" when "1110001",
      "1110" when "1110010",
      "1110" when "1110011",
      "1110" when "1110100",
      "1110" when "1110101",
      "1110" when "1110110",
      "1110" when "1110111",
      "1111" when "1111000",
      "1111" when "1111001",
      "1111" when "1111010",
      "1111" when "1111011",
      "1111" when "1111100",
      "1111" when "1111101",
      "1111" when "1111110",
      "1111" when "1111111",
      "----" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                                  fp32_div
--                          (FPDiv_8_23_Freq50_uid2)
-- VHDL generated for Zynq7000 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Maxime Christ, Florent de Dinechin (2015)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X Y
-- Output signals: R
--  approx. input signal timings: X: (c0, 0.000000ns)Y: (c0, 0.000000ns)
--  approx. output signal timings: R: (c2, 18.820500ns)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity fp32_div is
    port (clk : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of fp32_div is
   component selFunction7_4_Freq50_uid4 is
      port ( X : in  std_logic_vector(6 downto 0);
             Y : out  std_logic_vector(3 downto 0)   );
   end component;

signal fX :  std_logic_vector(23 downto 0);
   -- timing of fX: (c0, 0.000000ns)
signal fY :  std_logic_vector(23 downto 0);
   -- timing of fY: (c0, 0.000000ns)
signal expR0, expR0_d1, expR0_d2 :  std_logic_vector(9 downto 0);
   -- timing of expR0: (c0, 0.000000ns)
signal sR, sR_d1, sR_d2 :  std_logic;
   -- timing of sR: (c0, 0.124000ns)
signal exnXY :  std_logic_vector(3 downto 0);
   -- timing of exnXY: (c0, 0.000000ns)
signal exnR0, exnR0_d1, exnR0_d2 :  std_logic_vector(1 downto 0);
   -- timing of exnR0: (c0, 0.124000ns)
signal prescaledfY, prescaledfY_d1, prescaledfY_d2 :  std_logic_vector(25 downto 0);
   -- timing of prescaledfY: (c0, 1.824000ns)
signal prescaledfX :  std_logic_vector(26 downto 0);
   -- timing of prescaledfX: (c0, 1.824000ns)
signal w9 :  std_logic_vector(28 downto 0);
   -- timing of w9: (c0, 1.824000ns)
signal sel9 :  std_logic_vector(6 downto 0);
   -- timing of sel9: (c0, 1.824000ns)
signal q9 :  std_logic_vector(3 downto 0);
   -- timing of q9: (c0, 3.072000ns)
signal q9_copy5 :  std_logic_vector(3 downto 0);
   -- timing of q9_copy5: (c0, 1.824000ns)
signal w9pad :  std_logic_vector(29 downto 0);
   -- timing of w9pad: (c0, 1.824000ns)
signal w8fulla :  std_logic_vector(29 downto 0);
   -- timing of w8fulla: (c0, 5.610000ns)
signal fYdec8 :  std_logic_vector(29 downto 0);
   -- timing of fYdec8: (c0, 3.796000ns)
signal w8full :  std_logic_vector(29 downto 0);
   -- timing of w8full: (c0, 7.548000ns)
signal w8 :  std_logic_vector(28 downto 0);
   -- timing of w8: (c0, 7.548000ns)
signal sel8 :  std_logic_vector(6 downto 0);
   -- timing of sel8: (c0, 7.548000ns)
signal q8 :  std_logic_vector(3 downto 0);
   -- timing of q8: (c0, 8.796000ns)
signal q8_copy6 :  std_logic_vector(3 downto 0);
   -- timing of q8_copy6: (c0, 7.548000ns)
signal w8pad :  std_logic_vector(29 downto 0);
   -- timing of w8pad: (c0, 7.548000ns)
signal w7fulla :  std_logic_vector(29 downto 0);
   -- timing of w7fulla: (c0, 11.334000ns)
signal fYdec7 :  std_logic_vector(29 downto 0);
   -- timing of fYdec7: (c0, 9.520000ns)
signal w7full :  std_logic_vector(29 downto 0);
   -- timing of w7full: (c0, 13.272000ns)
signal w7 :  std_logic_vector(28 downto 0);
   -- timing of w7: (c0, 13.272000ns)
signal sel7 :  std_logic_vector(6 downto 0);
   -- timing of sel7: (c0, 13.272000ns)
signal q7 :  std_logic_vector(3 downto 0);
   -- timing of q7: (c0, 14.520000ns)
signal q7_copy7 :  std_logic_vector(3 downto 0);
   -- timing of q7_copy7: (c0, 13.272000ns)
signal w7pad :  std_logic_vector(29 downto 0);
   -- timing of w7pad: (c0, 13.272000ns)
signal w6fulla :  std_logic_vector(29 downto 0);
   -- timing of w6fulla: (c0, 17.058000ns)
signal fYdec6 :  std_logic_vector(29 downto 0);
   -- timing of fYdec6: (c0, 15.244000ns)
signal w6full :  std_logic_vector(29 downto 0);
   -- timing of w6full: (c0, 18.996000ns)
signal w6 :  std_logic_vector(28 downto 0);
   -- timing of w6: (c0, 18.996000ns)
signal sel6 :  std_logic_vector(6 downto 0);
   -- timing of sel6: (c0, 18.996000ns)
signal q6 :  std_logic_vector(3 downto 0);
   -- timing of q6: (c1, 0.762000ns)
signal q6_copy8, q6_copy8_d1 :  std_logic_vector(3 downto 0);
   -- timing of q6_copy8: (c0, 18.996000ns)
signal w6pad, w6pad_d1 :  std_logic_vector(29 downto 0);
   -- timing of w6pad: (c0, 18.996000ns)
signal w5fulla :  std_logic_vector(29 downto 0);
   -- timing of w5fulla: (c1, 3.300000ns)
signal fYdec5 :  std_logic_vector(29 downto 0);
   -- timing of fYdec5: (c1, 1.486000ns)
signal w5full :  std_logic_vector(29 downto 0);
   -- timing of w5full: (c1, 5.238000ns)
signal w5 :  std_logic_vector(28 downto 0);
   -- timing of w5: (c1, 5.238000ns)
signal sel5 :  std_logic_vector(6 downto 0);
   -- timing of sel5: (c1, 5.238000ns)
signal q5 :  std_logic_vector(3 downto 0);
   -- timing of q5: (c1, 6.486000ns)
signal q5_copy9 :  std_logic_vector(3 downto 0);
   -- timing of q5_copy9: (c1, 5.238000ns)
signal w5pad :  std_logic_vector(29 downto 0);
   -- timing of w5pad: (c1, 5.238000ns)
signal w4fulla :  std_logic_vector(29 downto 0);
   -- timing of w4fulla: (c1, 9.024000ns)
signal fYdec4 :  std_logic_vector(29 downto 0);
   -- timing of fYdec4: (c1, 7.210000ns)
signal w4full :  std_logic_vector(29 downto 0);
   -- timing of w4full: (c1, 10.962000ns)
signal w4 :  std_logic_vector(28 downto 0);
   -- timing of w4: (c1, 10.962000ns)
signal sel4 :  std_logic_vector(6 downto 0);
   -- timing of sel4: (c1, 10.962000ns)
signal q4 :  std_logic_vector(3 downto 0);
   -- timing of q4: (c1, 12.210000ns)
signal q4_copy10 :  std_logic_vector(3 downto 0);
   -- timing of q4_copy10: (c1, 10.962000ns)
signal w4pad :  std_logic_vector(29 downto 0);
   -- timing of w4pad: (c1, 10.962000ns)
signal w3fulla :  std_logic_vector(29 downto 0);
   -- timing of w3fulla: (c1, 14.748000ns)
signal fYdec3 :  std_logic_vector(29 downto 0);
   -- timing of fYdec3: (c1, 12.934000ns)
signal w3full :  std_logic_vector(29 downto 0);
   -- timing of w3full: (c1, 16.686000ns)
signal w3 :  std_logic_vector(28 downto 0);
   -- timing of w3: (c1, 16.686000ns)
signal sel3 :  std_logic_vector(6 downto 0);
   -- timing of sel3: (c1, 16.686000ns)
signal q3, q3_d1 :  std_logic_vector(3 downto 0);
   -- timing of q3: (c1, 17.934000ns)
signal q3_copy11 :  std_logic_vector(3 downto 0);
   -- timing of q3_copy11: (c1, 16.686000ns)
signal w3pad, w3pad_d1 :  std_logic_vector(29 downto 0);
   -- timing of w3pad: (c1, 16.686000ns)
signal w2fulla :  std_logic_vector(29 downto 0);
   -- timing of w2fulla: (c2, 0.990000ns)
signal fYdec2, fYdec2_d1 :  std_logic_vector(29 downto 0);
   -- timing of fYdec2: (c1, 18.658000ns)
signal w2full :  std_logic_vector(29 downto 0);
   -- timing of w2full: (c2, 2.928000ns)
signal w2 :  std_logic_vector(28 downto 0);
   -- timing of w2: (c2, 2.928000ns)
signal sel2 :  std_logic_vector(6 downto 0);
   -- timing of sel2: (c2, 2.928000ns)
signal q2 :  std_logic_vector(3 downto 0);
   -- timing of q2: (c2, 4.176000ns)
signal q2_copy12 :  std_logic_vector(3 downto 0);
   -- timing of q2_copy12: (c2, 2.928000ns)
signal w2pad :  std_logic_vector(29 downto 0);
   -- timing of w2pad: (c2, 2.928000ns)
signal w1fulla :  std_logic_vector(29 downto 0);
   -- timing of w1fulla: (c2, 6.714000ns)
signal fYdec1 :  std_logic_vector(29 downto 0);
   -- timing of fYdec1: (c2, 4.900000ns)
signal w1full :  std_logic_vector(29 downto 0);
   -- timing of w1full: (c2, 8.652000ns)
signal w1 :  std_logic_vector(28 downto 0);
   -- timing of w1: (c2, 8.652000ns)
signal sel1 :  std_logic_vector(6 downto 0);
   -- timing of sel1: (c2, 8.652000ns)
signal q1 :  std_logic_vector(3 downto 0);
   -- timing of q1: (c2, 9.900000ns)
signal q1_copy13 :  std_logic_vector(3 downto 0);
   -- timing of q1_copy13: (c2, 8.652000ns)
signal w1pad :  std_logic_vector(29 downto 0);
   -- timing of w1pad: (c2, 8.652000ns)
signal w0fulla :  std_logic_vector(29 downto 0);
   -- timing of w0fulla: (c2, 12.438000ns)
signal fYdec0 :  std_logic_vector(29 downto 0);
   -- timing of fYdec0: (c2, 10.624000ns)
signal w0full :  std_logic_vector(29 downto 0);
   -- timing of w0full: (c2, 14.376000ns)
signal w0 :  std_logic_vector(28 downto 0);
   -- timing of w0: (c2, 14.376000ns)
signal q0 :  std_logic_vector(3 downto 0);
   -- timing of q0: (c2, 15.142500ns)
signal qP9, qP9_d1, qP9_d2 :  std_logic_vector(2 downto 0);
   -- timing of qP9: (c0, 3.072000ns)
signal qM9, qM9_d1, qM9_d2 :  std_logic_vector(2 downto 0);
   -- timing of qM9: (c0, 3.072000ns)
signal qP8, qP8_d1, qP8_d2 :  std_logic_vector(2 downto 0);
   -- timing of qP8: (c0, 8.796000ns)
signal qM8, qM8_d1, qM8_d2 :  std_logic_vector(2 downto 0);
   -- timing of qM8: (c0, 8.796000ns)
signal qP7, qP7_d1, qP7_d2 :  std_logic_vector(2 downto 0);
   -- timing of qP7: (c0, 14.520000ns)
signal qM7, qM7_d1, qM7_d2 :  std_logic_vector(2 downto 0);
   -- timing of qM7: (c0, 14.520000ns)
signal qP6, qP6_d1 :  std_logic_vector(2 downto 0);
   -- timing of qP6: (c1, 0.762000ns)
signal qM6, qM6_d1 :  std_logic_vector(2 downto 0);
   -- timing of qM6: (c1, 0.762000ns)
signal qP5, qP5_d1 :  std_logic_vector(2 downto 0);
   -- timing of qP5: (c1, 6.486000ns)
signal qM5, qM5_d1 :  std_logic_vector(2 downto 0);
   -- timing of qM5: (c1, 6.486000ns)
signal qP4, qP4_d1 :  std_logic_vector(2 downto 0);
   -- timing of qP4: (c1, 12.210000ns)
signal qM4, qM4_d1 :  std_logic_vector(2 downto 0);
   -- timing of qM4: (c1, 12.210000ns)
signal qP3, qP3_d1 :  std_logic_vector(2 downto 0);
   -- timing of qP3: (c1, 17.934000ns)
signal qM3, qM3_d1 :  std_logic_vector(2 downto 0);
   -- timing of qM3: (c1, 17.934000ns)
signal qP2 :  std_logic_vector(2 downto 0);
   -- timing of qP2: (c2, 4.176000ns)
signal qM2 :  std_logic_vector(2 downto 0);
   -- timing of qM2: (c2, 4.176000ns)
signal qP1 :  std_logic_vector(2 downto 0);
   -- timing of qP1: (c2, 9.900000ns)
signal qM1 :  std_logic_vector(2 downto 0);
   -- timing of qM1: (c2, 9.900000ns)
signal qP0 :  std_logic_vector(2 downto 0);
   -- timing of qP0: (c2, 15.142500ns)
signal qM0 :  std_logic_vector(2 downto 0);
   -- timing of qM0: (c2, 15.142500ns)
signal qP :  std_logic_vector(29 downto 0);
   -- timing of qP: (c2, 15.142500ns)
signal qM :  std_logic_vector(29 downto 0);
   -- timing of qM: (c2, 15.142500ns)
signal quotient :  std_logic_vector(29 downto 0);
   -- timing of quotient: (c2, 17.080500ns)
signal mR :  std_logic_vector(25 downto 0);
   -- timing of mR: (c2, 17.204500ns)
signal fRnorm :  std_logic_vector(23 downto 0);
   -- timing of fRnorm: (c2, 17.328500ns)
signal round :  std_logic;
   -- timing of round: (c2, 17.452500ns)
signal expR1 :  std_logic_vector(9 downto 0);
   -- timing of expR1: (c2, 18.572500ns)
signal expfrac :  std_logic_vector(32 downto 0);
   -- timing of expfrac: (c2, 18.572500ns)
signal expfracR :  std_logic_vector(32 downto 0);
   -- timing of expfracR: (c2, 18.572500ns)
signal exnR :  std_logic_vector(1 downto 0);
   -- timing of exnR: (c2, 18.696500ns)
signal exnRfinal :  std_logic_vector(1 downto 0);
   -- timing of exnRfinal: (c2, 18.820500ns)
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            expR0_d1 <=  expR0;
            expR0_d2 <=  expR0_d1;
            sR_d1 <=  sR;
            sR_d2 <=  sR_d1;
            exnR0_d1 <=  exnR0;
            exnR0_d2 <=  exnR0_d1;
            prescaledfY_d1 <=  prescaledfY;
            prescaledfY_d2 <=  prescaledfY_d1;
            q6_copy8_d1 <=  q6_copy8;
            w6pad_d1 <=  w6pad;
            q3_d1 <=  q3;
            w3pad_d1 <=  w3pad;
            fYdec2_d1 <=  fYdec2;
            qP9_d1 <=  qP9;
            qP9_d2 <=  qP9_d1;
            qM9_d1 <=  qM9;
            qM9_d2 <=  qM9_d1;
            qP8_d1 <=  qP8;
            qP8_d2 <=  qP8_d1;
            qM8_d1 <=  qM8;
            qM8_d2 <=  qM8_d1;
            qP7_d1 <=  qP7;
            qP7_d2 <=  qP7_d1;
            qM7_d1 <=  qM7;
            qM7_d2 <=  qM7_d1;
            qP6_d1 <=  qP6;
            qM6_d1 <=  qM6;
            qP5_d1 <=  qP5;
            qM5_d1 <=  qM5;
            qP4_d1 <=  qP4;
            qM4_d1 <=  qM4;
            qP3_d1 <=  qP3;
            qM3_d1 <=  qM3;
         end if;
      end process;
   fX <= "1" & X(22 downto 0);
   fY <= "1" & Y(22 downto 0);
   -- exponent difference, sign and exception combination computed early, to have fewer bits to pipeline
   expR0 <= ("00" & X(30 downto 23)) - ("00" & Y(30 downto 23));
   sR <= X(31) xor Y(31);
   -- early exception handling 
   exnXY <= X(33 downto 32) & Y(33 downto 32);
   with exnXY  select 
      exnR0 <= 
         "01"	 when "0101",										-- normal
         "00"	 when "0001" | "0010" | "0110", -- zero
         "10"	 when "0100" | "1000" | "1001", -- overflow
         "11"	 when others;										-- NaN
    -- Prescaling
   with fY (22 downto 21)  select 
      prescaledfY <= 
         ("0" & fY & "0") + (fY & "00") when "00",
         ("00" & fY) + (fY & "00") when "01",
         fY &"00" when others;
   with fY (22 downto 21)  select 
      prescaledfX <= 
         ("00" & fX & "0") + ("0" & fX & "00") when "00",
         ("000" & fX) + ("0" & fX & "00") when "01",
         "0" & fX &"00" when others;
   w9 <=  "00" & prescaledfX;
   sel9 <= w9(28 downto 24) & prescaledfY(23 downto 22);
   SelFunctionTable9: selFunction7_4_Freq50_uid4
      port map ( X => sel9,
                 Y => q9_copy5);
   q9 <= q9_copy5; -- output copy to hold a pipeline register if needed
   w9pad <= w9 & '0';
   with q9(1 downto 0)  select  
   w8fulla <= 
      w9pad - ("0000" & prescaledfY)			when "01",
      w9pad + ("0000" & prescaledfY)			when "11",
      w9pad + ("000" & prescaledfY & "0")		when "10",
      w9pad							when others;
   with q9(3 downto 1)  select  
   fYdec8 <= 
      ("00" & prescaledfY & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q9(3)  select 
   w8full <= 
      w8fulla - fYdec8			when '0',
      w8fulla + fYdec8			when others;
   w8 <= w8full(26 downto 0) & "00";
   sel8 <= w8(28 downto 24) & prescaledfY(23 downto 22);
   SelFunctionTable8: selFunction7_4_Freq50_uid4
      port map ( X => sel8,
                 Y => q8_copy6);
   q8 <= q8_copy6; -- output copy to hold a pipeline register if needed
   w8pad <= w8 & '0';
   with q8(1 downto 0)  select  
   w7fulla <= 
      w8pad - ("0000" & prescaledfY)			when "01",
      w8pad + ("0000" & prescaledfY)			when "11",
      w8pad + ("000" & prescaledfY & "0")		when "10",
      w8pad							when others;
   with q8(3 downto 1)  select  
   fYdec7 <= 
      ("00" & prescaledfY & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q8(3)  select 
   w7full <= 
      w7fulla - fYdec7			when '0',
      w7fulla + fYdec7			when others;
   w7 <= w7full(26 downto 0) & "00";
   sel7 <= w7(28 downto 24) & prescaledfY(23 downto 22);
   SelFunctionTable7: selFunction7_4_Freq50_uid4
      port map ( X => sel7,
                 Y => q7_copy7);
   q7 <= q7_copy7; -- output copy to hold a pipeline register if needed
   w7pad <= w7 & '0';
   with q7(1 downto 0)  select  
   w6fulla <= 
      w7pad - ("0000" & prescaledfY)			when "01",
      w7pad + ("0000" & prescaledfY)			when "11",
      w7pad + ("000" & prescaledfY & "0")		when "10",
      w7pad							when others;
   with q7(3 downto 1)  select  
   fYdec6 <= 
      ("00" & prescaledfY & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q7(3)  select 
   w6full <= 
      w6fulla - fYdec6			when '0',
      w6fulla + fYdec6			when others;
   w6 <= w6full(26 downto 0) & "00";
   sel6 <= w6(28 downto 24) & prescaledfY(23 downto 22);
   SelFunctionTable6: selFunction7_4_Freq50_uid4
      port map ( X => sel6,
                 Y => q6_copy8);
   q6 <= q6_copy8_d1; -- output copy to hold a pipeline register if needed
   w6pad <= w6 & '0';
   with q6(1 downto 0)  select  
   w5fulla <= 
      w6pad_d1 - ("0000" & prescaledfY_d1)			when "01",
      w6pad_d1 + ("0000" & prescaledfY_d1)			when "11",
      w6pad_d1 + ("000" & prescaledfY_d1 & "0")		when "10",
      w6pad_d1							when others;
   with q6(3 downto 1)  select  
   fYdec5 <= 
      ("00" & prescaledfY_d1 & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY_d1 & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q6(3)  select 
   w5full <= 
      w5fulla - fYdec5			when '0',
      w5fulla + fYdec5			when others;
   w5 <= w5full(26 downto 0) & "00";
   sel5 <= w5(28 downto 24) & prescaledfY_d1(23 downto 22);
   SelFunctionTable5: selFunction7_4_Freq50_uid4
      port map ( X => sel5,
                 Y => q5_copy9);
   q5 <= q5_copy9; -- output copy to hold a pipeline register if needed
   w5pad <= w5 & '0';
   with q5(1 downto 0)  select  
   w4fulla <= 
      w5pad - ("0000" & prescaledfY_d1)			when "01",
      w5pad + ("0000" & prescaledfY_d1)			when "11",
      w5pad + ("000" & prescaledfY_d1 & "0")		when "10",
      w5pad							when others;
   with q5(3 downto 1)  select  
   fYdec4 <= 
      ("00" & prescaledfY_d1 & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY_d1 & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q5(3)  select 
   w4full <= 
      w4fulla - fYdec4			when '0',
      w4fulla + fYdec4			when others;
   w4 <= w4full(26 downto 0) & "00";
   sel4 <= w4(28 downto 24) & prescaledfY_d1(23 downto 22);
   SelFunctionTable4: selFunction7_4_Freq50_uid4
      port map ( X => sel4,
                 Y => q4_copy10);
   q4 <= q4_copy10; -- output copy to hold a pipeline register if needed
   w4pad <= w4 & '0';
   with q4(1 downto 0)  select  
   w3fulla <= 
      w4pad - ("0000" & prescaledfY_d1)			when "01",
      w4pad + ("0000" & prescaledfY_d1)			when "11",
      w4pad + ("000" & prescaledfY_d1 & "0")		when "10",
      w4pad							when others;
   with q4(3 downto 1)  select  
   fYdec3 <= 
      ("00" & prescaledfY_d1 & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY_d1 & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q4(3)  select 
   w3full <= 
      w3fulla - fYdec3			when '0',
      w3fulla + fYdec3			when others;
   w3 <= w3full(26 downto 0) & "00";
   sel3 <= w3(28 downto 24) & prescaledfY_d1(23 downto 22);
   SelFunctionTable3: selFunction7_4_Freq50_uid4
      port map ( X => sel3,
                 Y => q3_copy11);
   q3 <= q3_copy11; -- output copy to hold a pipeline register if needed
   w3pad <= w3 & '0';
   with q3_d1(1 downto 0)  select  
   w2fulla <= 
      w3pad_d1 - ("0000" & prescaledfY_d2)			when "01",
      w3pad_d1 + ("0000" & prescaledfY_d2)			when "11",
      w3pad_d1 + ("000" & prescaledfY_d2 & "0")		when "10",
      w3pad_d1							when others;
   with q3(3 downto 1)  select  
   fYdec2 <= 
      ("00" & prescaledfY_d1 & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY_d1 & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q3_d1(3)  select 
   w2full <= 
      w2fulla - fYdec2_d1			when '0',
      w2fulla + fYdec2_d1			when others;
   w2 <= w2full(26 downto 0) & "00";
   sel2 <= w2(28 downto 24) & prescaledfY_d2(23 downto 22);
   SelFunctionTable2: selFunction7_4_Freq50_uid4
      port map ( X => sel2,
                 Y => q2_copy12);
   q2 <= q2_copy12; -- output copy to hold a pipeline register if needed
   w2pad <= w2 & '0';
   with q2(1 downto 0)  select  
   w1fulla <= 
      w2pad - ("0000" & prescaledfY_d2)			when "01",
      w2pad + ("0000" & prescaledfY_d2)			when "11",
      w2pad + ("000" & prescaledfY_d2 & "0")		when "10",
      w2pad							when others;
   with q2(3 downto 1)  select  
   fYdec1 <= 
      ("00" & prescaledfY_d2 & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY_d2 & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q2(3)  select 
   w1full <= 
      w1fulla - fYdec1			when '0',
      w1fulla + fYdec1			when others;
   w1 <= w1full(26 downto 0) & "00";
   sel1 <= w1(28 downto 24) & prescaledfY_d2(23 downto 22);
   SelFunctionTable1: selFunction7_4_Freq50_uid4
      port map ( X => sel1,
                 Y => q1_copy13);
   q1 <= q1_copy13; -- output copy to hold a pipeline register if needed
   w1pad <= w1 & '0';
   with q1(1 downto 0)  select  
   w0fulla <= 
      w1pad - ("0000" & prescaledfY_d2)			when "01",
      w1pad + ("0000" & prescaledfY_d2)			when "11",
      w1pad + ("000" & prescaledfY_d2 & "0")		when "10",
      w1pad							when others;
   with q1(3 downto 1)  select  
   fYdec0 <= 
      ("00" & prescaledfY_d2 & "00")			when "001" | "010" | "110"| "101",
      ("0" & prescaledfY_d2 & "000")			when "011"| "100",
      (29 downto 0 => '0')when others;
   with q1(3)  select 
   w0full <= 
      w0fulla - fYdec0			when '0',
      w0fulla + fYdec0			when others;
   w0 <= w0full(26 downto 0) & "00";
   q0(3 downto 0) <= "0000" when  w0 = (28 downto 0 => '0')
                else w0(28) & "010";
   qP9 <=      q9(2 downto 0);
   qM9 <=      q9(3) & "00";
   qP8 <=      q8(2 downto 0);
   qM8 <=      q8(3) & "00";
   qP7 <=      q7(2 downto 0);
   qM7 <=      q7(3) & "00";
   qP6 <=      q6(2 downto 0);
   qM6 <=      q6(3) & "00";
   qP5 <=      q5(2 downto 0);
   qM5 <=      q5(3) & "00";
   qP4 <=      q4(2 downto 0);
   qM4 <=      q4(3) & "00";
   qP3 <=      q3(2 downto 0);
   qM3 <=      q3(3) & "00";
   qP2 <=      q2(2 downto 0);
   qM2 <=      q2(3) & "00";
   qP1 <=      q1(2 downto 0);
   qM1 <=      q1(3) & "00";
   qP0 <= q0(2 downto 0);
   qM0 <= q0(3)  & "00";
   qP <= qP9_d2 & qP8_d2 & qP7_d2 & qP6_d1 & qP5_d1 & qP4_d1 & qP3_d1 & qP2 & qP1 & qP0;
   qM <= qM9_d2(1 downto 0) & qM8_d2 & qM7_d2 & qM6_d1 & qM5_d1 & qM4_d1 & qM3_d1 & qM2 & qM1 & qM0 & "0";
   quotient <= qP - qM;
   -- We need a mR in (0, -wf-2) format: 1+wF fraction bits, 1 round bit, and 1 guard bit for the normalisation,
   -- quotient is the truncation of the exact quotient to at least 2^(-wF-2) bits
   -- now discarding its possible known MSB zeroes, and dropping the possible extra LSB bit (due to radix 4) 
   mR <= quotient(28 downto 3); 
   -- normalisation
   fRnorm <=    mR(24 downto 1)  when mR(25)= '1'
           else mR(23 downto 0);  -- now fRnorm is a (-1, -wF-1) fraction
   round <= fRnorm(0); 
   expR1 <= expR0_d2 + ("000" & (6 downto 1 => '1') & mR(25)); -- add back bias
   -- final rounding
   expfrac <= expR1 & fRnorm(23 downto 1) ;
   expfracR <= expfrac + ((32 downto 1 => '0') & round);
   exnR <=      "00"  when expfracR(32) = '1'   -- underflow
           else "10"  when  expfracR(32 downto 31) =  "01" -- overflow
           else "01";      -- 00, normal case
   with exnR0_d2  select 
      exnRfinal <= 
         exnR   when "01", -- normal
         exnR0_d2  when others;
   R <= exnRfinal & sR_d2 & expfracR(30 downto 0);
end architecture;

