package sist.co.help;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class OrderHashMap {

	public OrderHashMap() {
	
	}
	
	public List<String> orderbyValue(String m_id, HashMap<String, Integer> hashfsflist){
	
		//출력
		List<String> resultlist = new ArrayList<String>();
		
		// Hashmap을 value값 기준 내림차순으로 정렬
		ValueComparator bvc =  new ValueComparator(hashfsflist);
		TreeMap<String, Integer> order_hashfsflist = new TreeMap<String, Integer>(bvc); 
	
		order_hashfsflist.putAll(hashfsflist);
	
	    for (Map.Entry<String,Integer> entry : order_hashfsflist.entrySet()) {
	        //정렬한 리스트에서 순번을 배열번호로 변경하여 원본 리스트에서 추출
	        System.out.println(entry.getKey()+" : "+hashfsflist.get(entry.getKey()));
	       
	        if(!entry.getKey().equals(m_id)){
	        	resultlist.add(entry.getKey());
	        }
	    }
	    
	    return resultlist;
	}
	
}
