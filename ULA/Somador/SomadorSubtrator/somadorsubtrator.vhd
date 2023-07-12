ENTITY somadorsubtrator IS
	Port(
	A: in bit_vector (3 downto 0);
	B: in bit_vector(3 downto 0);
	cIN: in bit;
	
	Overflow: out bit;
	S: out bit_vector(3 downto 0)
	
	);
END somadorsubtrator;

architecture arch_somadorsubtrator OF somadorsubtrator IS

SIGNAL cFIO: bit_vector (3 downto 0); 


COMPONENT somadorcompleto
	PORT (
		a, b, c: in bit;
		s, cOUT: out bit
	);
	
END COMPONENT;

BEGIN
	somadorcompleto0: somadorcompleto
	port map(a => A(0), b => B(0) xor cIN, c => cIN, s => S(0), cOUT => cFIO(0));
	somadorcompleto1: somadorcompleto
	port map(a => A(1), b => B(1) xor cIN, c => cFIO(0), s => S(1), cOUT => cFIO(1));
	somadorcompleto2: somadorcompleto
	port map(a => A(2), b => B(2) xor cIN, c => cFIO(1), s => S(2), cOUT => cFIO(2));
	somadorcompleto3: somadorcompleto
	port map(a => A(3), b => B(3) xor cIN, c => cFIO(2), s => S(3), cOUT => cFIO(3));
	

	
	overflow <=(    (cIN and (cFIO(2) xor cFIO(3))) or ((not cIN) and (not B(3)) and((A(2) and B(2)) or ((A(2) or B(2)) and cFIO(1))))   );

	
END arch_somadorsubtrator;
	