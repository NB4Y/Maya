import java.util.*;

public class main { 
	public static void main(String[] args) {
		canard c = new canard();
		System.out.println(c.pieds);
		System.out.println(c.jambes());
		unicanard x  = new unicanard();
		System.out.println(x.pieds);
		System.out.println(x.jambes());
	}
	/*public static void main(String[] args) {
		canard c = new canard();
		unicanard x = (unicanard) c;
	}*/
}