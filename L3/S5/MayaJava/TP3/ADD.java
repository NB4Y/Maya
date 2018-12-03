class ADD extends EXPR_BINARY {
	ADD(EXPR l,EXPR r) { 
		//... 
	}
	
	int eval(){ 
		return left.eval() + right.eval();
		}
}
