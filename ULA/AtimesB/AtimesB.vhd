ENTITY AtimesB is
	port(
		AtimesB_INPUTA: in bit_vector (3 downto 0);
		AtimesB_INPUTB: in bit_vector (3 downto 0);
		AtimesB_S: out bit_vector (3 downto 0);
		OverflowAtimesB: out bit
		
		);
END AtimesB;

architecture arch_AtimesB of AtimesB IS

Signal sum1, sum2, sum3: bit_vector (3 downto 0);
Signal Carry: bit_vector (2 downto 0);

COMPONENT SomadorBinario
	port(
	A: in bit_vector (3 downto 0);
	B: in bit_vector (3 downto 0);
	S: out bit_vector (3 downto 0);
	OverflowSoma: out bit
		);
END COMPONENT;
BEGIN


	
	SomadorBinario0: somadorBinario
		port map(
		A(0) => AtimesB_INPUTA(0) and AtimesB_INPUTB(1), 
		A(1) => AtimesB_INPUTA(0) and AtimesB_INPUTB(2),
		A(2) => AtimesB_INPUTA(0) and AtimesB_INPUTB(3),
		A(3) => '0',
		B(0) => AtimesB_INPUTA(1) and AtimesB_INPUTB(0), 
		B(1) => AtimesB_INPUTA(1) and AtimesB_INPUTB(1),
		B(2) => AtimesB_INPUTA(1) and AtimesB_INPUTB(2),
		B(3) => AtimesB_INPUTA(1) and AtimesB_INPUTB(3),
		S(0) => sum1(0),
		S(1) => sum1(1),
		S(2) => sum1(2),
		S(3) => sum1(3),
		OverflowSoma => carry(0)
		);
	SomadorBinario1: somadorBinario
		port map(
		A(0) => sum1(1), 
		A(1) => sum1(2),
		A(2) => sum1(3),
		A(3) => carry(0),
		B(0) => AtimesB_INPUTA(2) and AtimesB_INPUTB(0), 
		B(1) => AtimesB_INPUTA(2) and AtimesB_INPUTB(1),
		B(2) => AtimesB_INPUTA(2) and AtimesB_INPUTB(2),
		B(3) => AtimesB_INPUTA(2) and AtimesB_INPUTB(3),
		S(0) => sum2(0),
		S(1) => sum2(1),
		S(2) => sum2(2),
		S(3) => sum2(3),
		overflowSoma => carry(1)
		);
	SomadorBinario2: somadorBinario
	port map(
		A(0) => sum2(1), 
		A(1) => sum2(2),
		A(2) => sum2(3),
		A(3) => carry(1),
		B(0) => AtimesB_INPUTA(3) and AtimesB_INPUTB(0), 
		B(1) => AtimesB_INPUTA(3) and AtimesB_INPUTB(1),
		B(2) => AtimesB_INPUTA(3) and AtimesB_INPUTB(2),
		B(3) => AtimesB_INPUTA(3) and AtimesB_INPUTB(3),
		S(0) => sum3(0),
		S(1) => sum3(1),
		S(2) => sum3(2),
		S(3) => sum3(3),
		overflowSoma => carry(2)
		);
		AtimesB_S(0) <= AtimesB_INPUTA(0) and AtimesB_INPUTB(0);
		AtimesB_S(1) <= sum1(0);
		AtimesB_S(2) <= sum2(0);
		AtimesB_S(3) <= sum3(0);
		
		OverflowAtimesB <=  not ( (not(AtimesB_INPUTA(3)) and not(AtimesB_INPUTA(2)) and not(AtimesB_INPUTA(1))) or 
		(not AtimesB_INPUTB(3) and not AtimesB_INPUTB(2) and not AtimesB_INPUTB(1)) or 
		((not(AtimesB_INPUTA(3)) and not (AtimesB_INPUTA(2)) and AtimesB_INPUTA(1)) and (not AtimesB_INPUTB(3) and not AtimesB_INPUTB(2) and AtimesB_INPUTB(1)) and 
		(AtimesB_INPUTA(0) xor AtimesB_INPUTB(0)) ) or 
		((not AtimesB_INPUTA(3) and not AtimesB_INPUTA(2) and AtimesB_INPUTA(1) and not AtimesB_INPUTA(0)) and 
		AtimesB_INPUTB(3) and AtimesB_INPUTB(2)) or (not AtimesB_INPUTA(3) and not AtimesB_INPUTA(2) and AtimesB_INPUTB(3) and AtimesB_INPUTB(2) and AtimesB_INPUTB(1)) or
		((not AtimesB_INPUTA(3) and AtimesB_INPUTA(2) and not AtimesB_INPUTA(1) and not AtimesB_INPUTA(0)) and AtimesB_INPUTB(3) and AtimesB_INPUTB(2) and AtimesB_INPUTB(1)) or 
		(not AtimesB_INPUTA(3) and AtimesB_INPUTB(3) and AtimesB_INPUTB(2) and AtimesB_INPUTB(1) and AtimesB_INPUTB(0)) or
		(AtimesB_INPUTB(3) and AtimesB_INPUTB(2) and AtimesB_INPUTB(1) and AtimesB_INPUTB(0) and not (AtimesB_INPUTA(3) and not AtimesB_INPUTA(2) and not AtimesB_INPUTA(1) and not AtimesB_INPUTA(0))) or ---1.X, sendo x diferente de 8
		(not AtimesB_INPUTA(3) and not AtimesB_INPUTA(2) and AtimesB_INPUTA(1) and not AtimesB_INPUTA(0) and not AtimesB_INPUTB(3) and not AtimesB_INPUTB(2) and AtimesB_INPUTB(1) and not AtimesB_INPUTB(0)) or					--2.2		
		(AtimesB_INPUTA(3) and AtimesB_INPUTA(2) and AtimesB_INPUTA(1) and ((not AtimesB_INPUTB(3) and not AtimesB_INPUTB(2)) or (AtimesB_INPUTB(3) and AtimesB_INPUTB(2) and(AtimesB_INPUTB(1) xor AtimesB_INPUTB(0))))) or
		(AtimesB_INPUTA(3) and AtimesB_INPUTA(2) and not AtimesB_INPUTA(1) and not AtimesB_INPUTA(0) and not AtimesB_INPUTB(3) and not AtimesB_INPUTB(2) and not AtimesB_INPUTB(0)) or
		(AtimesB_INPUTA(3) and AtimesB_INPUTA(2) and not AtimesB_INPUTA(1) and AtimesB_INPUTA(0) and not AtimesB_INPUTB(3) and not AtimesB_INPUTB(2) and AtimesB_INPUTB(1) and not AtimesB_INPUTB(0)) or
		(AtimesB_INPUTA(3) and AtimesB_INPUTA(2) and not AtimesB_INPUTA(1) and AtimesB_INPUTA(0) and AtimesB_INPUTB(3) and AtimesB_INPUTB(2) and AtimesB_INPUTB(1) and not AtimesB_INPUTB(0)) or
		(AtimesB_INPUTA(3) and AtimesB_INPUTA(2) and AtimesB_INPUTA(1) and AtimesB_INPUTA(0) and not (AtimesB_INPUTB(3) and not AtimesB_INPUTB(2) and not AtimesB_INPUTB(1) and not AtimesB_INPUTB(0))) or 
		(AtimesB_INPUTA(3) and AtimesB_INPUTA(2) and AtimesB_INPUTA(1) and not AtimesB_INPUTA(0) and not AtimesB_INPUTB(3) and AtimesB_INPUTB(2) and not AtimesB_INPUTB(1) and not AtimesB_INPUTB(0))	); 
		END arch_AtimesB;