public class Homme extends Mamifère{

	public Homme()
	{
		super();
	}
	
	public Homme(String nom)
	{
		super(nom);
	}
	
	public String getType()
	{
		return super.getType() + "Je suis un homme.";
	}
		

}

