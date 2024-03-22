----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2024 01:46:14 PM
-- Design Name: 
-- Module Name: AU_7_seg_Sim - Behavioral
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

entity AU_7_seg_Sim is
--  Port ( );
end AU_7_seg_Sim;

architecture Behavioral of AU_7_seg_Sim is

component AU_7_seg
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       Clk : in STD_LOGIC;
       RegSel : in STD_LOGIC;
       S_LED : out STD_LOGIC_VECTOR (3 downto 0);
       S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
       Carry : out STD_LOGIC;
       Zero : out STD_LOGIC);
end component;

signal A, S_LED : STD_LOGIC_VECTOR (3 downto 0);
signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0);
signal Clk, RegSel, Carry, Zero : std_logic;

begin

    UUT: AU_7_seg port map(
        A => A,
        Clk => Clk,
        RegSel => RegSel,
        S_LED => S_LED,
        S_7Seg => S_7Seg,
        Carry => Carry,
        Zero => Zero       
    );
    
--    process begin
--        address <= "1001";
--        WAIT FOR 100ns;
--        address <= "1000";
--        WAIT FOR 100ns;
--        address <= "1101";
--        WAIT FOR 100ns;
--        address <= "0101";
--        WAIT FOR 100ns;
        
--        wait;
--    end process;    


end Behavioral;
