--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:54:34 10/21/2014
-- Design Name:   
-- Module Name:   /auto/m/montalivet/3a/A14-2_VHDL/inputImage/bench.vhd
-- Project Name:  inputImage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: inputImage
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
 
ENTITY bench IS
END bench;
 
ARCHITECTURE behavior OF bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT inputImage
    PORT(
         clk : IN  std_logic;
         R0 : OUT  std_logic_vector(31 downto 0);
         R1 : OUT  std_logic_vector(31 downto 0);
         R2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal R0 : std_logic_vector(31 downto 0);
   signal R1 : std_logic_vector(31 downto 0);
   signal R2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: inputImage PORT MAP (
          clk => clk,
          R0 => R0,
          R1 => R1,
          R2 => R2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;


      wait;
   end process;

END;
