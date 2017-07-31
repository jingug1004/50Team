package sist.co.model;

public class NewsFeedListDTO {

	private String	viewPage;
	private String	m_id;
	private int		seq;
	private int		lastSeq;
	
	public NewsFeedListDTO() {}
	
	public NewsFeedListDTO(String viewPage, String m_id, int seq, int lastSeq) {
		this.viewPage = viewPage;
		this.m_id = m_id;
		this.seq = seq;
		this.lastSeq = lastSeq;
	}

	@Override
	public String toString() {
		return "NewsFeedListDTO [viewPage=" + viewPage + ", m_id=" + m_id + ", seq=" + seq + ", lastSeq=" + lastSeq
				+ "]";
	}

	public String getViewPage() {
		return viewPage;
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLastSeq() {
		return lastSeq;
	}

	public void setLastSeq(int lastSeq) {
		this.lastSeq = lastSeq;
	}
}