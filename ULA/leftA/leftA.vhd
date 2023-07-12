ENTITY leftA IS
	Port(
		leftA_INPUTA: in bit_vector (3 downto 0);
		lefA_INPUTB: in bit_vector (3 downto 0);
		leftA_S: out bit_vector (3 downto 0);
		OverflowLEFTA: out bit
	);
END leftA;

architecture arch_leftA of leftA IS
BEGIN
	leftA_S(0) <= '0';
	leftA_S(1) <= leftA_INPUTA(0);
	leftA_S(2) <= leftA_INPUTA(1);
	leftA_S(3) <= leftA_INPUTA(2);
	OverflowLEFTA <= leftA_INPUTA(3) xor leftA_INPUTA(2);
	
END arch_leftA;