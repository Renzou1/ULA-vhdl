ENTITY notA IS
	Port(
		notINPUTA: in bit_vector (3 downto 0);
		notINPUTB: in bit_vector (3 downto 0);
		
		notS: out bit_vector (3 downto 0)
	);
END notA;

architecture arch_notA of notA IS
BEGIN
	notS(0) <= not notINPUTA(0);
	notS(1) <= not notINPUTA(1);
	notS(2) <= not notINPUTA(2);
	notS(3) <= not notINPUTA(3);
END arch_notA;