ENTITY ULA IS
	PORT(
	ULAA: in bit_vector(3 downto 0);
	ULAB: in bit_vector(3 downto 0);
	Controle: in bit_vector(3 downto 0);
	
	Saida: out bit_vector(13 downto 0); --precisa passar pra 14 bits de saida depois
	V: out bit;
	Z: out bit;
	N: out bit
	
	);
END ULA;

		--	AandB = "0001",
		--AorB = "0010",
		--	AsubB = "0011",
		--	AxorB = "0100",
		--	leftA = "0101",
		--	leftB = "0110",
		--	notA = "0111",
		--	notB = "1000",
		--	SomadorBinario = "1001",
		--	AtimesB = "1010",
			--"0000" WHEN OTHERS;


architecture arch_ULA of ULA IS

Signal AandBS, AorBS, AsubBS, AxorBS, leftAS, leftBS, notAS, notBS, SumS, AtimesBS, ControleSig, SaidaSig: bit_vector (3 downto 0);
Signal overflowLEFTAS, overflowLEFTBS, overflowSomaS, overflowSubS, overflowAtimesBS: bit;

COMPONENT SomadorBinario
	port(
	A: in bit_vector (3 downto 0);
	B: in bit_vector (3 downto 0);
	S: out bit_vector (3 downto 0);
	OverflowSoma: out bit
		);
END COMPONENT;

COMPONENT AsubB IS
	port(
	subINPUTA: in bit_vector (3 downto 0);
	subINPUTB: in bit_vector (3 downto 0);
	subS: out bit_vector (3 downto 0);
	OverflowSub: out bit
		);
END COMPONENT;

COMPONENT AandB
	Port(
		andINPUTA: in bit_vector (3 downto 0);
		andINPUTB: in bit_vector (3 downto 0);
		
		andS: out bit_vector (3 downto 0)
	);
END COMPONENT;

COMPONENT AorB
	Port(
		orINPUTA: in bit_vector (3 downto 0);
		orINPUTB: in bit_vector (3 downto 0);
		
		orS: out bit_vector (3 downto 0)
	);
END COMPONENT;

COMPONENT AxorB
	Port(
		xorINPUTA: in bit_vector (3 downto 0);
		xorINPUTB: in bit_vector (3 downto 0);
		
		xorS: out bit_vector (3 downto 0)
	);

END COMPONENT;


COMPONENT leftA
	Port(
		leftA_INPUTA: in bit_vector (3 downto 0);
		lefA_INPUTB: in bit_vector (3 downto 0);
		leftA_S: out bit_vector (3 downto 0);
		OverflowLEFTA: out bit
	);
END COMPONENT;

COMPONENT leftB
	Port(
		leftB_INPUTA: in bit_vector (3 downto 0);
		leftB_INPUTB: in bit_vector (3 downto 0);
		leftB_S: out bit_vector (3 downto 0);
		OverflowLEFTB: out bit
	);
END COMPONENT;

COMPONENT notA
	Port(
		notINPUTA: in bit_vector (3 downto 0);
		notINPUTB: in bit_vector (3 downto 0);
		
		notS: out bit_vector (3 downto 0)
	);
END COMPONENT;

COMPONENT notB
	Port(
		notINPUTA: in bit_vector (3 downto 0);
		notINPUTB: in bit_vector (3 downto 0);
		
		notS: out bit_vector (3 downto 0)
	);
END COMPONENT;

COMPONENT AtimesB 
	port(
		AtimesB_INPUTA: in bit_vector (3 downto 0);
		AtimesB_INPUTB: in bit_vector (3 downto 0);
		AtimesB_S: out bit_vector (3 downto 0);
		OverflowAtimesB: out bit
		
		);
END COMPONENT;

COMPONENT multiplex
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
		
END COMPONENT;

COMPONENT multiplex2 
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
		
END COMPONENT;

BEGIN
	ControleSig <= Controle;
	
	AandB0: AandB
		port map(andINPUTA => ULAA, andINPUTB => ULAB, andS => AandBS);
	AorB0: AorB
		port map(orINPUTA => ULAA, orINPUTB => ULAB, orS => AorBS);
	AsubB0: AsubB
		port map(subINPUTA => ULAA, subINPUTB => ULAB, subS => AsubBS, overflowSub => overflowSubS);
	AxorB0: AxorB
		port map(xorINPUTA => ULAA, xorINPUTB => ULAB, xorS => AxorBS);
	leftA0: leftA
		port map(leftA_INPUTA => ULAA, lefA_INPUTB => ULAB, leftA_S => leftAS, overflowLEFTA => overflowLEFTAS);
	leftB0: leftB
		port map(leftB_INPUTA => ULAA, leftB_INPUTB => ULAB, leftB_S => leftBS, overflowLEFTB => overflowLEFTBS);
	notA0: notA
		port map(notINPUTA => ULAA, notINPUTB => ULAB, notS => notAS);
	notB0: notB
		port map(notINPUTA => ULAA, notINPUTB => ULAB, notS => notBS);
	SomadorBinario0 : SomadorBinario
		port map(A => ULAA, B => ULAB, S => sumS, OverflowSoma => OverflowSomaS);
	AtimesB0: AtimesB
	port map(AtimesB_INPUTA => ULAA, AtimesB_INPUTB => ULAB, AtimesB_S => atimesBS, OverflowAtimesB => overflowAtimesBS);
	multiplex0: multiplex
		port map(controle => ControleSig,multiplexAandB => AandBS, multiplexAorB => AorBS, multiplexAsubB => AsubBS, multiplexAxorB => AxorBS, 
		multiplexleftA => leftAS, multiplexleftB => leftBS, multiplexnotA => notAS, multiplexnotB => notBS, multiplexsomadorBinario => sumS, multiplexAtimesB => AtimesBS, multiplexS => saidaSig);

		WITH saidaSig select
			saida <=
				"11111110000001" WHEN "0000", -- 0
				"11111111001111" WHEN "0001", -- 1
				"11111110010010" WHEN "0010", -- 2
				"11111110000110" WHEN "0011", -- 3
				"11111111001100" WHEN "0100", -- 4
				"11111110100100" WHEN "0101", -- 5
				"11111110100000" WHEN "0110", -- 6
				"11111110001111" WHEN "0111", -- 7
				
				"11111100000000" WHEN "1000", -- -8
				"11111100001111" WHEN "1001", -- -7
				"11111100100000" WHEN "1010", -- -6
				"11111100100100" WHEN "1011", -- -5
				"11111101001100" WHEN "1100", -- -4
				"11111100000110" WHEN "1101", -- -3
				"11111100010010" WHEN "1110", -- -2
				"11111101001111" WHEN "1111", -- -1
				"11111101111110" WHEN OTHERS;
				
		multiplex02: multiplex2
		port map(controle => ControleSig, multiplex2AandB => '0', multiplex2AorB => '0', multiplex2AsubB => overflowSubS, multiplex2AxorB => '0', multiplex2leftA => overflowLEFTAS, multiplex2AtimesB => overflowAtimesBS,
		multiplex2leftB => overflowLEFTBS, multiplex2notA => '0', multiplex2notB => '0', multiplex2somadorBinario => overflowSomaS, multiplex2S => V); -- vendo se deu overflow
		
		with saidaSig select -- flag do zero
			Z <=
				'1' when "0000",
				'0' when OTHERS;
				
		N <= saidaSig(3); -- negativo flag
		
END arch_ULA;