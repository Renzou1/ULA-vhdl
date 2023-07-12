ENTITY multiplex IS
	port(
		controle: in bit_vector(3 downto 0);
		multiplexSomadorBinario: in bit_vector(3 downto 0);
		multiplexAsubB: in bit_vector(3 downto 0);
		multiplexAandB: in bit_vector(3 downto 0);
		multiplexAorB: in bit_vector(3 downto 0);
		multiplexAxorB: in bit_vector(3 downto 0);
		multiplexleftA: in bit_vector(3 downto 0);
		multiplexleftB: in bit_vector(3 downto 0);
		multiplexnotA: in bit_vector(3 downto 0);
		multiplexnotB: in bit_vector(3 downto 0);
		multiplexAtimesB: in bit_vector(3 downto 0);
		multiplexS: out bit_vector(3 downto 0)
		
		);
		
END multiplex;

architecture arch_multiplex of multiplex is

BEGIN
	WITH controle SELECT
		multiplexS <=
			multiplexAandB WHEN "0001",
			multiplexAorB WHEN "0010",
			multiplexAsubB WHEN "0011",
			multiplexAxorB WHEN "0100",
			multiplexleftA WHEN "0101",
			multiplexleftB WHEN "0110",
			multiplexnotA WHEN "0111",
			multiplexnotB WHEN "1000",
			multiplexSomadorBinario WHEN "1001",
			multiplexAtimesB WHEN "1010",
			"0000" WHEN OTHERS;
			 
END arch_multiplex;