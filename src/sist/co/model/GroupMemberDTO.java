package sist.co.model;

import java.io.Serializable;

public class GroupMemberDTO implements Serializable{

	/*
	CREATE TABLE TP3_GROUPMEMBER(
		g_seq NUMBER NOT NULL,
		m_id VARCHAR2(100) NOT NULL,
		g_auth NUMBER(1) NOT NULL,
		g_sysdate date NOT NULL,
	);
	 */
	private int g_seq;
	private String m_id;
	private int g_auth;
	
	public GroupMemberDTO(){
		
	}

	public int getG_seq() {
		return g_seq;
	}

	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getG_auth() {
		return g_auth;
	}

	public void setG_auth(int g_auth) {
		this.g_auth = g_auth;
	}

	public GroupMemberDTO(int g_seq, String m_id, int g_auth) {
		super();
		this.g_seq = g_seq;
		this.m_id = m_id;
		this.g_auth = g_auth;
	}

	@Override
	public String toString() {
		return "GroupMemberDTO [g_seq=" + g_seq + ", m_id=" + m_id + ", g_auth=" + g_auth + "]";
	}

	
}
