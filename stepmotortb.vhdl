library ieee;
use ieee.std_logic_1164.all;

entity stepper_motor_tb is
end entity;

architecture structural of stepper_motor_tb is
	
	--stepper motor component : entity will be tested
	component stepper_motor is
	port (
		clk,reset: in std_logic; --clock & reset signals
		direction :in std_logic; --Direction signal 0 = clockwise ,1 = counterclockwise
		step : in std_logic; --Step signal (pulse to advance one step)
		phase_a,phase_b,phase_c,phase_d : out std_logic --Phases A,B,C,D control signals
	);
	end component;
	
	signal s_clk : std_logic := '0';
	signal s_reset : std_logic := '0';
    	signal s_direction : std_logic;
    	signal s_step : std_logic;
   	signal s_phase_a : std_logic;
   	signal s_phase_b : std_logic;
   	signal s_phase_c : std_logic;
   	signal s_phase_d : std_logic;
 
 begin 
 	uut: stepper_motor port map (clk => s_clk, reset => s_reset,direction=> s_direction, 
 					step =>s_step,phase_a => s_phase_a, phase_b => s_phase_b, 
 					phase_c => s_phase_c, phase_d => s_phase_d);
 				
 	--generate clock 
 	clk_process : process 
 	begin
 		s_clk<='0'; wait for 5 ns;
 		s_clk<='1'; wait for 5 ns;
 	end process;


	--generate the inputs and test the outputs
	simulate_process : process
	begin
		--initialize the inputs
		s_direction <= '0';
		
		s_step <= '0'; wait for 20 ns;
		s_step <= '1'; wait for 20 ns;
		s_step <= '0'; wait for 20 ns;
		s_step <= '1'; wait for 20 ns;
		
		s_direction <= '1';
		
		s_step <= '0'; wait for 20 ns;
		s_step <= '1'; wait for 20 ns;
		s_step <= '0'; wait for 20 ns;
		s_step <= '1'; wait for 20 ns;
		wait;
	end process;

end structural;
        
        
        
        
        
        
        
        
