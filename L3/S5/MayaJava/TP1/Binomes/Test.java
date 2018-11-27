public class Test {
	public static void main(String[] args)
	{
		Binome b = Binome.creation(2,1,-3);
		b.calculer_racine();
		int racines = b.nb_racine();
		if (racines==1) {
			System.out.println("La racine vaut " + b.valeur_racine(1));
		}
		else if (racines==2) {
			for (int i=0; i<racines; i++) {
				System.out.println("La racine " + i + " vaut " + b.valeur_racine(i));
			}
		}
		else
			System.out.println("Erreur");
	}
}