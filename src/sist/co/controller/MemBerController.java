package sist.co.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import sist.co.util.FUpUtil;
import sist.co.model.MemberDTO;
import sist.co.model.MsgMember;
import sist.co.model.NewsFeedDTO;
import sist.co.model.NewsFeedListDTO;
import sist.co.service.MemberService;

//

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import java.io.*;
import java.util.*;
import java.security.Key;
import java.security.Security;
import sist.co.service.NewsFeedService;



@Controller
public class MemBerController {

	private static final Logger logger = LoggerFactory.getLogger(MemBerController.class);
	
	@Autowired
	MemberService MemberService;
	
	@Autowired
	NewsFeedService newsFeedService;
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login(Model model){
		/*logger.info("환영합니다 login login" + new Date());*/
		return "login.tiles";
	}	
	
	@RequestMapping(value="main.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mainAf (HttpServletRequest request, MemberDTO member, Model model) throws Exception{
		return "forward:/NewsFeedList.do";
	}
	
	@RequestMapping(value="loginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf (HttpServletRequest request, MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 loginAf loginAf" + new Date());*/
		
		MemberDTO login = null;
		login =  MemberService.login(member);
		
		if(login != null && !login.getM_id().equals("")){
			request.getSession().setAttribute("login", login);
			request.getSession().setMaxInactiveInterval(60*60*24);

			return "main.tiles";
		}else{
			return "redirect:/login.do";
		}
	}
	@RequestMapping(value="regi.do", method=RequestMethod.GET)
	public String regi(Model model){
		/*logger.info("환영합니다 regi regi" + new Date());*/
		return "regi.tiles";
	}
	
	@RequestMapping(value="regiAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regiAf(HttpServletRequest request, Model model, MemberDTO member) throws Exception{
		
		member.setM_nickname(member.getM_name());
		member.setM_profile("test");
		
		if(member.getM_highschool()==null){
			member.setM_highschool("");
		}
		if(member.getM_university()==null){
			member.setM_university("");
		}
		if(member.getM_office()==null){
			member.setM_office("");
		}
		if(member.getM_content()==null){
			member.setM_content("");
		}

		MemberService.add_member(member);
		return "redirect:/login.do";
	}

	@RequestMapping(value="my_page.do", method=RequestMethod.GET)
	public String mypage(Model model){
		/*logger.info("환영합니다 mypage mypage" + new Date());*/
		return "my_page.tiles";
	}
	
	/*영선 수정합니다~~~ */
	@RequestMapping(value="time_line.do", method=RequestMethod.GET)
	public String time_line(Model model,String m_id){
		logger.info("환영합니다 time_line time_line" + new Date());
		System.out.println("m_id=="+m_id);

		return "redirect:/NewsFeedList2.do?m_id="+m_id+"&link=people";
	}
	/*영선  */
	
	@RequestMapping(value="change_m_mypage1.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_mypage1(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 change_m_mypage1 change_m_mypage1" + new Date());*/

		MemberService.change_m_office(member);

		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	@RequestMapping(value="change_m_mypage2.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_mypage2(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 change_m_mypage2 change_m_mypage2" + new Date());*/
		MemberService.change_m_highschool(member);
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	@RequestMapping(value="change_m_mypage3.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_mypage3(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 change_m_mypage3 change_m_mypage3" + new Date());*/
		MemberService.change_m_university(member);

		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	
	
	@RequestMapping(value="change_m_marriage.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_marriage(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 change_m_marriage change_m_marriage" + new Date());*/

		MemberService.change_m_marriage(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}

	@RequestMapping(value="change_m_content.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_content(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 change_m_content change_m_content" + new Date());*/

		MemberService.change_m_content(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	
	@RequestMapping(value="change_m_address.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_address(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 SistMemberController change_m_address" + new Date());*/
		
		MemberService.change_m_address(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		return login;
	}
	
	@RequestMapping(value="change_m_nickname.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_nickname(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 change_m_nickname change_m_nickname" + new Date());*/
		MemberService.change_m_nickname(member);
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	
	@RequestMapping(value="change_m_gender.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_gender(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 change_m_gender change_m_gender" + new Date());*/
		
		MemberService.change_m_gender(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	@RequestMapping(value="change_m_phone.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_phone(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 SistMemberController change_m_phone" + new Date());*/
		
		MemberService.change_m_phone(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	@RequestMapping(value="change_m_pwd.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_pwd(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 SistMemberController change_m_pwd" + new Date());*/
		
		MemberService.change_m_pwd(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	
	
	@RequestMapping(value="del_m_profile.do", method={RequestMethod.GET, RequestMethod.POST})
	public MemberDTO del_m_profile(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 del_m_profile del_m_profile" + new Date());*/
		
		MemberService.del_m_profile(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return login;
	}
	
	@RequestMapping(value="m_phoneAf.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MsgMember m_phoneAf(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 SistMemberController m_phoneAf" + new Date());*/
		
		int count= MemberService.m_phoneAf(member);
		
		System.out.println("count = " + count);
		
		MsgMember msg = new MsgMember();
		if(count > 0){	
			msg.setMessage("Sucs");		
		}else{
			msg.setMessage("No");
		}
		return msg;
	}
	
	@RequestMapping(value="check_m_pwd.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MsgMember check_m_pwd(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		/*logger.info("환영합니다 SistMemberController m_phoneAf" + new Date());*/
		
		int count= MemberService.check_m_pwd(member);
		
		System.out.println("count = " + count);
		
		MsgMember msg = new MsgMember();
		if(count > 0){	
			msg.setMessage("Sucs");		
		}else{
			msg.setMessage("No");
		}
		return msg;
	}
	
	
	
	
	@RequestMapping(value="change_m_profile.do", method=RequestMethod.POST)
	public String change_m_profile(HttpServletRequest request,MemberDTO member,
		@RequestParam(value="fileload_j", required=false) MultipartFile fileload, Model model)throws Exception{
		
		/*logger.info("환영~ change_m_profile change_m_profile " + new Date());*/

		NewsFeedListDTO newsfeedlistDTO = new NewsFeedListDTO("main", null, 0, 0);
		List<NewsFeedDTO> NewsFeedList =  newsFeedService.getNewsFeedList(newsfeedlistDTO);
        model.addAttribute("NewsFeedList",NewsFeedList);
        
		member.setM_profile(fileload.getOriginalFilename());
		String fupload = request.getServletContext().getRealPath("/upload");	
		String f = member.getM_profile();
		String newFile = FUpUtil.getNewFile(f);
		logger.info(fupload+"/" + newFile);
		member.setM_profile(newFile);
		
		if(fileload.getSize()==0){
			MemberService.del_m_profile(member);
		}else{
			try {
				File file = new File(fupload+"/"+newFile);
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				MemberService.change_m_profile(member);
			} catch (Exception e) {
				logger.info("pdsupload 실패!");
			}
		}
		MemberDTO login = null;
		
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		request.getSession().setMaxInactiveInterval(60*60*24);
		
		return "main.tiles";
		
	}

/*	@RequestMapping(value="modify_content3.do", method=RequestMethod.GET)
	public String modify_content(Model model){
		logger.info("자기소개!" + new Date());
		return "modify_content.jsp";
	}*/

	@RequestMapping(value="check_member.do", method=RequestMethod.POST)
	@ResponseBody
	public MsgMember check_member( HttpServletRequest request, MemberDTO member, Model model) throws Exception{
		
		/*logger.info("MemberController getID " + new Date());*/
		
		int count= MemberService.check_member(member);
		int random = (int)(Math.random()*10000000)+10000000;
						
		MsgMember msg = new MsgMember();
		if(count > 0){
			
			msg.setMessage("Sucs");
			
					
		}else{
			
			msg.setMessage(""+(random));
			
			Properties p = new Properties();
			p.put("mail.smtp.user", "jossi8918@gmail.com"); // Google계정@gmail.com으로 설정
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable","true");
			p.put( "mail.smtp.auth", "true");
			 
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465"); 
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
			p.put("mail.smtp.socketFactory.fallback", "false");
			 
			  
			 
			try {
				Authenticator auth = new SMTPAuthenticator();
				Session session = Session.getInstance(p, auth);
				/*session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.*/	
				
				MimeMessage msg2 = new MimeMessage(session);
				String message = "["+random+"]" + " 인증번호 발송 내용입니다 다음 인증번호를 입력해주세요 .";
				msg2.setSubject("회원 인증번호 발송 내용입니다 확인 후 인증번호를 입력해주세요.");
				Address fromAddr = new InternetAddress("jossi8918@gmail.com"); // 보내는 사람의 메일주소
				msg2.setFrom(fromAddr);
				Address toAddr = new InternetAddress(member.getM_id());  // 받는 사람의 메일주소
				msg2.addRecipient(Message.RecipientType.TO, toAddr); 
				msg2.setContent(message, "text/plain;charset=UTF-8");
			   
				Transport.send(msg2);
			}
			catch (Exception mex) { // Prints all nested (chained) exceptions as well 
				mex.printStackTrace(); 
			} 
			}
		return msg;
	}
	private static class SMTPAuthenticator extends javax.mail.Authenticator {
		 
		  public PasswordAuthentication getPasswordAuthentication() {
			  return new PasswordAuthentication("jossi8918", "tjdghks89"); // Google id, pwd, 주의) @gmail.com 은 제외하세요
		  }
	}
}
