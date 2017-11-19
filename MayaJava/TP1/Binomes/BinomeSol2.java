import java.lang.*;

public class BinomeSol2 extends Binome {
	private double racine[] = new double[2];

	public BinomeSol2(double pa,double pb,double pc,double pdis){
		super(pa, pb, pc, pdis);
	}
	public void calculer_racine()
	{
		racine[0] = (- b - Math.sqrt(dis)) / 2 * a;
		racine[1] = (- b + Math.sqrt(dis)) / 2 * a;
	}
	public int nb_racine()
	{return 2; }
	public double valeur_racine(int i)
	{ return (racine[i-1]); }
}