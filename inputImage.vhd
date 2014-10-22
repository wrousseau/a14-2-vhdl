----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:00 10/21/2014 
-- Design Name: 
-- Module Name:    inputImage - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use STD.TEXTIO.ALL; // utilisation de fichiers


entity inputImage is
    Port ( clk : in  STD_LOGIC;
           input_file : in  file;
           R0 : out  STD_LOGIC_VECTOR(31 downto 0);
           R1 : out  STD_LOGIC_VECTOR(31 downto 0);
           R2 : out  STD_LOGIC_VECTOR(31 downto 0));
end inputImage;


architecture arc1 of inputImage is

READING : process
 variable input_line: line;	 -- le type LINE est un pointeur
 file input_file: text open READ_MODE is "entrees.dat";	 -- fichier spécifié
 variable input_value0: bit_vector(31 downto 0);	  -- variables à lire
 variable input_value0: bit_vector(31 downto 0);	  -- variables à lire
 variable input_value0: bit_vector(31 downto 0);	  -- variables à lire

begin
 readline(input_file, input_line);	-- new line read from the input file
 read(input_line, input_value);	-- new vector read from the input line
 R0	<=	input_value0 ;
 
 readline(input_file, input_line);	-- new line read from the input file
 read(input_line, input_value1);	-- new vector read from the input line
 R1	<= input_value1 ;

 readline(input_file, input_line);	-- new line read from the input file
 read(input_line, input_value2);	-- new vector read from the input line
 R2	<= input_value2 ;

end process READING;

end arc1;

