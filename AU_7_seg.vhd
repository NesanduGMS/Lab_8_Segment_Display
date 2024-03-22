----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2024 01:25:33 PM
-- Design Name: 
-- Module Name: AU_7_seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AU_7_seg is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RegSel : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end AU_7_seg;

architecture Behavioral of AU_7_seg is

component AU
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       RegSel : in STD_LOGIC;
       Clk : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       Zero : out STD_LOGIC;
       Carry : out STD_LOGIC);
end component;
 
component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
        data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
 
signal S : std_logic_vector (3 downto 0);

begin

AU_1 : AU
    Port map( A => A,
    RegSel => RegSel,
    Clk => Clk,
    S => S,
    Zero => Zero,
    Carry => Carry);
    
LUT_16_7_1 : LUT_16_7
        Port map( address => S,
        data => S_7Seg
        );

S_LED <= S;

end Behavioral;
