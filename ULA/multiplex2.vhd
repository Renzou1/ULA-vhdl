ENTITY multiplex2 IS
	port(
		controle: in bit_vector (3 downto 0);
		multiplex2SomadorBinario: in bit;
		multiplex2AsubB: in bit;
		multiplex2AandB: in bit;
		multiplex2AorB: in bit;
		multiplex2AxorB: in bit;
		multiplex2leftA: in bit;
		multiplex2leftB: in bit;
		multiplex2notA: in bit;
		multiplex2notB: in bit;
		multiplex2AtimesB: in bit;
		multiplex2S: out bit
		
		);
		
END multiplex2;

architecture arch_multiplex2 of multiplex2 is

BEGIN
	WITH controle SELECT
		multiplex2S <=
			multiplex2AandB WHEN "0001",
			multiplex2AorB WHEN "0010",
			multiplex2AsubB WHEN "0011",
			multiplex2AxorB WHEN "0100",
			multiplex2leftA WHEN "0101",
			multiplex2leftB WHEN "0110",
			multiplex2notA WHEN "0111",
			multiplex2notB WHEN "1000",
			multiplex2SomadorBinario WHEN "1001",
			multiplex2AtimesB WHEN "1010",
			'0' WHEN OTHERS;
			 
END arch_multiplex2;