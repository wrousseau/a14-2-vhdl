----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:18 10/20/2014 
-- Design Name: 
-- Module Name:    filter - arc1 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Filter is
	
    PORT ( 	clk : in  STD_LOGIC;
				R0 : in  STD_LOGIC_VECTOR (31 downto 0);
				R1 : in  STD_LOGIC_VECTOR (31 downto 0);
				R2 : in  STD_LOGIC_VECTOR (31 downto 0);
				R3 : out  STD_LOGIC_VECTOR (31 downto 0)
			);
			
end Filter;

architecture arc1 of Filter is

signal ready : STD_LOGIC := '0';
signal k0, k1, k2, k3, k4, k5, k6, k7, k8 : STD_LOGIC_VECTOR(7 downto 0);
signal result : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

COMPONENT Mask is
	PORT (
		ready : in STD_LOGIC;
		k0, k1, k2, k3, k4, k5, k6, k7, k8 : in  STD_LOGIC_VECTOR (7 downto 0);
		result : out  STD_LOGIC_VECTOR (7 downto 0)
	);
END COMPONENT Mask;

BEGIN	theMask : Mask PORT MAP (
			 ready => ready,
			 result => result,
          k0 => k0,
          k1 => k1,
			 k2 => k2,
			 k3 => k3,
			 k4 => k4,
			 k5 => k5,
			 k6 => k6,
			 k7 => k7,
			 k8 => k8
        );
		  
	PROCESS(R2) is

	BEGIN
	
	R3 <= (others=>'0');
	
	for j in 3 downto 0 loop
		k0 <= R0(j*8 + 7 downto j*8);
		k1 <= R0(j*8 + 7 downto j*8);
		k2 <= R0(j*8 + 7 downto j*8);
		k3 <= R1(j*8 + 7 downto j*8);
		k4 <= R1(j*8 + 7 downto j*8);
		k5 <= R1(j*8 + 7 downto j*8);
		k6 <= R2(j*8 + 7 downto j*8);
		k7 <= R2(j*8 + 7 downto j*8);
		k8 <= R2(j*8 + 7 downto j*8);
	end loop;
	
	END PROCESS;
	
	
	PROCESS is
	BEGIN
		
		for j in 3 downto 0 loop
			wait on result;
			R3( j*8 + 7 downto j*8 ) <= result;
		end loop;

	END PROCESS;

end arc1;

