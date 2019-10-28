----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/20/2018 06:43:07 PM
-- Design Name: 
-- Module Name: simWater - Behavioral
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

entity simWater is
--  Port ( );
end simWater;

architecture Behavioral of simWater is
signal Commands : std_logic_vector(31 downto 0);
signal clk , rst ,watering_system : std_logic;
signal temperature : std_logic_vector(6 downto 0);
signal data : std_logic_vector(6 downto 0);
signal clock_hour : std_logic_vector(4 downto 0);
signal clock_minute : std_logic_vector(5 downto 0);
constant period : time := 100 ns;

component WateringSystem is

  Port (
  
    Commands :in std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
    clk : in std_logic;
    rst : in std_logic;
    Temperature : in std_logic_vector(6 downto 0);
    Data :in std_logic_vector(6 downto 0);
    clock_hour : in std_logic_vector(4 downto 0);
    clock_minute : in std_logic_vector(5 downto 0);
    watering_system : out std_logic
    
   );
end component;


begin
 w1 :  WateringSystem  port map (Commands,clk,rst,Temperature,Data,clock_hour,clock_minute,watering_system);
 
    clk_process :process
 begin
    clk <= '1';
    wait for period/2;
    clk <= '0';
    wait for period/2;
 end process;

    stim_proc:process
  
    begin 
    
    wait for 200ns;
    
    commands<="11111111111111111111111111111111";
    wait for period;
    Data <= "0010100" ;
    clock_hour <= "00111";
    clock_minute <= "000101";
    Temperature <= "0101000";
    
    wait for 4*period;
      Data <= "0011110" ;
      clock_hour <= "10001";
      clock_minute <= "000000";
      Temperature <= "0010100";
      
       wait for 20*period;
       Temperature <= "1010100";
       
       wait for 4*period;
       Data <= "1100100";
       
       wait;
        
        end process;

end Behavioral;
