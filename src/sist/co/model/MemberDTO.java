package sist.co.model;

public class MemberDTO {
	private String m_id;	
	private String m_name;
	private String m_nickname;
	private String m_password;
	private String m_phone;
	private String m_regdate;
	private String m_birthday;
	private String m_profile;
	private String m_highschool;
	private String m_university;
	private String m_office;
	private int m_marriage;
	private String m_address;
	private int m_deactivation;
	private int m_ask;
	private String m_content;
	private String m_stopdate;
	private int m_gender;
	
	public MemberDTO() {}
		
	public MemberDTO(String m_id, String m_name, String m_nickname, String m_password, String m_phone, String m_regdate,
			String m_birthday, String m_profile, String m_highschool, String m_university, String m_office,
			int m_marriage, String m_address, int m_deactivation, int m_ask, String m_content, String m_stopdate,
			int m_gender) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_password = m_password;
		this.m_phone = m_phone;
		this.m_regdate = m_regdate;
		this.m_birthday = m_birthday;
		this.m_profile = m_profile;
		this.m_highschool = m_highschool;
		this.m_university = m_university;
		this.m_office = m_office;
		this.m_marriage = m_marriage;
		this.m_address = m_address;
		this.m_deactivation = m_deactivation;
		this.m_ask = m_ask;
		this.m_content = m_content;
		this.m_stopdate = m_stopdate;
		this.m_gender = m_gender;
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
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getM_birthday() {
		return m_birthday;
	}
	public void setM_birthday(String m_birthday) {
		this.m_birthday = m_birthday;
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
	public int getM_marriage() {
		return m_marriage;
	}
	public void setM_marriage(int m_marriage) {
		this.m_marriage = m_marriage;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public int getM_deactivation() {
		return m_deactivation;
	}
	public void setM_deactivation(int m_deactivation) {
		this.m_deactivation = m_deactivation;
	}
	public int getM_ask() {
		return m_ask;
	}
	public void setM_ask(int m_ask) {
		this.m_ask = m_ask;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public String getM_stopdate() {
		return m_stopdate;
	}
	public void setM_stopdate(String m_stopdate) {
		this.m_stopdate = m_stopdate;
	}

	public int getM_gender() {
		return m_gender;
	}

	public void setM_gender(int m_gender) {
		this.m_gender = m_gender;
	}


	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_name=" + m_name + ", m_nickname=" + m_nickname + ", m_password="
				+ m_password + ", m_phone=" + m_phone + ", m_regdate=" + m_regdate + ", m_birthday=" + m_birthday
				+ ", m_profile=" + m_profile + ", m_highschool=" + m_highschool + ", m_university=" + m_university
				+ ", m_office=" + m_office + ", m_marriage=" + m_marriage + ", m_address=" + m_address
				+ ", m_deactivation=" + m_deactivation + ", m_ask=" + m_ask + ", m_content=" + m_content
				+ ", m_stopdate=" + m_stopdate + ", m_gender=" + m_gender + "]";
	}

	
	
	
}
