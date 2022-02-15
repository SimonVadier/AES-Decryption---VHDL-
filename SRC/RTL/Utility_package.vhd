--	Package File Template
--
--	Purpose: This package defines utility functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;
library LIB_AES;
use LIB_AES.state_definition_package.all;

package utility_package is
	function vector_to_type_state ( data: bit128 ) return type_state; 
	function type_state_to_vector ( data: type_state ) return bit128; 
end utility_package;


package body utility_package is

function vector_to_type_state ( data: bit128 ) return type_state is
	variable RESULT: type_state;
	begin
	  	for i in 0 to 3 loop
            for j in 0 to 3 loop
			    RESULT(i)(j) := data(127-32*j-8*i downto 120-32*j-8*i);
		end loop;
            end loop;
	        return RESULT;
	end vector_to_type_state;
	
	function type_state_to_vector ( data: type_state ) return bit128 is
	variable RESULT: bit128;
	begin
	  	for i in 0 to 3 loop
            for j in 0 to 3 loop
			    RESULT(127-32*j-8*i downto 120-32*j-8*i) := data(i)(j);
		end loop;
            end loop;
	        return RESULT;
	end type_state_to_vector;

end utility_package;

