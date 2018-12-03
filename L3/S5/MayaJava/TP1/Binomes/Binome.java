public class Binome {
// Donnees:
	protected double a,b,c,dis;
// Methodes
	public Binome(double pa,double pb,double pc,double pdis)
	{ a = pa; b = pb; c = pc; dis = pdis; }
	public static Binome creation(double pa,double pb,double pc)
	{ double delta;
		delta = pb * pb - 4.0 * pa * pc;
		if (delta < 0.0) {
			return new BinomeSol0(pa,pb,pc,delta);
		} else if (delta == 0.0) {
			return new BinomeSol1(pa,pb,pc,delta);
		} else {
			return new BinomeSol2(pa,pb,pc,delta);
		}
	}
		public void calculer_racine()
		{ System.out.println("Erreur si ici !"); }
		public int nb_racine()
		{ System.out.println("Erreur si ici !"); return 0; }
		public double valeur_racine(int i)
		{ System.out.println("Erreur si ici !"); return 0.0; }
}