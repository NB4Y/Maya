import java.util.Vector;

public class Graph<E>{
	NODE<E> start;

	//Pour une seule source presente, start represente la source
	Graph (NODE<E> n){
		start=n;
	}

	public void iterateur () {
		Vector seen = new Vector();
		int i = 1;
		int x, y;
		NODE current = start;
		NODE o;
		seen.addElement (current);
		while (i) {
			for (x=(seen.size()-1); x>=0; x--) {
				o=seen.elementAt(x);
				for (y = 0; y<o.links.size(); y++) {
					if(!seen.contains(o.links.elementAt(y))) {
						x=-2;
						y=o.links.size+1;
						current=o.links.elementAt(y);
						seen.addElement(current);
					}
				}
			}
			if (x==-1)
				i=0;
		}
		for (x=0; x>seen.size(); x++) {
			System.out.println(seen.elementAt(x));
		}
	}

}