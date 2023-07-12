ENTITY SomadorBinario IS
	port(
	A: in bit_vector (3 downto 0);
	B: in bit_vector (3 downto 0);
	S: out bit_vector (3 downto 0);
	OverflowSoma: out bit
		);
END SomadorBinario;

architecture arch_SomadorBinario OF SomadorBinario IS

SIGNAL cFIO, cFIO1, cFIO2, cFIO3, Cout1, Cout2: bit; 

COMPONENT MeioSomador
	PORT(
		a, b: in bit;
		sum, carry: out bit
	);
END COMPONENT;

COMPONENT SomadorCompleto
	port(
	A, B, Cin: in bit;
	Cout, Sout: out bit
		);
END COMPONENT;

BEGIN
	MeioSomador1: MeioSomador
		port map(a => A(0), b => B(0), sum => S(0), carry => cFIO); 
	SomadorCompleto1: SomadorCompleto
		port map(a => A(1), b => B(1), Cin => cFIO, Sout => S(1), Cout => cFIO1);
	SomadorCompleto2: SomadorCompleto
		port map(a => A(2), b => B(2), Cin => cFIO1, Sout => S(2), Cout => cFIO2);
	SomadorCompleto3: SomadorCompleto
		port map(a => A(3), b => B(3), Cin => cFIO2, Sout => S(3), Cout => cFIO3);
		
	OverflowSoma <= cFIO2 xor cFIO3;
END arch_SomadorBinario;