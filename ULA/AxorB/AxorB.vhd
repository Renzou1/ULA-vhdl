ENTITY AxorB IS
	Port(
		xorINPUTA: in bit_vector (3 downto 0);
		xorINPUTB: in bit_vector (3 downto 0);
		
		xorS: out bit_vector (3 downto 0)
	);
END AxorB;

architecture arch_AxorB of axorB IS
BEGIN
	xorS(0) <= xorINPUTA(0) xor xorINPUTB(0);
	xorS(1) <= xorINPUTA(1) xor xorINPUTB(1);
	xorS(2) <= xorINPUTA(2) xor xorINPUTB(2);
	xorS(3) <= xorINPUTA(3) xor xorINPUTB(3);
END arch_AxorB;