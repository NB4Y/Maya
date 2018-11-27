public class unicanard extends canard
{
	int pieds = 1;
	int jambes() {return pieds;}
	public static void main(String[] args) {
		canard c = new canard();
		System.out.println(c.pieds);
		System.out.println(c.jambes());
		c = new unicanard();
		System.out.println(c.pieds);
		System.out.println(c.jambes());
		c.pieds=3;
		System.out.println(c.pieds);
		System.out.println(c.jambes());

	}
}