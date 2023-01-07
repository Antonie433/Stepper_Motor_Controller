# Stepper_Motor_Controller
VHDL code for Stepper Motor Controller design circuits .

Here is a simple VHDL code for a stepper motor controller that generates the control signals for a four-phase stepper motor. The control signals are
generated based on the current state and next state of the stepper motor and the desired direction of rotation. The code includes a state machine that
advances the current state and next step of the stepper motor based on the control signals to the control signals.

A testbech file test and simulate the stepper_motor entity to make sure it works good, and show diffent states of motor.
This testbench generates a clock signal and uses a process to define a test case by sending values to the stepper motor controller inputs (direction and step). Wecuse the outputs (phase_a, phase_b, phase_c, phase_d) to verify that the behavior of the controller is correct.
