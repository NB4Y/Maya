public class Peage {
	public int nbreVehicule;
	public int totalCaisse;
	public Peage(int nb, int tc)
	{nbreVehicule = nb; totalCaisse = tc;}

	public int getNbreVehicule()
	{ return nbreVehicule; }
	
	public int getTotalCaisse()
	{ return totalCaisse; }

	public void Passage (Vehicule x) {
		nbreVehicule++;
		totalCaisse+= x.calculTaxe();
	}
}