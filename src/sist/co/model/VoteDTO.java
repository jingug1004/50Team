package sist.co.model;

import java.io.Serializable;
import java.util.Date;

public class VoteDTO implements Serializable{
/*
	CREATE TABLE TP3_VOTE(
	G_SEQ NUMBER NOT NULL,
	N_VOTE_SEQ NUMBER PRIMARY KEY,
	VOTE1 VARCHAR2(100) NULL,
	VOTE2 VARCHAR2(100) NULL,
	VOTE3 VARCHAR2(100) NULL,
	VOTE4 VARCHAR2(100) NULL,
	VOTE5 VARCHAR2(100) NULL,
	VOTE6 VARCHAR2(100) NULL,
	VOTE7 VARCHAR2(100) NULL,
	VOTE8 VARCHAR2(100) NULL,
	VOTE9 VARCHAR2(100) NULL,
	VOTE10 VARCHAR2(100) NULL,
	N_CONTENT VARCHAR2(4000),
	M_ID VARCHAR2(20) NOT NULL,
	S_DATE DATE NOT NULL,
	M_DATE DATE NOT NULL
	)
		
		
	CREATE SEQUENCE TP3_VOTE_SEQ
	START WITH 1 INCREMENT BY 1
*/
	public VoteDTO(){}
	
	private int g_seq;
	private int n_vote_seq;
	private String vote1;
	private String vote2;
	private String vote3;
	private String vote4;
	private String vote5;
	private String vote6;
	private String vote7;
	private String vote8;
	private String vote9;
	private String vote10;
	private String n_content;
	private String q_content;
	private String m_id;
	private Date s_sdate; 
	private Date m_sdate;
	
	public VoteDTO(int g_seq, int n_vote_seq, String vote1, String vote2, String vote3, String vote4, String vote5,
			String vote6, String vote7, String vote8, String vote9, String vote10, String n_content, String q_content,
			String m_id, Date s_sdate, Date m_sdate) {
		super();
		this.g_seq = g_seq;
		this.n_vote_seq = n_vote_seq;
		this.vote1 = vote1;
		this.vote2 = vote2;
		this.vote3 = vote3;
		this.vote4 = vote4;
		this.vote5 = vote5;
		this.vote6 = vote6;
		this.vote7 = vote7;
		this.vote8 = vote8;
		this.vote9 = vote9;
		this.vote10 = vote10;
		this.n_content = n_content;
		this.q_content = q_content;
		this.m_id = m_id;
		this.s_sdate = s_sdate;
		this.m_sdate = m_sdate;
	}
	@Override
	public String toString() {
		return "VoteDTO [g_seq=" + g_seq + ", n_vote_seq=" + n_vote_seq + ", vote1=" + vote1 + ", vote2=" + vote2
				+ ", vote3=" + vote3 + ", vote4=" + vote4 + ", vote5=" + vote5 + ", vote6=" + vote6 + ", vote7=" + vote7
				+ ", vote8=" + vote8 + ", vote9=" + vote9 + ", vote10=" + vote10 + ", n_content=" + n_content
				+ ", q_content=" + q_content + ", m_id=" + m_id + ", s_sdate=" + s_sdate + ", m_sdate=" + m_sdate + "]";
	}
	public int getG_seq() {
		return g_seq;
	}
	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}
	public int getN_vote_seq() {
		return n_vote_seq;
	}
	public void setN_vote_seq(int n_vote_seq) {
		this.n_vote_seq = n_vote_seq;
	}
	public String getVote1() {
		return vote1;
	}
	public void setVote1(String vote1) {
		this.vote1 = vote1;
	}
	public String getVote2() {
		return vote2;
	}
	public void setVote2(String vote2) {
		this.vote2 = vote2;
	}
	public String getVote3() {
		return vote3;
	}
	public void setVote3(String vote3) {
		this.vote3 = vote3;
	}
	public String getVote4() {
		return vote4;
	}
	public void setVote4(String vote4) {
		this.vote4 = vote4;
	}
	public String getVote5() {
		return vote5;
	}
	public void setVote5(String vote5) {
		this.vote5 = vote5;
	}
	public String getVote6() {
		return vote6;
	}
	public void setVote6(String vote6) {
		this.vote6 = vote6;
	}
	public String getVote7() {
		return vote7;
	}
	public void setVote7(String vote7) {
		this.vote7 = vote7;
	}
	public String getVote8() {
		return vote8;
	}
	public void setVote8(String vote8) {
		this.vote8 = vote8;
	}
	public String getVote9() {
		return vote9;
	}
	public void setVote9(String vote9) {
		this.vote9 = vote9;
	}
	public String getVote10() {
		return vote10;
	}
	public void setVote10(String vote10) {
		this.vote10 = vote10;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getS_sdate() {
		return s_sdate;
	}
	public void setS_sdate(Date s_sdate) {
		this.s_sdate = s_sdate;
	}
	public Date getM_sdate() {
		return m_sdate;
	}
	public void setM_sdate(Date m_sdate) {
		this.m_sdate = m_sdate;
	}

	
	
}
