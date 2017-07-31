package sist.co.model;

import java.io.Serializable;
import java.sql.Date;

public class GroupPhotoDTO implements Serializable{

	private int n_seq;
	private int g_seq;
	private int n_form_num;
	private String m_id;
	private String m_name;
	private String n_content;
	private String n_tag_friend;
	private String n_tag_where;
	private String n_tag_feel;
	private int n_show;
	private Date n_wdate;
	private int n_report;
	private int n_ref;
	private int n_step;
	private int n_depth;
	private int n_parent;
	private int n_del;
	private int n_share;
	private int n_event_seq;
	private int n_vote_seq;
	private String nf_photo;
	private String nf_video;
	private String nf_file;
	private int n_likecount;
	private String m_profile;

	public GroupPhotoDTO(){
		
	}

	public GroupPhotoDTO(int n_seq, int g_seq, int n_form_num, String m_id, String m_name, String n_content,
			String n_tag_friend, String n_tag_where, String n_tag_feel, int n_show, Date n_wdate, int n_report,
			int n_ref, int n_step, int n_depth, int n_parent, int n_del, int n_share, int n_event_seq, int n_vote_seq,
			String nf_photo, String nf_video, String nf_file, int n_likecount, String m_profile) {
		super();
		this.n_seq = n_seq;
		this.g_seq = g_seq;
		this.n_form_num = n_form_num;
		this.m_id = m_id;
		this.m_name = m_name;
		this.n_content = n_content;
		this.n_tag_friend = n_tag_friend;
		this.n_tag_where = n_tag_where;
		this.n_tag_feel = n_tag_feel;
		this.n_show = n_show;
		this.n_wdate = n_wdate;
		this.n_report = n_report;
		this.n_ref = n_ref;
		this.n_step = n_step;
		this.n_depth = n_depth;
		this.n_parent = n_parent;
		this.n_del = n_del;
		this.n_share = n_share;
		this.n_event_seq = n_event_seq;
		this.n_vote_seq = n_vote_seq;
		this.nf_photo = nf_photo;
		this.nf_video = nf_video;
		this.nf_file = nf_file;
		this.n_likecount = n_likecount;
		this.m_profile = m_profile;
	}

	public int getN_seq() {
		return n_seq;
	}

	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}

	public int getG_seq() {
		return g_seq;
	}

	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}

	public int getN_form_num() {
		return n_form_num;
	}

	public void setN_form_num(int n_form_num) {
		this.n_form_num = n_form_num;
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

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_tag_friend() {
		return n_tag_friend;
	}

	public void setN_tag_friend(String n_tag_friend) {
		this.n_tag_friend = n_tag_friend;
	}

	public String getN_tag_where() {
		return n_tag_where;
	}

	public void setN_tag_where(String n_tag_where) {
		this.n_tag_where = n_tag_where;
	}

	public String getN_tag_feel() {
		return n_tag_feel;
	}

	public void setN_tag_feel(String n_tag_feel) {
		this.n_tag_feel = n_tag_feel;
	}

	public int getN_show() {
		return n_show;
	}

	public void setN_show(int n_show) {
		this.n_show = n_show;
	}

	public Date getN_wdate() {
		return n_wdate;
	}

	public void setN_wdate(Date n_wdate) {
		this.n_wdate = n_wdate;
	}

	public int getN_report() {
		return n_report;
	}

	public void setN_report(int n_report) {
		this.n_report = n_report;
	}

	public int getN_ref() {
		return n_ref;
	}

	public void setN_ref(int n_ref) {
		this.n_ref = n_ref;
	}

	public int getN_step() {
		return n_step;
	}

	public void setN_step(int n_step) {
		this.n_step = n_step;
	}

	public int getN_depth() {
		return n_depth;
	}

	public void setN_depth(int n_depth) {
		this.n_depth = n_depth;
	}

	public int getN_parent() {
		return n_parent;
	}

	public void setN_parent(int n_parent) {
		this.n_parent = n_parent;
	}

	public int getN_del() {
		return n_del;
	}

	public void setN_del(int n_del) {
		this.n_del = n_del;
	}

	public int getN_share() {
		return n_share;
	}

	public void setN_share(int n_share) {
		this.n_share = n_share;
	}

	public int getN_event_seq() {
		return n_event_seq;
	}

	public void setN_event_seq(int n_event_seq) {
		this.n_event_seq = n_event_seq;
	}

	public int getN_vote_seq() {
		return n_vote_seq;
	}

	public void setN_vote_seq(int n_vote_seq) {
		this.n_vote_seq = n_vote_seq;
	}

	public String getNf_photo() {
		return nf_photo;
	}

	public void setNf_photo(String nf_photo) {
		this.nf_photo = nf_photo;
	}

	public String getNf_video() {
		return nf_video;
	}

	public void setNf_video(String nf_video) {
		this.nf_video = nf_video;
	}

	public String getNf_file() {
		return nf_file;
	}

	public void setNf_file(String nf_file) {
		this.nf_file = nf_file;
	}

	public int getN_likecount() {
		return n_likecount;
	}

	public void setN_likecount(int n_likecount) {
		this.n_likecount = n_likecount;
	}

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

}
