public class Animal{
	
	public String nom;
	public Animal()
	{
		this.nom="";
	}
	
	public Animal(String nom)
	{
		this.nom=nom;
	}
	
	public String getType()
	{
		if (nom!="")
			return "je suis un animal de nom " + this.nom + ". ";
		else 
			return "je suis un animal. ";
	}
}
