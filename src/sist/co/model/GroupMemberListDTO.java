package sist.co.model;

import java.io.Serializable;

public class GroupMemberListDTO implements Serializable{
	
	/*
	SELECT TP_SISTMEMBER.M_ID,m_name, m_nickname, m_highschool, m_university, m_office, m_address, g_seq, g_auth
	FROM TP_SISTMEMBER
	INNER JOIN GROUPMEMBER 
	ON TP_SISTMEMBER.M_ID=GROUPMEMBER.M_ID
	WHERE G_SEQ=1
	*/
	
	private String m_id;
	private String m_name;
	private String m_nickname;
	private String m_highschool;
	private String m_university;
	private String m_office;
	private String m_address;
	private String m_profile;
	private int g_seq;
	private int g_auth;
	
	
	
	public GroupMemberListDTO(){}



	public GroupMemberListDTO(String m_id, String m_name, String m_nickname, String m_highschool, String m_university,
			String m_office, String m_address, String m_profile, int g_seq, int g_auth) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_highschool = m_highschool;
		this.m_university = m_university;
		this.m_office = m_office;
		this.m_address = m_address;
		this.m_profile = m_profile;
		this.g_seq = g_seq;
		this.g_auth = g_auth;
	}



	@Override
	public String toString() {
		return "GroupMemberListDTO [m_id=" + m_id + ", m_name=" + m_name + ", m_nickname=" + m_nickname
				+ ", m_highschool=" + m_highschool + ", m_university=" + m_university + ", m_office=" + m_office
				+ ", m_address=" + m_address + ", m_profile=" + m_profile + ", g_seq=" + g_seq + ", g_auth=" + g_auth
				+ "]";
	}



	public String getM_id() {
		return m_id;
	}



	public void setM_id(String m_id) {
		this.m_id = m_id;
	}



	public String getM_name() {
		return m_name;
	}



	public void setM_name(String m_name) {
		this.m_name = m_name;
	}



	public String getM_nickname() {
		return m_nickname;
	}



	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}



	public String getM_highschool() {
		return m_highschool;
	}



	public void setM_highschool(String m_highschool) {
		this.m_highschool = m_highschool;
	}



	public String getM_university() {
		return m_university;
	}



	public void setM_university(String m_university) {
		this.m_university = m_university;
	}



	public String getM_office() {
		return m_office;
	}



	public void setM_office(String m_office) {
		this.m_office = m_office;
	}



	public String getM_address() {
		return m_address;
	}



	public void setM_address(String m_address) {
		this.m_address = m_address;
	}



	public String getM_profile() {
		return m_profile;
	}



	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}



	public int getG_seq() {
		return g_seq;
	}



	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}



	public int getG_auth() {
		return g_auth;
	}



	public void setG_auth(int g_auth) {
		this.g_auth = g_auth;
	}


	
}
