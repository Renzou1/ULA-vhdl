ENTITY AandB IS
	Port(
		andINPUTA: in bit_vector (3 downto 0);
		andINPUTB: in bit_vector (3 downto 0);
		
		andS: out bit_vector (3 downto 0)
	);
END AandB;

architecture arch_AandB of aandB IS
BEGIN
	andS(0) <= andINPUTA(0) and andINPUTB(0);
	andS(1) <= andINPUTA(1) and andINPUTB(1);
	andS(2) <= andINPUTA(2) and andINPUTB(2);
	andS(3) <= andINPUTA(3) and andINPUTB(3);
END arch_AandB;