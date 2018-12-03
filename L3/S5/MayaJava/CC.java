import java.util.*;

public class main { 
	public int taille;
	public int lab[][]; //t'as compris

	boolean parcours (int x, int y){
		//test current
		if (lab [x] [y]==-1)
			return true;
		else if (lab [x] [y]>=1)
			return false;
		else
			lab [x] [y]=1;

		boolean up, right, down, left;
		//search
		//up
		if (y+1 =< taille) {
			up = parcours (x, y+1)
		}
		//right
		if (x+1 =< taille) {
			right = parcours (x+1, y)
		}
		//down
		if (y-1 >= 0) {
			down = parcours (x, y-1)
		}
		//left
		if (x-1 >= 0) {
			left = parcours (x-1, y)
		}

		return (up || right || down || left);
	}
}