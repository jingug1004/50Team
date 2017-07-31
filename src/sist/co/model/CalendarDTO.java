package sist.co.model;

public class CalendarDTO {
	
	private String	m_id;
	private String	yyyymm;
	private int		substrS;	// SQL 'SUBSTR' 시작 인덱스
	private int		substrE;	// SQL 'SUBSTR' 종료 인덱스
	
	public CalendarDTO() {}

	public CalendarDTO(String m_id, String yyyymm, int substrS, int substrE) {
		this.m_id = m_id;
		this.yyyymm = yyyymm;
		this.substrS = substrS;
		this.substrE = substrE;
	}

	@Override
	public String toString() {
		return "CalendarDTO [m_id=" + m_id + ", yyyymm=" + yyyymm + ", substrS=" + substrS + ", substrE=" + substrE
				+ "]";
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getYyyymm() {
		return yyyymm;
	}

	public void setYyyymm(String yyyymm) {
		this.yyyymm = yyyymm;
	}

	public int getSubstrS() {
		return substrS;
	}

	public void setSubstrS(int substrS) {
		this.substrS = substrS;
	}

	public int getSubstrE() {
		return substrE;
	}

	public void setSubstrE(int substrE) {
		this.substrE = substrE;
	}
}