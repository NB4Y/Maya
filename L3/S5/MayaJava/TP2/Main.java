public class Main {
	NODE node1 = new NODE <E>(1);
	NODE node2 = new NODE <E>(2);
	NODE node3 = new NODE (3);
	NODE node4 = new NODE (4);
	NODE node5 = new NODE (5);
	NODE node6 = new NODE (6);
	NODE node7 = new NODE (7);
	NODE node8 = new NODE (8);
	NODE node9 = new NODE (9);
	NODE node10 = new NODE (10);
	NODE node11 = new NODE (11);
	NODE node12 = new NODE (12);
	NODE node13 = new NODE (13);
	NODE node14 = new NODE (14);
	NODE node15 = new NODE (15);
	NODE node16 = new NODE (16);
	Graph graph = new Graph (node1);

	node1.AddL(node2);
	node1.AddL(node3);
	node1.AddL(node7);
	node1.AddL(node4);

	node2.AddL(node9);
	node2.AddL(node8);
	node2.AddL(node5);
	
	node3.AddL(node7);
	
	node4.AddL(node11);
	
	node5.AddL(node6);
	
	node6.AddL(node8);
	node6.AddL(node10);
	node6.AddL(node7);
	
	node7.AddL(node11);
	
	node8.AddL(node9);
	node8.AddL(node15);
	
	node9.AddL(node14);
	
	node11.AddL(node12);
	
	node12.AddL(node13);

	node13.AddL(node16);
	
	node14.AddL(node15);

	node15.AddL(node16);

	

}