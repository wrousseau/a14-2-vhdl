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
	
	k0 <= R0(7 downto 0);
	k1 <= R0(15 downto 8);
	k2 <= R0(23 downto 16);
	k3 <= R1(7 downto 0);
	k4 <= R1(15 downto 8);
	k5 <= R1(23 downto 16);
	k6 <= R2(7 downto 0);
	k7 <= R2(15 downto 8);
	k8 <= R2(23 downto 16);
	
	--R3(7 downto 0) <= k0;
	--R3(15 downto 8) <= k1;
	--R3(23 downto 16) <= k2;
	--R3(31 downto 24) <= k3;
	
	--ready <= '1';
	--wait on ready;
	
	k0 <= k1;
	k1 <= k2;
	k2 <= R0(31 downto 24);
	k3 <= k4;
	k4 <= k5;
	k5 <= R1(31 downto 24);
	k6 <= k7;
	k7 <= k8;
	k8 <= R2(31 downto 24);
	
	--R3(7 downto 0) <= k0;
	--R3(15 downto 8) <= k1;
	--R3(23 downto 16) <= k2;
	--R3(31 downto 24) <= k3;
	
	--ready <= '0';
	
	--result <= "00000000";
	--if clk = '0' then
		--for j in 1 to 2 loop
			--k0 <= R0( (j-1)*7 + 7 downto (j-1)*7 );
			--k1 <= R0(j*7 + 7 downto j*7);
			--k2 <= R0((j+1)*7 + 7 downto (j+1)*7 );
			--k3 <= R1( (j-1)*7 + 7 downto (j-1)*7 );
			--k4 <= R1(j*7 + 7 downto j*7);
			--k5 <= R1((j+1)*7 + 7 downto (j+1)*7 );
			--k6 <= R2( (j-1)*7 + 7 downto (j-1)*7 );
			--k7 <= R2(j*7 + 7 downto j*7);
			--k8 <= R2((j+1)*7 + 7 downto (j+1)*7 );
		
			--ready <= '1';
		--end loop;
	--end if;
	
	END PROCESS;
	
	
	PROCESS(result)
	
	BEGIN
		R3(7 downto 0) <= result;
		R3(15 downto 8) <= result;
		R3(23 downto 16) <= result;
		R3(31 downto 24) <= result;
		--ready <= '0';

	END PROCESS;

end arc1;
