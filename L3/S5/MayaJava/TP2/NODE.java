import java.util.Vector;

public class NODE <E> {
	Vector<NODE <E> > links;
	E elt;

	public NODE (E e)
	{
		links = new Vector <NODE<E>> ();
		elt = e;
	}

	public void AddL(NODE <E> n)
	{
		links.addElement (n);
	}

}