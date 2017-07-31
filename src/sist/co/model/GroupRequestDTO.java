package sist.co.model;

import java.util.Date;

public class GroupRequestDTO {

/*
CREATE TABLE TP3_GROUPJOIN(
J_SEQ NUMBER PRIMARY KEY,
G_SEQ NUMBER NOT NULL,
G_MANAGER VARCHAR2(100) NOT NULL,
M_ID VARCHAR2(100) NOT NULL,
G_ACCEPT NUMBER(1) NOT NULL,
r_date DATE
);

CREATE SEQUENCE TP3_JOIN_REQ_SEQ
START WITH 1 INCREMENT BY 1
*/
	private int j_seq;
	private int g_seq;
	private String g_manager;
	private String m_id;
	private int g_accept;
	private Date r_date;
	
	private String m_highschool;
	private String m_university;
	private String m_office;
	private String m_address;
	private String m_profile;
	
	public GroupRequestDTO(){}

	public GroupRequestDTO(int j_seq, int g_seq, String g_manager, String m_id, int g_accept, Date r_date,
			String m_highschool, String m_university, String m_office, String m_address, String m_profile) {
		super();
		this.j_seq = j_seq;
		this.g_seq = g_seq;
		this.g_manager = g_manager;
		this.m_id = m_id;
		this.g_accept = g_accept;
		this.r_date = r_date;
		this.m_highschool = m_highschool;
		this.m_university = m_university;
		this.m_office = m_office;
		this.m_address = m_address;
		this.m_profile = m_profile;
	}

	@Override
	public String toString() {
		return "GroupRequestDTO [j_seq=" + j_seq + ", g_seq=" + g_seq + ", g_manager=" + g_manager + ", m_id=" + m_id
				+ ", g_accept=" + g_accept + ", r_date=" + r_date + ", m_highschool=" + m_highschool + ", m_university="
				+ m_university + ", m_office=" + m_office + ", m_address=" + m_address + ", m_profile=" + m_profile
				+ "]";
	}

	public int getJ_seq() {
		return j_seq;
	}

	public void setJ_seq(int j_seq) {
		this.j_seq = j_seq;
	}

	public int getG_seq() {
		return g_seq;
	}

	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}

	public String getG_manager() {
		return g_manager;
	}

	public void setG_manager(String g_manager) {
		this.g_manager = g_manager;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getG_accept() {
		return g_accept;
	}

	public void setG_accept(int g_accept) {
		this.g_accept = g_accept;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
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


	
}
