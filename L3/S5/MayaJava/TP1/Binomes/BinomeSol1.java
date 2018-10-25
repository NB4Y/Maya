public class BinomeSol1 extends Binome {
	private double racine;

	public BinomeSol1(double pa,double pb,double pc,double pdis){
		super(pa, pb, pc, pdis);
	}
	public void calculer_racine()
	{
		racine = - b / 2 * a;
	}
	public int nb_racine()
	{return 1; }
	public double valeur_racine(int i)
	{ return (racine); }
}