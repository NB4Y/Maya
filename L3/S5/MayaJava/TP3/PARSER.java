class PARSER {
	private static String src;
	private static int idx;

	private static char last_char;
	private static int last_cst;

	private static boolean read_char(char c)
	{
		if ((idx < src.length()) && (src.charAt(idx) == c)) {
			idx++;
			last_char = c;
			return true;
		}
		return false;
	
	}

	private static boolean read_cst()
	{ 
		// Indication : ’4’-’0’ == 4
		// Indication : 234 == (((2*10)+3)*10)+4
		//...
	}

	private static EXPR read_e()
	{ 
		EXPR result,right;
		char op;
		result = read_e_mul();
		if (result != null) {
			while ((read_char(’+’) || (read_char(’-’)) {
				op = last_char;
				right = read_e_mul();
				if (right == null) error();
				if (op == ’+’)
				result = new ADD(result,right);
				else
				result = new SUB(result,right);
			}
		}
		return result;
	}

	//...  Indication: Une fonction par r´egle de grammaire

	private static void error()
	{ 
		int j;
		System.out.println(src);
		for (j=0;j<idx;j++) System.out.print(’ ’);
		System.out.println(’I’);
		System.exit(1);
		}

	static EXPR parse_on(String txt)
	{ 
		EXPR e;
		src = txt;
		idx = 0;
		e = read_e();
		if ((e == null) || (idx < src.length())) error();
		return e;
	}
}
