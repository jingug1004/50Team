package sist.co.model;

public class FriendDTO {

	private int seq;
	private String m_id;	// 요청한친구
	private String f_id;	// 요청받은친구
	private int f_accept;	// 친구구분(수락전0, 요청수락시 1, follow 2)
	private int f_group;	// 그룹(가족(0), 친한사람(1), 친구(2) )
	private int f_block;	// 차단(차단x(0), 차단(1))
	
	public FriendDTO() {
	
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getF_id() {
		return f_id;
	}

	public void setF_id(String f_id) {
		this.f_id = f_id;
	}

	public int getF_accept() {
		return f_accept;
	}

	public void setF_accept(int f_accept) {
		this.f_accept = f_accept;
	}

	public int getF_group() {
		return f_group;
	}

	public void setF_group(int f_group) {
		this.f_group = f_group;
	}

	public int getF_block() {
		return f_block;
	}

	public void setF_block(int f_block) {
		this.f_block = f_block;
	}

	@Override
	public String toString() {
		return "FriendDTO [seq=" + seq + ", m_id=" + m_id + ", f_id=" + f_id + ", f_accept=" + f_accept + ", f_group="
				+ f_group + ", f_block=" + f_block + "]";
	}
		
	
}
