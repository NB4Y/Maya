public class Mammifere extends Animal{

	public Mammifere()
	{
		super();
	}
	
	public Mammifere(String nom)
	{
		super(nom);
	}
	
	public String getType()
	{
		return super.getType() + "Je suis un mammifere. ";
	}
		

}
