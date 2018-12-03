import java.util.*;

public class TestC
{
	public static void main(String[] args)
	{
		C1 a1 = new C1();
		I a2 = new C4();
		I a3 = new C6();
		C3 a4 = new C6();
		C3 a5 = (C6) a3;
		a5 = a4;
		a2 = a3;
		C2 a6 = new C4();
		//a4 = a6;
		C4 a7 = (C4) a6;
		a6 = (C4) a2;
	}
}