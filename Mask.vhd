----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:25 10/21/2014 
-- Design Name: 
-- Module Name:    mask - arc1 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mask is
    Port ( 	ready : in STD_LOGIC;
				k0, k1, k2, k3, k4, k5, k6, k7, k8 : in  STD_LOGIC_VECTOR (7 downto 0);
				result : out  STD_LOGIC_VECTOR (7 downto 0));
end Mask;

ARCHITECTURE arc1 of Mask is

	
BEGIN

	PROCESS(k8)
	
	variable M0 : STD_LOGIC_VECTOR(7 downto 0):= "00000001";
	variable M1 : STD_LOGIC_VECTOR(7 downto 0):= "00000001";
	variable M2 : STD_LOGIC_VECTOR(7 downto 0):= "00000001";
	variable M3 : STD_LOGIC_VECTOR(7 downto 0):= "00000001";
	variable M4 : STD_LOGIC_VECTOR(7 downto 0):= "00000000";
	variable M5 : STD_LOGIC_VECTOR(7 downto 0):= "10000001";
	variable M6 : STD_LOGIC_VECTOR(7 downto 0):= "10000001";
	variable M7 : STD_LOGIC_VECTOR(7 downto 0):= "10000001";
	variable M8 : STD_LOGIC_VECTOR(7 downto 0):= "10000001";
	
	variable tmpResult : STD_LOGIC_VECTOR(15 downto 0);

	BEGIN
		--if ready = '1' then
			tmpResult :=  M0 * k0
							+ M1 * k1
							+ M2 * k2
							+ M3 * k3
							+ M4 * k4
							+ M5 * k5
							+ M6 * k6
							+ M7 * k7
							+ M8 * k8;
					
		result <= tmpResult(7 downto 0);
		
		--end if;

	END PROCESS;

END arc1;

