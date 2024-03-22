
--Company:
-- Engineer:
--
-- Create Date: 03/14/2024 11:41:51 AM
-- Design Name:
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
    component Reg
    port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    signal slowclk,SeleA,SeleB,S0_0,S0_1,S0_2,S0_3,Carry1:std_logic;
    signal Q1,Q2 : std_logic_vector (3 downto 0);
   
    component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
    end component;
   
    component RCA_4
        Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
     end component;
       
begin
SeleA<=not RegSel;
SeleB<=RegSel;

Slow_Clk_1 : Slow_Clk
    port map(
    Clk_in => Clk,
    Clk_out =>slowclk);
   

Register_A : Reg
    port map(
    D => A,
    En=>SeleA,
    Clk=>slowclk,
    Q=>Q1);
   
Register_B : Reg
        port map(
        D => A,
        En=>SeleB,
        Clk=>slowclk,
        Q=>Q2);

RCA_0 : RCA_4
    port map(
    A0=>Q1(0),
    A1=>Q1(1),
    A2=>Q1(2),
    A3=>Q1(3),
    B0=>Q2(0),
    B1=>Q2(1),
    B2=>Q2(2),
    B3=>Q2(3),
    C_in=>'0',
    S0=>S0_0,
    S1=>S0_1,
    S2=>S0_2,
    S3=>S0_3,
    C_out=>Carry1);

Carry<=Carry1;    
Zero<=(NOT S0_0)AND(NOT S0_1)AND(NOT S0_2)AND(NOT S0_3)AND(NOT Carry1);
S(0)<=S0_0;
S(1)<=S0_1;
S(2)<=S0_2;
S(3)<=S0_3;
   
end Behavioral;