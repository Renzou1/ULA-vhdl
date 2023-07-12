ENTITY AorB IS
	Port(
		orINPUTA: in bit_vector (3 downto 0);
		orINPUTB: in bit_vector (3 downto 0);
		
		orS: out bit_vector (3 downto 0)
	);
END AorB;

architecture arch_AorB of aorB IS
BEGIN
	orS(0) <= orINPUTA(0) or orINPUTB(0);
	orS(1) <= orINPUTA(1) or orINPUTB(1);
	orS(2) <= orINPUTA(2) or orINPUTB(2);
	orS(3) <= orINPUTA(3) or orINPUTB(3);
END arch_AorB;