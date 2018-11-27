public class Chien extends Mamifère{

	public Chien()
	{
		super();
	}
	
	public Chien(String nom)
	{
		super(nom);
	}
	
	public String getType()
	{
		return super.getType() + "Je suis un chien.";
	}
		

}
