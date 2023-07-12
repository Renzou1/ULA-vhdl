ENTITY SomadorCompleto IS
	port(
	A, B, Cin: in bit;
	Cout, Sout: out bit
		);
END SomadorCompleto;
architecture arch_SomadorCompleto OF SomadorCompleto IS
SIGNAL CarrySinal, Cout1, Cout2: bit; 
COMPONENT MeioSomador
	PORT(
		a, b: in bit;
		sum, carry: out bit
	);
END COMPONENT;

BEGIN
	MeioSomador1: MeioSomador
		port map(a => A, b => B, sum => carrySinal, carry => Cout1); 
	MeioSomador2: MeioSomador
		port map(a => carrySinal, b => Cin, sum => Sout, carry => Cout2);
		
		Cout <= Cout1 or Cout2;
END arch_SomadorCompleto;