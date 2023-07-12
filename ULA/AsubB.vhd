ENTITY AsubB IS
	port(
	subINPUTA: in bit_vector (3 downto 0);
	subINPUTB: in bit_vector (3 downto 0);
	subS: out bit_vector (3 downto 0);
	OverflowSub: out bit
		);
END AsubB;

architecture arch_AsubB OF AsubB IS

SIGNAL cFIO, cFIO1, cFIO2, cFIO3, Cout1, Cout2: bit; 


COMPONENT SomadorCompleto
	port(
	A, B, Cin: in bit;
	Cout, Sout: out bit
		);
END COMPONENT;

BEGIN
	
	SomadorCompleto0: SomadorCompleto
	port map(a => subINPUTA(0), b => subINPUTB(0) xor '1', Cin => '1', Sout => subS(0), Cout => cFIO);
	SomadorCompleto1: SomadorCompleto
		port map(a => subINPUTA(1), b => subINPUTB(1) xor '1', Cin => cFIO, Sout => subS(1), Cout => cFIO1);
	SomadorCompleto2: SomadorCompleto
		port map(a => subINPUTA(2), b => subINPUTB(2) xor '1', Cin => cFIO1, Sout => subS(2), Cout => cFIO2);
	SomadorCompleto3: SomadorCompleto
		port map(a => subINPUTA(3), b => subINPUTB(3) xor '1', Cin => cFIO2, Sout => subS(3), Cout => cFIO3);
		
	OverflowSub <= (cFIO2 xor cFIO3);

END arch_AsubB;