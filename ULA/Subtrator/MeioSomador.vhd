ENTITY MeioSomador is
	port(
		a,b: in bit;
		sum, carry: out bit
	);
END MeioSomador;

architecture arch_MeioSomador of MeioSomador is
begin
	sum <= a xor b;
	carry <= a and b;
end arch_MeioSomador;