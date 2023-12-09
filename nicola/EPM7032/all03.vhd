LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY all03 IS
	PORT (
		pp_d		: IN STD_LOGIC_VECTOR(7 downto 0);
		pp_autof_n	: IN STD_LOGIC;
		pp_slct_in	: IN STD_LOGIC;
		pp_init_n	: IN STD_LOGIC;
		pp_strobe_n	: IN STD_LOGIC;
		pp_busy		: OUT STD_LOGIC;
		pp_ack_n	: OUT STD_LOGIC;
		pp_pe		: OUT STD_LOGIC;
		pp_slct		: OUT STD_LOGIC;
		pp_err_n 	: OUT STD_LOGIC;
		all_d		: INOUT STD_LOGIC_VECTOR(7 downto 0);
		all_wr0		: OUT STD_LOGIC;
		all_wr2_n	: OUT STD_LOGIC;
		all_rd2_n	: OUT STD_LOGIC;
		all_reset	: OUT STD_LOGIC
	);
END all03;

ARCHITECTURE maxpld OF all03 IS
signal rd_n : STD_LOGIC;
BEGIN
	all_reset	<= not pp_init_n;
	all_wr0		<= pp_strobe_n nor pp_slct_in;
	all_wr2_n	<= pp_strobe_n or not pp_slct_in;
	rd_n		<= pp_autof_n or not pp_strobe_n;
	all_rd2_n	<= rd_n;
	all_d 		<= pp_d when rd_n = '1' else (others => 'Z');
	pp_err_n 	<= all_d(4) when pp_slct_in = '1' else all_d(0);
	pp_slct 	<= all_d(5) when pp_slct_in = '1' else all_d(1);
	pp_pe		<= all_d(6) when pp_slct_in = '1' else all_d(2);
	pp_ack_n	<= all_d(7) when pp_slct_in = '1' else all_d(3);
	pp_busy		<= '0';
END maxpld;


