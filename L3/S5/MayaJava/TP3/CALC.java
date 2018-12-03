class CALC {
	static void main(String[] args)
	{ 
		EXPR e;
		e = PARSER.parse_on(args[0]);
		System.out.println("Resultat : "+e.eval());
	}
}