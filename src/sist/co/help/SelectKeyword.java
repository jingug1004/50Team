package sist.co.help;

import sist.co.model.MemberDTO;

public class SelectKeyword {

	// 검색 keyword 중, 리스트를 뿌릴때 보여줄 keyword를 선택하는 클래스
	
	public SelectKeyword() {

	}
	
	public String SearchWord(MemberDTO memdto) {
		
		int a[] = new int[4];
		for(int i = 0; i < a.length; i++){
			a[i] = 0;
		}
		
		System.out.println("infnc: " + memdto.toString());
		
		// null이 아닌 요소 찾기
		if(!memdto.getM_name().equals("") && memdto.getM_name() != null){
			a[0]=1;
			System.out.println("-------Name");
			return "Name";
		}else if(!memdto.getM_nickname().equals("") && memdto.getM_nickname() != null){
			a[1]=1;
			System.out.println("---------Nickname");
			return "Nickname";
		}else if(!memdto.getM_phone().equals("") && memdto.getM_phone() != null){
			a[2]=1;
			System.out.println("---------Phone");
			return "Phone";
		}else if(!memdto.getM_id().equals("") && memdto.getM_id() != null){
			a[3]=1;
			System.out.println("---------Id");
			return "Id";
		}else{
			System.out.println("-------default(Nickname)");
			return "Nickname";
		}

	}
	
	
	public String SubInformation(MemberDTO memdto){		// 리스트에서 보여줄 부가적인 정보

		// null이 아닌 요소 찾기
		if(!memdto.getM_office().equals("") && memdto.getM_office() != null){
			//System.out.println("-------Office");
			return memdto.getM_office();
		}
		else if(!memdto.getM_highschool().equals("") && memdto.getM_highschool() != null){
			//System.out.println("-------Highschool");
			return memdto.getM_highschool();
		}else if(!memdto.getM_university().equals("") && memdto.getM_university() != null){
			//System.out.println("-------University");
			return memdto.getM_university();
		}else if(!memdto.getM_address().equals("") && memdto.getM_address() != null){
			//System.out.println("-------Address");
			return memdto.getM_address();
		}else{
			//System.out.println("-------default(Address)");
			return memdto.getM_address();	// default :  "" 
		}
		
		
		
	}
	
}
