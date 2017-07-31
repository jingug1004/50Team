package sist.co.service;

import sist.co.model.MemberDTO;

public interface MemberService {

	int check_member(MemberDTO member)throws Exception;
	int m_phoneAf(MemberDTO member)throws Exception;
	int check_m_pwd(MemberDTO member)throws Exception;
	
	boolean add_member(MemberDTO member)throws Exception;
	MemberDTO login(MemberDTO member) throws Exception;
	boolean change_m_office(MemberDTO member) throws Exception;
	boolean change_m_highschool(MemberDTO member) throws Exception;
	boolean change_m_university(MemberDTO member) throws Exception;
	boolean change_m_marriage(MemberDTO member) throws Exception;
	boolean change_m_content(MemberDTO member) throws Exception;
	boolean change_m_address(MemberDTO member) throws Exception;
	boolean change_m_profile(MemberDTO member) throws Exception;
	boolean change_m_nickname(MemberDTO member) throws Exception;
	boolean change_m_gender(MemberDTO member) throws Exception;
	boolean change_m_phone(MemberDTO member) throws Exception;
	boolean change_m_pwd(MemberDTO member) throws Exception;
	boolean del_m_profile(MemberDTO member) throws Exception;
	
	
	MemberDTO login2(MemberDTO member) throws Exception;
}
