import java.util.Vector;

public class NODE <E> {
	Vector<NODE <E> > links;
	E elt;

	NODE (E e)
	{
		links = new Vector <NODE<E>> ();
		elt = e;
	}

	void add(NODE <E> n)
	{
		links.addElement (n);
	}

}