package sist.co.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sist.co.util.FUpUtil;
import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;
import sist.co.model.GroupPhotoDTO;
import sist.co.model.GroupRequestDTO;
import sist.co.model.MemberDTO;
import sist.co.model.NewsFeedDTO;
import sist.co.model.VoteDTO;
import sist.co.model.VotelistDTO;
import sist.co.model.VoterDTO;
import sist.co.service.GroupService;
import sist.co.service.NewsFeedService;

@Controller
public class GroupController {

	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
		
	@Autowired
	private GroupService groupService;
	private MemberDTO memDTO;
	
	// 그룹 만들기
	@RequestMapping(value = "group_make.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_make(Model model, GroupMakeDTO group) throws Exception {
	/*	logger.info(" group_make " + new Date());*/
		// 그룹 만들기
		groupService.group_make(group);
		System.out.println("1");
		// 만든 그룹으로 가기 위해 작성
		System.out.println(group.toString());
		GroupMakeDTO Mdto = groupService.select_make_group(group);
		System.out.println("2");
		// 그룹에 멤버 넣기
		GroupMemberDTO member = new GroupMemberDTO();
		System.out.println("3");
		member.setM_id(Mdto.getG_manager());
		member.setG_seq(Mdto.getG_seq());
		member.setG_auth(3);
		System.out.println(" 맴버 "+member.toString());
		groupService.add_group_manager(member);
		// 멤버 들어가는 것 확인
		System.out.println("3.5");
		model.addAttribute("Mdto", Mdto);
		System.out.println("4");
		return "redirect:/group_detail.do?g_seq="+Mdto.getG_seq();
	}
	// 그룹 리스트 출력
	@RequestMapping(value = "group_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_list(Model model, GroupListDTO gdto, String category) throws Exception {
	/*	logger.info(" group_list " + new Date());*/
		
		if (category.equals("membership")) {
			
			List<GroupListDTO> g_list = new ArrayList<GroupListDTO>();
			
			g_list = groupService.group_list(gdto);

			model.addAttribute("g_list", g_list);

			return "group_list.tiles";
		}else if (category.equals("top")) {
			
			List<GroupMakeDTO> re_list = new ArrayList<GroupMakeDTO>();
			re_list = groupService.recommend_group_list(gdto);

			model.addAttribute("re_list", re_list);
			
			model.addAttribute("s_num", gdto.getS_num());
			model.addAttribute("l_num", gdto.getL_num());

			return "recommend_group_list.tiles";
		}else if (category.equals("local")) {
			/*logger.info("들어옴" + new Date());*/
		
			return "local_group_list.tiles";
		}else {

			return "recommend_group_list.tiles";
		}
		
	}
	@RequestMapping(value = "list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model, GroupListDTO gdto, String category,HttpServletRequest request) throws Exception {
	/*	logger.info("list " + new Date());*/
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		gdto.setM_id(memDTO.getM_id());
		List<GroupMakeDTO> re_list = new ArrayList<GroupMakeDTO>();
		re_list = groupService.recommend_group_list(gdto);
	
		model.addAttribute("re_list", re_list);
		return "list_table.tiles";
		
	}
	
	
	@RequestMapping(value = "group_detail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		/*logger.info(" group_detail " + new Date());*/
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		
		List<GroupPhotoDTO> g_n_list = groupService.group_newsfeed_list(gmake);
		
		
		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}
		
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		model.addAttribute("g_n_list", g_n_list);
		
		return "group_detail.tiles";
	}

	// 여기부터  멤버
	
	@RequestMapping(value = "group_detail_member.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_member(Model model, GroupMakeDTO gmake, int type,HttpServletRequest request) throws Exception {
		/*logger.info(" group_detail_member " + new Date());*/
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
	/*	logger.info("메이크 " + gmake.toString());*/
		
		List<GroupMemberListDTO> g_m_list = groupService.group_mem_list(gmake);
	
	/*	for (int i = 0; i < g_m_list.size(); i++) {
			System.out.println("멤버리스트"+g_m_list.toString());
		}*/
		model.addAttribute("g_m_list", g_m_list);
		
		List<GroupMemberListDTO> g_m_a_list = groupService.group_mem_admin_list(gmake);
		model.addAttribute("g_m_a_list", g_m_a_list);
		
		List<GroupMemberListDTO> g_m_r_list = groupService.group_mem_reply_list(gmake);
		model.addAttribute("g_m_r_list", g_m_r_list);
		
		List<GroupMemberListDTO> g_m_b_list = groupService.group_mem_block_list(gmake);
		model.addAttribute("g_m_b_list", g_m_b_list);
		
		if (type == 1) {
			return "group_detail_member.tiles";
		}else if (type == 2) {
			return "group_detail_member_admin.tiles";
		}else {
			return "group_detail_member_block.tiles";
		}
	}
	

	// 여기까지 멤버

	@RequestMapping(value = "group_detail_event.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_event(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		/*logger.info(" group_detail_event " + new Date());*/
	
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail_event.tiles";
	}

	// 여기부터 사진
	@RequestMapping(value = "group_detail_photo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_photo(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
	/*	logger.info(" group_detail_photo " + new Date());*/
		
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupPhotoDTO> g_photolist = groupService.group_photo(gmake);
		model.addAttribute("g_make", g_make);
		model.addAttribute("g_photolist", g_photolist);
		
		
		
		return "group_detail_photo.tiles";
	}
	
	@RequestMapping(value = "group_detail_photo_video.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_photo_video(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
	/*	logger.info(" group_detail_photo_video " + new Date());*/

		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupPhotoDTO> g_videolist = groupService.group_video(gmake);
		model.addAttribute("g_make", g_make);
		model.addAttribute("g_videolist", g_videolist);
		
		return "group_detail_photo_video.tiles";
	}
	// 여기까지 사진
	// 파일
	@RequestMapping(value="group_detail_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_flie(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		/*logger.info(" group_detail_flie " + new Date());*/

		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupPhotoDTO> g_flist = groupService.filelist(gmake);
		model.addAttribute("g_make", g_make);
		model.addAttribute("g_flist", g_flist);
		
		
		return "group_detail_flie.tiles";
	}
	@RequestMapping(value="group_detail_upload_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_upload_flie(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
	/*	logger.info(" group_detail_upload_flie " + new Date());*/

		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		gmake.setG_manager(memDTO.getM_id());
		List<GroupPhotoDTO> g_flist = groupService.upfilelist(gmake);
		model.addAttribute("g_flist", g_flist);
		
		return "group_detail_upload_flie.tiles";
	}
	@RequestMapping(value="group_detail_share_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_share_flie(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		/*logger.info(" group_detail_share_flie " + new Date());*/

		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail_share_flie.tiles";
	}
	//그룹 사진 등록
	
	@RequestMapping(value="group_main_image.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_main_image(Model model,GroupMakeDTO gmake,HttpServletRequest request,@RequestParam(value="fileload",required=false)
    MultipartFile fileload ) throws Exception {
		/*logger.info("group_main_image 메인이미지 " + new Date());*/
	
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		 gmake.setG_photo(fileload.getOriginalFilename());
		 String fupload= request.getServletContext().getRealPath("/upload");

		   String f = gmake.getG_photo();
	       String newFile = FUpUtil.getNewFile(f);
	   /*    logger.info(fupload+"/"+newFile);*/
	       
	       gmake.setG_photo(newFile);
		
	       try{
	    	   File file = new File(fupload+"/"+newFile);
	    	   FileUtils.writeByteArrayToFile(file, fileload.getBytes());
	    	   
	    	   groupService.groupimageUpload(gmake);
	    	   
	   /* 	   logger.info("pdsupload success");*/
	        }catch(IOException e){
	        	  /* logger.info("pdsupload fail!");*/
	        }
	        return "redirect:/group_detail.do?g_seq="+gmake.getG_seq();
		
	}
	

	@RequestMapping(value="make_vote.do", method= { RequestMethod.GET, RequestMethod.POST })
	public String make_vote(Model model,VoteDTO vote)throws Exception{
	/*	logger.info("투표!!!!!!!!!!!하기싫어!!!!!!!!!!!!!!!!아!!!!!!!!!앜!!!");*/
		
		
		vote.setN_content(vote.getQ_content());
		if (vote.getVote3() == null) {
			vote.setVote3("");
		}
		if (vote.getVote4() == null) {
			vote.setVote4("");
		}
		if (vote.getVote5() == null) {
			vote.setVote5("");
		}
		if (vote.getVote6() == null) {
			vote.setVote6("");
		}
		if (vote.getVote7() == null) {
			vote.setVote7("");
		}
		if (vote.getVote8() == null) {
			vote.setVote8("");
		}
		if (vote.getVote9() == null) {
			vote.setVote9("");
		}
		if (vote.getVote10() == null) {
			vote.setVote10("");
		}
		groupService.make_vote(vote);
		
		VoteDTO vdto = groupService.select_make_vote(vote);
		//
		VotelistDTO vlistdto;
		if (!vote.getVote1().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote1());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote2().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote2());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote3().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote3());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote4().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote4());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote5().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote5());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote6().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote6());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote7().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote7());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote8().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote8());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote9().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote9());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote10().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote10());
			groupService.add_vote(vlistdto);
		}
	//여기서 던진다
		
	/*	logger.info("시퀀스  " + vdto.toString());*/
		groupService.add_newsfeed(vdto);
	 return "redirect:/group_detail.do?g_seq="+vote.getG_seq();
	}
	//파일 다운로드
    @RequestMapping(value="fileDownload.do",method={RequestMethod.GET, RequestMethod.POST})
	public String download(HttpServletRequest request, String filename, Model model) throws Exception{
/*		logger.info("그룹 fileDownload " + new Date());*/
		
		String fupload = request.getServletContext().getRealPath("/upload");
		// String fupload = "c:\\upload\\";		// 폴더
		
		File downloadFile = new File(fupload + "/" + filename);
		
		model.addAttribute("downloadFile", downloadFile);
		
		return "downloadView";
	}
	// 가입요청
    @RequestMapping(value="group_join_request.do",method={RequestMethod.GET,RequestMethod.POST })
	@ResponseBody
    public String group_join_request(Model model, GroupRequestDTO rdto)throws Exception{
    	/*logger.info("group_join_request 입니다 : " + rdto.toString());*/
    
    	 List<GroupMemberDTO> gdto = groupService.join_search(rdto);
    	/*
    	 logger.info("사이즈? "+gdto.size());*/
    	
    	if (gdto.size() == 0) {
    	/*	logger.info("가입되어있지않음..");*/
    		List<GroupRequestDTO> r_list = groupService.join_requset_search(rdto);
    	/*	logger.info("요청한 사이즈? "+r_list.size());*/
    		if (r_list.size() == 0) {
    		/*	logger.info("신청중..");*/
        		groupService.group_join_request(rdto);
        	/*	logger.info("신청함");*/
        		return  "sucess";
			} else {
			/*	logger.info("신청목록 확인됨");*/
				return  "already";
			}
		} else {
	  /*  	logger.info("이미 요청");*/
	    	return  "fail";
		}
    	
    }
    
	@RequestMapping(value = "group_detail_request.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_request(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
	/*	logger.info(" group_detail_request " + new Date());*/
	
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupRequestDTO> requset_list = groupService.requset_list(gmake);
	/*	logger.info("요청 사이즈"+requset_list.size());*/
/*		
		for (int i = 0; i < requset_list.size(); i++) {
			logger.info("요청 사이즈"+requset_list.toString());
		}
		*/
		model.addAttribute("g_make", g_make);
		model.addAttribute("requset_list", requset_list);
		
		
		return "group_detail_request.tiles";
	}
    
	@RequestMapping(value = "group_accept.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String group_accept(Model model,GroupRequestDTO gdto,int a_type) throws Exception {
		/*logger.info(" group_accept " + new Date());
		logger.info(" group_accept " +	gdto.toString());*/
		if (a_type == 0) {
			/*logger.info(" 승인 타입 : " + a_type );*/
			boolean yes =  groupService.accept_group(gdto);
				if (yes) {
					/*logger.info(" 변경함 " );*/
					boolean yes2 = groupService.add_group_member(gdto);
					if (yes2) {
						return "ture";
					} else {
						return "fail";
					}
				}else {
					return "fail";
				}
			
		} else {
		/*	logger.info(" 비승인  타입 : " + a_type );*/
			boolean yes = groupService.no_accept_group(gdto);
			if (yes) {
			/*	logger.info(" 변경함 " );*/
				return "ture";
			}else {
				return "fail";
			}
		}
		
	}
	@RequestMapping(value = "group_out.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_out(Model model,GroupMemberDTO gdto) throws Exception {
	/*	logger.info(" group_out " + new Date());
		logger.info(" 삭제할 것 " + gdto.toString());
		*/
		groupService.out_groupjoin(gdto);
		groupService.out_groupmember(gdto);
		
		return "redirect:/group_detail.do?g_seq="+gdto.getG_seq();
	}
	@RequestMapping(value = "group_mem_out.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String group_mem_out(Model model,GroupMemberDTO gdto) throws Exception {
	/*	logger.info(" group_mem_out " + new Date());
		logger.info(" 삭제할 것 " + gdto.toString());*/
		groupService.out_groupjoin(gdto);
		groupService.out_groupmember(gdto);
		
		return "true";
	}
	
	@RequestMapping(value = "group_newsfeed.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_newsfeed(NewsFeedDTO ndto, HttpServletRequest request, @RequestParam(value="fileload", required=false)MultipartFile fileload, Model model)throws Exception {
	/*	logger.info(" 그룹 뉴스피드 시작 " + ndto.toString());*/
		if (fileload != null) {
			/*logger.info(" 이름  " + fileload.getOriginalFilename());*/
			String arr[] = fileload.getOriginalFilename().split("\\.");
		/*	logger.info(" 확장자  " + arr[arr.length - 1]);*/
			String type = arr[arr.length - 1];
			type = type.toLowerCase();

			if (type.equals("avi") || type.equals("mp4") || type.equals("wmv")) {
				ndto.setN_form_num(2);
			} else if (type.equals("gif") || type.equals("png") || type.equals("jpg") || type.equals("jpeg")) {
				ndto.setN_form_num(1);
			} else {
				ndto.setN_form_num(3);
			}

		/*	logger.info(" 파일 있음   " + ndto.getN_form_num());*/
		} else {
			ndto.setN_form_num(0);
			/*logger.info(" 파일 없음 폼 번호" + ndto.getN_form_num());*/
		}

		ndto.setFilename(fileload.getOriginalFilename());
	/*	logger.info(" 오리지날 네임 확인 차  " + ndto.toString());*/

		String fupload = request.getServletContext().getRealPath("/upload");
	/*	logger.info(": " + fupload);*/

		String f = ndto.getFilename();
		String newFile = FUpUtil.getNewFile(f);

	/*	logger.info(fupload + "/" + newFile);*/

		if (ndto.getN_tag_feel() == null || ndto.getN_tag_feel().equals("")) {
			ndto.setN_tag_feel("");
		}

		ndto.setFilename(newFile);
/*
		logger.info("newFile = " + newFile);
		logger.info("getSize = " + fileload.getSize());*/

		if (fileload.getSize() == 0) {
			try {
			/*	logger.info(" 사이즈 0 확인 ");*/

				File file = new File(fupload + "/" + newFile);
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());

			/*	logger.info(" 작성전 확인 " + ndto.toString());*/
				groupService.group_writeNewsFeed(ndto);
			/*	logger.info(" 작성 완료 ");*/

			} catch (IOException e) {

			/*	logger.info(" 작성 실패 ");*/
			}

		} else {
			try {
			/*	logger.info(" 사이즈 0 이상 else 문 접근 ");*/
				File file = new File(fupload + "/" + newFile);
			/*	logger.info(" 파일 추가 ");*/
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			/*	logger.info(" 유틸 접근  ");*/
				groupService.group_writeNewsFeedImage(ndto);
			/*	logger.info(" 작성 완료 ");*/
			} catch (IOException e) {

			/*	logger.info(" 작성 실패 ");*/
			}
		}

		return "redirect:/group_detail.do?g_seq="+ndto.getG_seq();
	}
	
	@RequestMapping(value = "group_newsfeed_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String newsfeed_list(Model model, GroupListDTO gdto) throws Exception {
	/*	logger.info(" group_newsfeed_list " + new Date());
		logger.info(" gdto " + gdto.toString());

		logger.info(" gdto 시작" + gdto.getS_num());
		logger.info(" gdto 끝" + gdto.getL_num());*/
		List<GroupPhotoDTO> g_nlist = groupService.group_add_newsfeed_list(gdto);
		
		model.addAttribute("g_n_list", g_nlist);

			return "group_newsfeed_list.tiles";
	}
	
	
	//리스트 출력 폼
	@RequestMapping(value = "group_newsfeed_p_form.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_newsfeed_p_form(Model model, int n_seq) throws Exception {
		/*logger.info(" 포토 폼 / 폼넘버 : " + n_seq);*/
		GroupPhotoDTO pdto = groupService.group_newsfeed_p_form(n_seq);
/*		logger.info(" 시작아앙 : " +pdto.toString());
*/		
		model.addAttribute("pdto", pdto);
		
		return "group_newsfeed_p_form.tiles";
	}
	@RequestMapping(value = "group_newsfeed_v_form.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_newsfeed_v_form(Model model, int n_seq) throws Exception {
	/*	logger.info(" 비디오 폼 / 폼넘버 : " + n_seq);*/
		GroupPhotoDTO vdto = groupService.group_newsfeed_v_form(n_seq);
	/*	logger.info(" 시작아앙 : " +vdto.toString());*/
		model.addAttribute("vdto", vdto);
		
		return "group_newsfeed_v_form.tiles";
	}
	
	@RequestMapping(value = "group_newsfeed_b_form.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_newsfeed_b_form(Model model, VoteDTO vo,HttpServletRequest request) throws Exception {
	/*	logger.info(" 투표 폼 / 투표 넘버 : " +vo.getN_vote_seq());*/
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		vo.setM_id(memDTO.getM_id());
		
		List<VoterDTO> find = groupService.find_voter(vo);
		if (find.size()<1) {
			/*logger.info("투표 결과없음");*/
		} else {
		/*	logger.info("투표 결과있음");*/
		}
		
		VoteDTO vodto = groupService.group_newsfeed_b_form(vo);
		/*logger.info(" vodto " + vodto.toString());*/
		model.addAttribute("vodto", vodto);
		model.addAttribute("find", find);
		return "group_newsfeed_b_form.tiles";
	}
	
	@RequestMapping(value="vote.do", produces = "application/text; charset=utf8" , method= { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String vote(Model model,VoterDTO vo,HttpServletRequest request)throws Exception{
	/*	logger.info(" 투표 하기/ 투표 넘버 : " +vo.getN_vote_seq());*/
		String ma = URLDecoder.decode(request.getParameter("g_vote"),"UTF-8");
		
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		vo.setM_id(memDTO.getM_id());
	/*	logger.info("스트링"+ vo.toString() );*/
		vo.setG_vote(ma);
		
		groupService.add_voter(vo);
		
		return "true";
	}
	@RequestMapping(value="vote_result.do", method= { RequestMethod.GET, RequestMethod.POST })
	public String vote_result(Model model,VoterDTO vo, HttpServletRequest request)throws Exception{
		/*logger.info("투표 결과 확인" +vo.toString());*/
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		vo.setM_id(memDTO.getM_id());
		
		List<VotelistDTO> list = groupService.vote_result(vo);
	/*	logger.info("사이즈 확인" +	list.size());*/
		
		VoterDTO vdto = groupService.my_vote(vo);
		
		
		model.addAttribute("list", list);
		model.addAttribute("vdto", vdto);
		return "group_vote_result.tiles";
	}
	@RequestMapping(value="group_coment.do", method={RequestMethod.GET,RequestMethod.POST})
	public String group_coment(Model model, GroupPhotoDTO gdto,int l_num)throws Exception{
/*		logger.info("댓글 작성 시퀀스 확인" +gdto.toString());
		logger.info("l_num" +l_num);*/
		
		List<GroupPhotoDTO> clist =  groupService.group_coment(gdto);
		model.addAttribute("clist", clist);
		model.addAttribute("l_num", l_num);
		return "group_coment.tiles";
	}
	@RequestMapping(value="group_add_coment.do", method={RequestMethod.GET,RequestMethod.POST})
	public String group_add_coment(Model model, GroupPhotoDTO gdto,int l_num)throws Exception{
	/*	logger.info("추가 댓글 작성 시퀀스 확인" +gdto.toString());
		logger.info("l_num" +l_num);*/
		gdto.setG_seq(l_num);
/*		logger.info("들어간거" +gdto.getG_seq());*/
		List<GroupPhotoDTO> clist =  groupService.group_add_coment(gdto);
		model.addAttribute("clist", clist);
		model.addAttribute("l_num", l_num);
		return "group_coment.tiles";
	}
	
	@RequestMapping(value="group_local_find.do", method={RequestMethod.GET,RequestMethod.POST})
	public String local_find(Model model,HttpServletRequest request,GroupMakeDTO gdto,String tmp)throws Exception{
	/*	logger.info("들어온다 "+tmp+"시작"+gdto.getS_num()+","+gdto.getL_num());*/
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		String keyword = "";
		String arr[] = tmp.split(",");
		
		
		for (int i = 0; i < arr.length; i++) {
			if (arr[i].equals("1")) {
				arr[i] ="서울";
			}else if (arr[i].equals("2")) {
				arr[i] ="인천";
			}else if (arr[i].equals("3")) {
				arr[i] ="대구";
			}else if (arr[i].equals("4")) {
				arr[i] ="대전";
			}else if (arr[i].equals("5")) {
				arr[i] ="부산";
			}else if (arr[i].equals("6")) {
				arr[i] ="광주";
			}else {
				arr[i] ="제주";
			}
			keyword += "["+arr[i]+"]|";
		}
		keyword = keyword.substring(0, keyword.length()-1);
		/*logger.info("키워드 "+keyword);*/
		gdto.setKeyword(keyword);
		gdto.setG_manager(memDTO.getM_id());
		List<GroupMakeDTO> list = new ArrayList<GroupMakeDTO>();
		list = groupService.group_local_find(gdto);
	/*	logger.info("사이즈" +list.size());*/
		model.addAttribute("list", list);
		
		return "g_local_list_table.tiles";
	}
	
	@RequestMapping(value="group_name_update.do", method={RequestMethod.GET,RequestMethod.POST})
	public String group_name_update(Model model, GroupMakeDTO gdto)throws Exception{
		/*logger.info("수정 받은거 "+gdto.toString());*/
		
		groupService.group_name_update(gdto);
		
		return "redirect:/group_detail.do?g_seq="+gdto.getG_seq();
	}
	
	
}
