library ieee;
use ieee.std_logic_1164.all;

--steppermotor Controller

entity stepper_motor is
port (
	clk,reset: in std_logic; --clock & reset signals
	direction :in std_logic; --Direction signal 0 = clockwise ,1 = counterclockwise
	step : in std_logic; --Step signal (pulse to advance one step)
	phase_a,phase_b,phase_c,phase_d : out std_logic --Phases A,B,C,D control signals
);
end stepper_motor;

architecture behavioral of stepper_motor is
--States Definitions	
	type state_type is (s0, s1, s2, s3);
	signal current_state, next_state : state_type;
	

begin
--state machine to control the stepper motor

	NSL: process (clk,reset)
		begin
		  if(reset = '1')then current_state <= s0;
		  elsif (rising_edge(clk))then current_state <= next_state;
		  end if;
	end process NSL;
	
--next state process
	nextstate:process(current_state, direction, step)
	begin
		case current_state is
		 when s0 => if (step = '1') then 
		 		if (direction = '0') then
		 		 next_state <= s1;
		 		else
		 		 next_state <= s3; end if;
		 	   end if;
		when s1 => if (step = '1') then 
		 		if (direction = '0') then
		 		 next_state <= s2;
		 		else
		 		 next_state <= s0; end if;
		 	   end if;
		when s2 => if (step = '1') then 
		 		if (direction = '0') then
		 		 next_state <= s3;
		 		else
		 		 next_state <= s1; end if;
		 	   end if;
		when s3 => if (step = '1') then 
		 		if (direction = '0') then
		 		 next_state <= s0;
		 		else
		 		 next_state <= s2; end if;
		 	   end if;
		when others => next_state <= s0;
		end case;
	end process nextstate;
	
--initialize control signals to 0
	phase_a <= '0';
	phase_b <= '0';
	phase_c <= '0';
	phase_d <= '0';

	OL: process(current_state) is
	begin
	case current_state is
		when s0 => phase_a <='1';
		when s1 => phase_b <='1';
		when s2 => phase_c <='1';
		when s3 => phase_d <='1';
	end case;
	end process OL;
	
end behavioral;
