package sist.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sist.co.help.OrderHashMap;
import sist.co.help.SelectKeyword;
import sist.co.model.*;
import sist.co.service.EventService;
import sist.co.service.FriendService;
import sist.co.service.NewsFeedService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class FriendController {

	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private NewsFeedService newsFeedService;
		
	@RequestMapping(value="friendmain.do", method={RequestMethod.GET, RequestMethod.POST})
	public String friendmain(Model model) throws Exception{		
		logger.info("friendmain");
		return "friendmain.tiles";
	}
	
	/*
	 * 공동 작업자: 김명호
	 * param: eventSeq(이벤트 시퀀스)
	 */
	//(수정할거0930) : 친구SNS로 들어갔을 때, 친구 누르면 ‘친구의 친구’가 떠야함. 따라서, infrendssearch에 ‘로그인한 회원’이 아닌 ‘친구의 아이디’가 들어가야함. by ay
	@RequestMapping(value="infriendsearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public String infriendsearch(String m_id, HttpServletRequest request, Model model,
							@RequestParam (value = "eventSeq", defaultValue = "0") int eventSeq) throws Exception{		
		
		logger.info("infriendsearch");
		
		MemberDTO loginMember = (MemberDTO) request.getSession().getAttribute("login");
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		//요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외, follow친구를 포함한 리스트  + 이 친구 각각의 한마디글 뽑아오기
		List<FriendDTO> flist = friendService.getFriendsList(loginMember.getM_id());		// 해당 회원의 친구목록(요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외)
		//수정할점0908 list정렬 : collection.sort(list명) 단, list<string>.

		HashMap<String, MemberDTO> finformlist = new HashMap<String, MemberDTO>();
		
		// 명호 전용: 초대할 친구 리스트
		List<EventInviteMemberDTO> eventInviteMemberList = new ArrayList<EventInviteMemberDTO>();
		
		for(int i = 0; i < flist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(flist.get(i).getF_id());	
			finformlist.put(flist.get(i).getF_id(), memdto);		// 친구아이디를 key값으로 친구의 한마디 글 뽑아오기
			
			
			// 명호 전용: 초대할 친구 리스트 조회 & 저장
			EventInviteDTO eventInvite = new EventInviteDTO(eventSeq, flist.get(i).getF_id(), 0, null);
			EventInviteMemberDTO eventInviteMember = eventService.selectEventInviteMember(eventInvite);
			eventInviteMemberList.add(eventInviteMember);
		}
			
		model.addAttribute("flist", flist);				// 그룹 단위로 출력하기 위해서 필요함. 즉,순수하게 정렬하기 위해 필요 : (수정할점0906) 그룹별 출력, 그룹변경 할 수 있도록 버튼만들기 
		model.addAttribute("finformlist", finformlist);	// 해당 회원 모든 친구들의 정보 
		model.addAttribute("imgpath", imgpath);
		model.addAttribute("login_id", loginMember.getM_id());
		
		// 명호 전용
		if ( eventSeq > 0 ) {
			// 
			
			EventDTO event = eventService.selectEventDetail(eventSeq);
			
			HttpSession session = request.getSession();
			session.setAttribute("event", event);
			session.setAttribute("finformlist", finformlist);
			session.setAttribute("eventInviteMemberList", eventInviteMemberList);
			session.setAttribute("imgpath", imgpath);
		//	session.setMaxInactiveInterval(60*60);		// 1시간 동안 유지
			
			return "forward:/NewsFeedList2.do?link=event&eventSeq=" + eventSeq;
		}
		
		return "infriendsearch.tiles";
	}
	
	
	@RequestMapping(value="friendask.do", method={RequestMethod.GET, RequestMethod.POST})
	public String friendask(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("friendask");
		
		//m_id="qwer";	// 임시 회원 id
		m_id = ((MemberDTO)request.getSession().getAttribute("login")).getM_id();
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
				
		// 수신된 친구 요청 보기
		List<FriendDTO> ansflist = friendService.getAnsFriendsList(m_id);
		List<MemberDTO> ansflistinform = new ArrayList<MemberDTO>();
		System.out.println("ansflist.size()"+ansflist.size());
		for(int i = 0; i < ansflist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(ansflist.get(i).getM_id());	
			ansflistinform.add(memdto);
		}
		
		// 전송한 친구 요청 보기
		List<FriendDTO> askflist = friendService.getAskFriendsList(m_id);
		List<MemberDTO> askflistinform = new ArrayList<MemberDTO>();
		System.out.println("askflist.size()"+askflist.size());
		for(int i = 0; i < askflist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(askflist.get(i).getF_id());
			askflistinform.add(memdto);
		}
		
		model.addAttribute("ansflistinform", ansflistinform);
		model.addAttribute("askflistinform", askflistinform);
		model.addAttribute("imgpath", imgpath);
		model.addAttribute("login_id", m_id);
		
		return "friendask.tiles";
	}
	
	// 그룹별 관리 대메뉴(친구관리)
	// 그룹별 관리 메뉴1(가족) : 서로친구만 가족그룹으로 만들수 있음 
	@RequestMapping(value="familygroup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String familygroup(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("familygroup");
		
		//m_id="qwer";	// 임시 회원 id
		m_id = ((MemberDTO)request.getSession().getAttribute("login")).getM_id();
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
			
		List<String> familylist = friendService.getFamilyList(m_id);			// 해당 회원의 친구목록
		List<MemberDTO> familylistinform = new ArrayList<MemberDTO>();			// 친구의 인적사항
		HashMap<String, Integer> fstotalnum = new HashMap<String, Integer>();	// 친구가 맺은 총 친구 인원수 출력
		for(int i = 0; i < familylist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(familylist.get(i));
			
			fstotalnum.put(memdto.getM_id(), friendService.getFriendsTotalNumOfFriends(memdto.getM_id()));
			familylistinform.add(memdto);
			
		}
		
		model.addAttribute("familylistinform", familylistinform);
		model.addAttribute("fstotalnum", fstotalnum);
		model.addAttribute("imgpath", imgpath);
		model.addAttribute("login_id", m_id);
		
		return "familygroup.tiles";
	}
	
	// 그룹별 관리 메뉴2(친한친구) : 서로친구만 친한친구그룹으로 만들수 있음 
	@RequestMapping(value="bestgroup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bestgroup(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("bestgroup");

		//m_id="qwer";	// 임시 회원 id
		m_id = ((MemberDTO)request.getSession().getAttribute("login")).getM_id();
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		List<String> bestlist = friendService.getBestFriendsList(m_id);
		List<MemberDTO> bestlistinform = new ArrayList<MemberDTO>();
		HashMap<String, Integer> fstotalnum = new HashMap<String, Integer>();	// 친구가 맺은 총 친구 인원수 출력
		for(int i = 0; i < bestlist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(bestlist.get(i));
			fstotalnum.put(memdto.getM_id(), friendService.getFriendsTotalNumOfFriends(memdto.getM_id()));
			bestlistinform.add(memdto);
		}
		
		model.addAttribute("bestlistinform", bestlistinform);
		model.addAttribute("fstotalnum", fstotalnum);
		model.addAttribute("imgpath", imgpath);
		model.addAttribute("login_id", m_id);
		
		return "bestgroup.tiles";
	}
	
	// 그룹별 관리 메뉴3(친구) : follow친구는 무조건 아는친구(2)그룹 ===> 즉, 친한친구가 되기 위해선 반드시 서로친구가 되어야함
	@RequestMapping(value="knowgroup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Knowgroup(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("knowgroup");
		
		//m_id="qwer";	// 임시 회원 id
		m_id = ((MemberDTO)request.getSession().getAttribute("login")).getM_id();
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		List<FriendDTO> knowlist = friendService.getKnowList(m_id);		// 아는친구, follow친구 포함
		List<MemberDTO> knowlistinform = new ArrayList<MemberDTO>();
		HashMap<String, Integer> fstotalnum = new HashMap<String, Integer>();	// 친구가 맺은 총 친구 인원수 출력
		for(int i = 0; i < knowlist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(knowlist.get(i).getF_id());
			fstotalnum.put(memdto.getM_id(), friendService.getFriendsTotalNumOfFriends(memdto.getM_id()));
			knowlistinform.add(memdto);
		}
		
		model.addAttribute("knowlist", knowlist);				// follow친구, 아는친구(서로친구)구분하기 위해 넘김
		model.addAttribute("knowlistinform", knowlistinform);
		model.addAttribute("fstotalnum", fstotalnum);
		model.addAttribute("imgpath", imgpath);
		model.addAttribute("login_id", m_id);
		
		return "knowgroup.tiles";
	}
	
	// 그룹별 관리 메뉴4(차단)
	@RequestMapping(value="blockgroup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String blockgroup(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("blockgroup");
		
		//m_id="qwer";	// 임시 회원 id
		m_id = ((MemberDTO)request.getSession().getAttribute("login")).getM_id();
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		List<String> blocklist = friendService.getBlockList(m_id);
		List<MemberDTO> blocklistinform = new ArrayList<MemberDTO>();
		HashMap<String, Integer> fstotalnum = new HashMap<String, Integer>();	// 친구가 맺은 총 친구 인원수 출력
		for(int i = 0; i < blocklist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(blocklist.get(i));
			fstotalnum.put(memdto.getM_id(), friendService.getFriendsTotalNumOfFriends(memdto.getM_id()));
			blocklistinform.add(memdto);
		}
		
		model.addAttribute("blocklistinform", blocklistinform);
		model.addAttribute("fstotalnum", fstotalnum);
		model.addAttribute("imgpath", imgpath);
		model.addAttribute("login_id", m_id);
		
		return "blockgroup.tiles";
	}
	
	
	
	
	@RequestMapping(value="outfriendsearchmain.do", method={RequestMethod.GET, RequestMethod.POST})
	public String outfriendsearchmain(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("outfriendsearchmain");
		
		
		//m_id="qwer";	//임의의 m_id
		m_id = ((MemberDTO)request.getSession().getAttribute("login")).getM_id();
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		//System.out.println("imgpath" + imgpath);
		
		//1. <친구의 친구 id, 내 친구들중 몇명과 친구를 맺고있는지> 
		HashMap<String, Integer> hashfsflist = new HashMap<String, Integer>();	// 내 친구들이 많이 아는 친구일 수록 리스트 상단에 떠야하는데 이를 위한 정렬을 위해 필요한 Hashmap.
		List<FriendDTO> flist = friendService.getFriendsList(m_id);		// 해당 회원의 친구목록(요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외)
		System.out.println("flist.size():"+ flist.size());	
		
		for(int i = 0; i < flist.size(); i++){
			
			List<FriendDTO> fslist = friendService.getFriendsList(flist.get(i).getF_id());	// 내 친구의 친구리스트. 단, 나는 제외되어야함. because 알수도있는 친구에 내가 뜨면 안돼니.. 
			System.out.println(flist.get(i).getF_id()+ "의 fslist.size():"+ fslist.size());
						
			for(int j = 0; j < fslist.size(); j++){
				if(!hashfsflist.containsKey(fslist.get(j).getF_id())){
					hashfsflist.put(fslist.get(j).getF_id(), 1);
					//System.out.println("없쪙 " + fslist.get(j).getF_id());
				}else{				
					hashfsflist.put(fslist.get(j).getF_id(), hashfsflist.get(fslist.get(j).getF_id())+1);
					//System.out.println("있쪙 " + fslist.get(j).getF_id() +", " + hashfsflist.get(fslist.get(j).getF_id()));
				}
			}	
		}
		
		
		//2. '나 혹은 상대방이 친구요청 미수락' 및 '날 차단한 친구'의 경우는 검색리스트에 뜨면안됌. 따라서 hashfsflist에서 지워야함
		List<FriendDTO> ansflist = friendService.getAnsFriendsList(m_id); // 수신된 친구 요청 보기
		List<FriendDTO> askflist = friendService.getAskFriendsList(m_id); // 전송한 친구 요청 보기
		List<String> blockmeflist = friendService.blockme(m_id);		  // 날 차단한 회원은 리스트에 띄우면 안됌
		for(int i = 0; i < ansflist.size(); i++){
			hashfsflist.remove(ansflist.get(i).getM_id());
			System.out.println("삭제1 : " + ansflist.get(i).getM_id());
		}
		for(int i = 0; i < askflist.size(); i++){
			hashfsflist.remove(askflist.get(i).getF_id());
			System.out.println("삭제2 : " + askflist.get(i).getF_id());
		}
		for(int i = 0; i < blockmeflist.size(); i++){
			hashfsflist.remove(blockmeflist.get(i));
			System.out.println("삭제3 : " + askflist.get(i).getF_id());
		}		
			
		//Hashmap value로 정렬한 최종 알수도있는친구(친구의 친구) 리스트
		List<MemberDTO> fsflistinform = new ArrayList<MemberDTO>();
		
		//3. order by Hashmap's Value (DESC)
		OrderHashMap orderhashmap = new OrderHashMap();
		List<String> orderfsflist = orderhashmap.orderbyValue(m_id, hashfsflist);	//m_id로 정렬 =>(수정할점 0927)m_nickname으로 정렬해야함. 원래 리스트뿌릴때 nickname으로 뿌려주기때문
		for(int i = 0; i < orderfsflist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(orderfsflist.get(i));
			fsflistinform.add(memdto);
		}        

		model.addAttribute("fsflistinform", fsflistinform);
		model.addAttribute("login_id", m_id);	// 원래 세션에 저장된 로그인회원의 id. 세션에서 불러오지 않음. 이후에 세션에서 불러오는것으로 고쳐야함. (수정할점0919) 
		
		return "outfriendsearchmain.tiles";
	}
	
	//친구 외 검색(우측리스트)
	@RequestMapping(value="outfriendssearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public String outfriendssearch(HttpServletRequest request, String m_id, @RequestParam(value="inputname") String inputname, @RequestParam(value="inputnickname") String inputnickname,
							@RequestParam(value="inputphone") String inputphone, @RequestParam(value="inputemail") String inputemail, 
							@RequestParam(value="inputaddress") String inputaddress, @RequestParam(value="inputhighschool") String inputhighschool, 
							@RequestParam(value="inputuniversity") String inputuniversity, @RequestParam(value="inputoffice") String inputoffice, 
							Model model) throws Exception{
		
		logger.info("outfriendssearch");
		
		//m_id="qwer";	// 임시 회원 id
		m_id = ((MemberDTO)request.getSession().getAttribute("login")).getM_id();
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		//System.out.println("imgpath" + imgpath);
		
		// 1. 모르는 친구 
		MemberDTO memdto = new MemberDTO();
		memdto.setM_name(inputname);
		memdto.setM_nickname(inputnickname);
		memdto.setM_phone(inputphone);
		memdto.setM_id(inputemail);			// because of id==email.
		memdto.setM_address(inputaddress);
		memdto.setM_highschool(inputhighschool);
		memdto.setM_university(inputuniversity);
		memdto.setM_office(inputoffice);
		
		System.out.println(memdto.toString());
		
		//검색 keyword 선택  방법(1)controller에서 판별, 방법(2)view-javascript에서 판별
		SelectKeyword selw = new SelectKeyword();
		model.addAttribute("choosekeyword", selw.SearchWord(memdto));
		
		List<MemberDTO> searchflist = friendService.searchsomeone(memdto);	// 최종 검색 결과 (모르는 친구)
	
		System.out.println(searchflist.size());
		 
		// 2. 알수도 있는 친구 
		//<친구의 친구 id, 내 친구들중 몇명과 친구를 맺고있는지> 
		HashMap<String, Integer> hashfsflist = new HashMap<String, Integer>();	// 내 친구들이 많이 아는 친구일 수록 리스트 상단에 떠야하는데 이를 위한 정렬을 위해 필요한 Hashmap.
		List<FriendDTO> flist = friendService.getFriendsList(m_id);		// 해당 회원의 친구목록(요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외)
		System.out.println("flist.size():"+ flist.size());
		
		for(int i = 0; i < flist.size(); i++){
			
			List<FriendDTO> fslist = friendService.getFriendsList(flist.get(i).getF_id());	// 내 친구의 친구리스트. 단, 나는 제외되어야함. because 알수도있는 친구에 내가 뜨면 안돼니.. 
			System.out.println(flist.get(i).getF_id()+ "의 fslist.size():"+ fslist.size());
			
			for(int j = 0; j < fslist.size(); j++){
				if(!hashfsflist.containsKey(fslist.get(j).getF_id())){
					hashfsflist.put(fslist.get(j).getF_id(), 1);
					//System.out.println("없음 " + fslist.get(j).getF_id());
				}else{				
					hashfsflist.put(fslist.get(j).getF_id(), hashfsflist.get(fslist.get(j).getF_id())+1);
					//System.out.println("있음 " + fslist.get(j).getF_id() +", " + hashfsflist.get(fslist.get(j).getF_id()));
				}
			}	
		}
			
		
		//3. '나 혹은 상대방이 친구요청 미수락' 및 '날 차단한 친구'의 경우, '모르는 친구'로 검색된 사람의 친구요청받는범위가 '친구의친구'일경우 는 검색리스트에 뜨면안됌. 따라서 hashfsflist에서 지워야함
		List<FriendDTO> ansflist = friendService.getAnsFriendsList(m_id); // 수신된 친구 요청 보기
		List<FriendDTO> askflist = friendService.getAskFriendsList(m_id); // 전송한 친구 요청 보기
		List<String> blockmeflist = friendService.blockme(m_id);		  // 날 차단한 회원은 리스트에 띄우면 안됌
		for(int i = 0; i < ansflist.size(); i++){
			hashfsflist.remove(ansflist.get(i).getM_id());
			for(int j = 0; j < searchflist.size(); j++){
				if(searchflist.get(j).getM_id().equals(ansflist.get(i).getM_id()))
					searchflist.remove(j);	
			}
			System.out.println("삭제1 : " + ansflist.get(i).getM_id());
		}
		for(int i = 0; i < askflist.size(); i++){
			hashfsflist.remove(askflist.get(i).getF_id());
			for(int j = 0; j < searchflist.size(); j++){
				if(searchflist.get(j).getM_id().equals(askflist.get(i).getF_id()))
					searchflist.remove(j);	
			}
			System.out.println("삭제2 : " + askflist.get(i).getF_id());
		}
		for(int i = 0; i < blockmeflist.size(); i++){
			hashfsflist.remove(blockmeflist.get(i));
			for(int j = 0; j < searchflist.size(); j++){
				if(searchflist.get(j).getM_id().equals(blockmeflist.get(i)))
					searchflist.remove(j);	
			}
			System.out.println("삭제3 : " + blockmeflist.get(i));
		}
		for(int i = 0; i < searchflist.size(); i++){	// '모르는 친구'로 검색된 사람의 친구요청받는범위가 '친구의친구'일경우 삭제. (왜냐하면, 해당 회원의 친구요청받는 범위가 "친구의친구"일 경우, 이미 알수도있는 친구에 있을 테니) 
			if(searchflist.get(i).getM_ask() == 1){
				System.out.println("삭제4 : " + searchflist.get(i).getM_id());
				searchflist.remove(i);
			}
		}
		
		
		
		//Hashmap value로 정렬한 최종 알수도있는친구(친구의 친구) 리스트
		List<MemberDTO> fsflistinform = new ArrayList<MemberDTO>();			// 최종 검색 결과 (알수도 있는 친구)
		
		//order by Hashmap's Value (DESC)
		OrderHashMap orderhashmap = new OrderHashMap();
		List<String> orderfsflist = orderhashmap.orderbyValue(m_id, hashfsflist);
		for(int i = 0; i < orderfsflist.size(); i++){
			MemberDTO memdtotmp = friendService.getFriendsInformation(orderfsflist.get(i));
			//System.out.println("memdtotmp: " + memdtotmp.getM_id());
			fsflistinform.add(memdtotmp);
		}   

		
		// 4. 모르는 친구 와 알수도있는친구(친구의친구) 검색결과에서 (1) 중복되는 친구는 모르는 친구 검색결과 리스트에서 삭제. (2) 알수도있는 친구리스트에선 중복된 친구만 따로 리스트에 저장
		List<MemberDTO> fssearchflist = new ArrayList<MemberDTO>();	// 알수도있는 친구리스트에선 중복된 친구 저장하는 리스트-(2)번처리관련 
		  		
		//(1) 중복되는 친구는 모르는 친구 검색결과 리스트에서 삭제.
		for(int j = 0; j < fsflistinform.size(); j++){
			for(int i = 0; i < searchflist.size(); i++){
				//System.out.println(searchflist.get(i).getM_id());
				if(fsflistinform.get(j).getM_id().equals(searchflist.get(i).getM_id())){
					//System.out.println("지운당 " + searchflist.get(i).getM_id());
					searchflist.remove(i);							// 단순히 삭제하면 index가 삭제되면 자동으로 index가 다시 재넘버링되어 체크 안하게 되는 index가 생기게 됨. 
					fssearchflist.add(fsflistinform.get(j));		// (2) 알수도있는 친구리스트에선 중복된 친구만 따로 리스트에 저장 
				}
			}
		}
		
		// 5. 원래 내 친구들은 '친구외 검색'에서 '검색된친구'에 뜨면안됌. 따라서 리스트에서 삭제해준다.
		//flist : 요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외, follow친구를 포함한 리스트
		for(int i = 0; i < flist.size(); i++){
			for(int j = 0; j < searchflist.size(); j++){
				if(flist.get(i).getF_id().equals(searchflist.get(j).getM_id())){
					searchflist.remove(j);
				}
			}
		}
		
		
		model.addAttribute("fssearchflist", fssearchflist);
		model.addAttribute("searchflist", searchflist);
		model.addAttribute("login_id", m_id);	
		
		return "outfriendssearch.tiles";
	}
	
	@RequestMapping(value="befriends.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String befriends(@RequestParam(value = "m_id", required = false) String m_id,
							@RequestParam(value = "f_id", required = false) String f_id) throws Exception{
		
		logger.info("befriends");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		System.out.println("m_id : "+m_id+", f_id : "+f_id);
		
		boolean isS = false;
		
		//상대방이 날 차단했는지 확인
		String isI_blockme = friendService.youblockme(friendDTO);	// 차단 : 1, 차단x : 0	
		System.out.println("isI_blockme : " + isI_blockme);
		
		// 기존 데이터 있을 경우, update, 없으면 insert
		int isI = 0;
		isI = friendService.confirmdata(friendDTO);		
		System.out.println("isI : " + isI);
		
		try{
			if(isI_blockme == null || "0".equals(isI_blockme)){
				if(isI > 0)	friendService.befriendupate(friendDTO);	//update
				else		friendService.befriend(friendDTO);		//insert
				isS = true;
			}
		}catch (Exception e) {
			e.getMessage();
		}
		
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping(value="accept.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String accept(@RequestParam(value = "m_id", required = false) String m_id, 
						 @RequestParam(value = "f_id", required = false) String f_id) throws Exception{
		
		logger.info("accept");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;

		try{
			friendService.accept(friendDTO);
			isS = true;
		}catch (Exception e) {
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping(value="refuse.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String refuse(@RequestParam(value = "m_id", required = false) String m_id, 
						 @RequestParam(value = "f_id", required = false) String f_id){
		
		logger.info("refuse");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		try{
			friendService.refuse(friendDTO);
			isS = true;
			System.out.println("isS : " + isS);
		}catch (Exception e) {
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
	}
	
	
	@RequestMapping(value="cancle.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String cancle(@RequestParam(value="m_id", required=false) String m_id, 
						 @RequestParam(value="f_id", required=false) String f_id){
		
		logger.info("cancle");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		try{
			friendService.cancle(friendDTO);
			isS = true;
		}catch(Exception e){
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
	}

	
	@RequestMapping(value="stranger.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String stranger(@RequestParam(value="m_id", required=false) String m_id, 
						 @RequestParam(value="f_id", required=false) String f_id){
	

		logger.info("stranger");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		try{
			friendService.stranger(friendDTO);
			isS = true;
		}catch(Exception e){
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping(value="block.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String block(@RequestParam(value="m_id", required=false) String m_id, 
						 @RequestParam(value="f_id", required=false) String f_id) throws Exception{
	

		logger.info("block");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		int isI = 0;
		isI = friendService.confirmdata(friendDTO);		// 기존 데이터 있을 경우, update, 없으면 insert
		System.out.println("isI : " + isI);
		
		
		try{
			if(isI > 0) friendService.blockupdate(friendDTO);	//update
			else 		friendService.block(friendDTO);			//insert
			isS = true;
		}catch(Exception e){
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
		
	}
	
	@RequestMapping(value="changegroup.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String block(@RequestParam(value="m_id", required=false) String m_id, 
						 @RequestParam(value="f_id", required=false) String f_id,
						 @RequestParam(value="f_group", required=false) String f_group){
	
		logger.info("changegroup");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		friendDTO.setF_group(Integer.parseInt(f_group));
		
		boolean isS = false;
		
		try{
			friendService.changegroup(friendDTO);
			isS = true;
		}catch(Exception e){
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
		
	}
	
	
	
	@RequestMapping(value="infriendssomeone.do", method={RequestMethod.GET, RequestMethod.POST})
	public String infriendssearch(HttpServletRequest request, Model model, String m_id, @RequestParam(value="insearchname") String insearchname) throws Exception{
	
		logger.info("infriendssomeone");
		System.out.println("insearchname : " + insearchname);
		System.out.println("m_id : " + m_id);
		
		m_id = "qwer"; 	//임의 
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		 
		//요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외, follow친구를 포함한 리스트  + 이 친구 각각의 한마디글 뽑아오기
		List<FriendDTO> flist = friendService.getFriendsList(m_id);		// 해당 회원의 친구목록(요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외)
		//수정할점0908 list정렬 : collection.sort(list명) 단, list<string>.

		HashMap<String, MemberDTO> finformlist = new HashMap<String, MemberDTO>();
		for(int i = 0; i < flist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(flist.get(i).getF_id());
			if(memdto.getM_name().toUpperCase().equals(insearchname.toUpperCase())
					|| memdto.getM_name().toUpperCase().contains(insearchname.toUpperCase())){	//대소문자 구분x. 정확하게 매치 + 일부문자열포함된 친구만 출력
				finformlist.put(flist.get(i).getF_id(), memdto);		// 친구아이디를 key값으로 친구의 한마디 글 뽑아오기
			}
		}
			
		model.addAttribute("flist", flist);				// 그룹 단위로 출력하기 위해서 필요함. 즉,순수하게 정렬하기 위해 필요 : (수정할점0906) 그룹별 출력, 그룹변경 할 수 있도록 버튼만들기 
		model.addAttribute("finformlist", finformlist);	// 해당 회원 모든 친구들의 정보 
		model.addAttribute("imgpath", imgpath);
		model.addAttribute("login_id", m_id);
		
		
		return "infriendssomeone.tiles";
	}

}
