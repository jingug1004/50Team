package sist.co.help;

import java.util.Comparator;
import java.util.Map;

public class ValueComparator implements Comparator<String> {	//hashmap value값으로 정렬하는데 필요한 class. by ay
		 
	    Map<String, Integer> base;
	     
	    public ValueComparator(Map<String, Integer> base) {
	        this.base = base;
	    }
	 
	    // Note: this comparator imposes orderings that are inconsistent with equals.    
	    public int compare(String a, String b) {
	        if (base.get(a) >= base.get(b)) { //반대로 하면 오름차순 <=
	            return -1;
	        } else {
	            return 1;
	        } // returning 0 would merge keys
	    }
}
