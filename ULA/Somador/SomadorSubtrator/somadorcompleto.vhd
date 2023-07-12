ENTITY somadorcompleto IS
	Port(
		a: in bit;
		b: in bit;
		c: in bit;
		
		s: out bit;
		cOUT: out bit
	);
END somadorcompleto;

ARCHITECTURE arch_somadorcompleto OF somadorcompleto IS

BEGIN

	s <= c xor a xor b;
	
	cOUT <= (a and b) or (a and c) or (b and c);
	
END arch_somadorcompleto;