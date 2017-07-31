package sist.co.model;

public class EventInviteMemberDTO {

	private String	m_id;
	private String	m_name;
	private String	m_profile;
	private String	m_highschool;
	private String	m_university;
	private String	m_office;
	private String	m_address;
	
	private int		e_seq;
	private String	ei_write_date;

	public EventInviteMemberDTO() {}

	public EventInviteMemberDTO(String m_id, String m_name, String m_profile, String m_highschool, String m_university,
			String m_office, String m_address, int e_seq, String ei_write_date) {
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_profile = m_profile;
		this.m_highschool = m_highschool;
		this.m_university = m_university;
		this.m_office = m_office;
		this.m_address = m_address;
		this.e_seq = e_seq;
		this.ei_write_date = ei_write_date;
	}

	@Override
	public String toString() {
		return "EventInviteMemberDTO [m_id=" + m_id + ", m_name=" + m_name + ", m_profile=" + m_profile
				+ ", m_highschool=" + m_highschool + ", m_university=" + m_university + ", m_office=" + m_office
				+ ", m_address=" + m_address + ", e_seq=" + e_seq + ", ei_write_date=" + ei_write_date + "]";
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

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

	public String getM_highschool() {
		return m_highschool;
	}

	public void setM_highschool(String m_highschool) {
		this.m_highschool = m_highschool;
	}

	public String getM_university() {
		return m_university;
	}

	public void setM_university(String m_university) {
		this.m_university = m_university;
	}

	public String getM_office() {
		return m_office;
	}

	public void setM_office(String m_office) {
		this.m_office = m_office;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public int getE_seq() {
		return e_seq;
	}

	public void setE_seq(int e_seq) {
		this.e_seq = e_seq;
	}


	public String getEi_write_date() {
		return ei_write_date;
	}

	public void setEi_write_date(String ei_write_date) {
		this.ei_write_date = ei_write_date;
	}
}