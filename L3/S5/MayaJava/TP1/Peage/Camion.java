public class Camion extends Vehicule{
	private int nbreEssieu;
	private int poidsTotal;
	public Camion(int nb, int pt)
	{ nbreEssieu=nb; poidsTotal=pt; }

	public int getNbreEssieu()
	{ return nbreEssieu; }
	
	public int getPoidsTotal()
	{ return poidsTotal; }
	
	public int calculTaxe()
	{ return (super.calculTaxe() + nbreEssieu * 7 + 15 * poidsTotal);}
}