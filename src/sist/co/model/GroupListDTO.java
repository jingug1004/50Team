package sist.co.model;

import java.io.Serializable;

public class GroupListDTO implements Serializable{

	private int g_seq;
	private String g_name;
	private int g_type;
	private String g_manager;
	private String m_id;
	private int g_auth;
	
	private int s_num;
	private int l_num;
	
	
	public GroupListDTO(){}


	public int getG_seq() {
		return g_seq;
	}


	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}


	public String getG_name() {
		return g_name;
	}


	public void setG_name(String g_name) {
		this.g_name = g_name;
	}


	public int getG_type() {
		return g_type;
	}


	public void setG_type(int g_type) {
		this.g_type = g_type;
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


	public int getG_auth() {
		return g_auth;
	}


	public void setG_auth(int g_auth) {
		this.g_auth = g_auth;
	}


	public int getS_num() {
		return s_num;
	}


	public void setS_num(int s_num) {
		this.s_num = s_num;
	}


	public int getL_num() {
		return l_num;
	}


	public void setL_num(int l_num) {
		this.l_num = l_num;
	}


	public GroupListDTO(int g_seq, String g_name, int g_type, String g_manager, String m_id, int g_auth, int s_num,
			int l_num) {
		super();
		this.g_seq = g_seq;
		this.g_name = g_name;
		this.g_type = g_type;
		this.g_manager = g_manager;
		this.m_id = m_id;
		this.g_auth = g_auth;
		this.s_num = s_num;
		this.l_num = l_num;
	}


	@Override
	public String toString() {
		return "GroupListDTO [g_seq=" + g_seq + ", g_name=" + g_name + ", g_type=" + g_type + ", g_manager=" + g_manager
				+ ", m_id=" + m_id + ", g_auth=" + g_auth + ", s_num=" + s_num + ", l_num=" + l_num + "]";
	}

	
	
}
