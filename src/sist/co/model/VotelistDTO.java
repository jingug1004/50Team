package sist.co.model;

import java.io.Serializable;

public class VotelistDTO implements Serializable {
/*
	CREATE TABLE TP3_VOTELIST(
	N_VOTE_SEQ NUMBER NOT NULL,
	V_LIST VARCHAR2(100) NOT NULL,
	V_COUNT NUMBER
	)
*/
	public VotelistDTO(){}
	
	private int n_vote_seq;
	private String v_list;
	private int v_count;
	public VotelistDTO(int n_vote_seq, String v_list, int v_count) {
		super();
		this.n_vote_seq = n_vote_seq;
		this.v_list = v_list;
		this.v_count = v_count;
	}
	public VotelistDTO(int n_vote_seq, String v_list) {
		super();
		this.n_vote_seq = n_vote_seq;
		this.v_list = v_list;
	}
	@Override
	public String toString() {
		return "VotelistDTO [n_vote_seq=" + n_vote_seq + ", v_list=" + v_list + ", v_count=" + v_count + "]";
	}
	
	public int getN_vote_seq() {
		return n_vote_seq;
	}
	public void setN_vote_seq(int n_vote_seq) {
		this.n_vote_seq = n_vote_seq;
	}
	public String getV_list() {
		return v_list;
	}
	public void setV_list(String v_list) {
		this.v_list = v_list;
	}
	public int getV_count() {
		return v_count;
	}
	public void setV_count(int v_count) {
		this.v_count = v_count;
	}
	
	
	
}
