package sist.co.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class GroupMakeDTO implements Serializable{
	
	
	/*
		CREATE TABLE TP3_MAKEGROUP(
		g_seq NUMBER primary key,
		g_name VARCHAR2(100) NOT NULL,
		g_photo	VARCHAR2(1000) NOT NULL,
		g_type NUMBER(1) NOT NULL,
		g_manager VARCHAR2(100) NOT NULL
		);
		
		CREATE SEQUENCE GROUP_SEQ START WITH 1 INCREMENT BY 1;

	 */
	
		private int g_seq;
		private	String g_name;
		private	String g_photo;
		private int g_type;
		private String g_manager;
	//검색용
	private String keyword;
	
	// 페이징 용
	private int s_num;
	private int l_num;
	
	public GroupMakeDTO(){
		
	}
	
	public GroupMakeDTO(int g_seq, String g_name, String g_photo, int g_type, String g_manager) {
		super();
		this.g_seq = g_seq;
		this.g_name = g_name;
		this.g_photo = g_photo;
		this.g_type = g_type;
		this.g_manager = g_manager;
	}
	
	public GroupMakeDTO(int g_seq, String g_name, String g_photo, int g_type, String g_manager, String keyword) {
		super();
		this.g_seq = g_seq;
		this.g_name = g_name;
		this.g_photo = g_photo;
		this.g_type = g_type;
		this.g_manager = g_manager;
		this.keyword = keyword;
	}

	public GroupMakeDTO(int g_seq, String g_name, String g_photo, int g_type, String g_manager, String keyword,
			int s_num, int l_num) {
		super();
		this.g_seq = g_seq;
		this.g_name = g_name;
		this.g_photo = g_photo;
		this.g_type = g_type;
		this.g_manager = g_manager;
		this.keyword = keyword;
		this.s_num = s_num;
		this.l_num = l_num;
	}

	@Override
	public String toString() {
		return "GroupMakeDTO [g_seq=" + g_seq + ", g_name=" + g_name + ", g_photo=" + g_photo + ", g_type=" + g_type
				+ ", g_manager=" + g_manager + ", keyword=" + keyword + ", s_num=" + s_num + ", l_num=" + l_num + "]";
	}

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

	public String getG_photo() {
		return g_photo;
	}

	public void setG_photo(String g_photo) {
		this.g_photo = g_photo;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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

	
}
