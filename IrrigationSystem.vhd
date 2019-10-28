----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2018 06:08:43 AM
-- Design Name: 
-- Module Name: WateringSystem - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WateringSystem is
  Port (
    Commands :in std_logic_vector(31 downto 0);
    clk : in std_logic;
    rst : in std_logic;
    Temperature : in std_logic_vector(6 downto 0);
    Data :in std_logic_vector(6 downto 0);
    clock_hour : in std_logic_vector(4 downto 0);
    clock_minute : in std_logic_vector(5 downto 0);
    watering_system : out std_logic
   );
end WateringSystem;

architecture Behavioral of WateringSystem is
signal active_system : std_logic;
signal Temperature1 : integer ;
signal Data1 : integer ;
signal clock_hour1 : integer;
signal clock_minute1 : integer;
begin
Temperature1 <= to_integer(signed(Temperature));
Data1 <= to_integer(unsigned(Data));
 clock_hour1<= to_integer(unsigned(clock_hour));
clock_minute1 <= to_integer(unsigned(clock_minute));

    process(clk)
    begin
    
    
    if(rising_edge(clk)) then
            
     if(Commands(31 downto 0)="00000000000000000000000000000000") then
                active_system <= '0';
                
        elsif(Commands (31 downto 0)="11111111111111111111111111111111") then
                                active_system <= '1';
                                end if;
                                
                     if(active_system = '1') then 
                               
           if(( temperature1 > 35 and data1 <= 25)  and  
           (  ((6 <= clock_hour1  and  clock_hour1 <= 11) and ( 0 <= clock_minute1 and clock_minute1 <= 59)) 
          or  (clock_hour1 = 12 and clock_minute1 = 0) ) ) then
           watering_system <= '1';
           
           elsif( (temperature1 > 50 and data1 <= 20)  and  
              ( (  (13 <= clock_hour1  and  clock_hour1 <= 15) and ( 0 <= clock_minute1 and clock_minute1 <= 59) ) or
                      (clock_hour1 = 16 and clock_minute1 = 0)  or 
                      (clock_hour1 = 12 and ( 1 <= clock_minute1 and clock_minute1 <= 59)) )
                       ) then
                      watering_system <= '1';
                      
                      
       elsif( (temperature1 < 30 and data1 <= 35)  and  
         (  ( (17 <= clock_hour1  and  clock_hour1 <= 18) and ( 0 <= clock_minute1 and clock_minute1 <= 59) ) or
                         (clock_hour1 = 19 and clock_minute1 = 0) or 
                       (clock_hour1 = 16 and ( 1 <= clock_minute1 and clock_minute1 <= 59)  ) )
                           ) then
                     watering_system <= '1';
                     
                elsif( ( data1 <= 70 )  and  
           ( ( (20 <= clock_hour1  and  clock_hour1 <= 23) and ( 0 <= clock_minute1 and clock_minute1 <= 59) ) or
             (clock_hour1 = 6 and clock_minute1 = 0 ) or 
               (clock_hour1 = 19 and ( 1 <= clock_minute1 and clock_minute1 <= 59)) or
               ( (0 <= clock_hour1  and  clock_hour1 <=5) and ( 1 <= clock_minute1 and clock_minute1 <= 59) ) ) ) then
               
                watering_system <= '1';
                
                elsif(temperature1 < 0) then
                        watering_system <= '1';
                        
                        else watering_system <= '0';
                        
                        end if;
                        end if;
                        end if;
    end process;


end Behavioral;
