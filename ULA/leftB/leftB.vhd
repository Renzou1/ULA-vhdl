ENTITY leftB IS
	Port(
		leftB_INPUTA: in bit_vector (3 downto 0);
		leftB_INPUTB: in bit_vector (3 downto 0);
		leftB_S: out bit_vector (3 downto 0);
		OverflowLEFTB: out bit
	);
END leftB;

Architecture arch_leftB of leftB IS
BEGIN
	leftB_S(0) <= '0';
	leftB_S(1) <= leftB_INPUTB(0);
	leftB_S(2) <= leftB_INPUTB(1);
	leftB_S(3) <= leftB_INPUTB(2);
	OverflowLEFTB <= leftB_INPUTB(3) xor leftB_INPUTB(2);
	
END arch_leftB;