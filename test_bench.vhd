--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:22:29 10/21/2014
-- Design Name:   
-- Module Name:   /auto/d/diallo/Cours/3A/A14/A14-2/project/dev/vhdl/test_bench.vhd
-- Project Name:  vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: filter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE arc1 OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Filter is
    PORT(
         clk : in  STD_LOGIC;
			R0 : in  STD_LOGIC_VECTOR (31 downto 0);
			R1 : in  STD_LOGIC_VECTOR (31 downto 0);
			R2 : in  STD_LOGIC_VECTOR (31 downto 0);
			R3 : out  STD_LOGIC_VECTOR (31 downto 0)
        );
    END COMPONENT Filter;
    

   --Inputs
	signal clk : STD_LOGIC := '0';
	signal R0 : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
	signal R1 : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
	signal R2 : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
	
 	--Outputs
   signal R3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   theFilter : Filter PORT MAP (
          clk => clk,
          R0 => R0,
          R1 => R1,
			 R2 => R2,
			 R3 => R3
        );

   -- Clock process definitions
   clk_process : PROCESS
   BEGIN
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: PROCESS is
	
   BEGIN		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	
		
		-- Black-White line 11111111000000001111111100000000
		-- White-Black line 00000000111111110000000011111111
		
		R0 <= "00000000000000000000000000000000";
		R1 <= "10100010101000101010001010100010";
		R2 <= "00111010101100100000011010001110";
		
		wait on clk;
		
		R0 <= R1;
		R1 <= R2;
		R2 <= "11111111000000001111111100000000";
		
		wait on clk;
		
		R0 <= R1;
		R1 <= R2;
		R2 <= "00000000111111110000000011111111";
		
		wait on clk;
		
		R0 <= R1;
		R1 <= R2;
		R2 <= "00000000000000000000000000000000";

   END PROCESS;

END;
