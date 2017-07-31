package sist.co.model;

public class NewsFeedLikeDTO {
	private int n_seq;
	private String m_id;
	
	public NewsFeedLikeDTO() {
		super();
	}

	public NewsFeedLikeDTO(int n_seq, String m_id) {
		super();
		this.n_seq = n_seq;
		this.m_id = m_id;
	}

	public int getN_seq() {
		return n_seq;
	}

	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "NewsFeedLikeDTO [n_seq=" + n_seq + ", m_id=" + m_id + "]";
	}
	
	
	

}
