package sist.co.model;

import java.io.Serializable;

public class EventDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int 	e_seq;
	private int 	e_type;
	private int 	g_seq;
	private String	m_id;
	private String 	m_name;
	private String	e_title;
	private String	e_content;
	private String	e_location;
	private String	e_start_date;
	private String	e_end_date;
	private String	e_write_date;
	private String	e_image;
	
	private int		ei_join;
	
	public EventDTO() {}


	public EventDTO(int e_seq, int e_type, int g_seq, String m_id, String m_name, String e_title, String e_content,
			String e_location, String e_start_date, String e_end_date, String e_write_date, String e_image,
			int ei_join) {
		this.e_seq = e_seq;
		this.e_type = e_type;
		this.g_seq = g_seq;
		this.m_id = m_id;
		this.m_name = m_name;
		this.e_title = e_title;
		this.e_content = e_content;
		this.e_location = e_location;
		this.e_start_date = e_start_date;
		this.e_end_date = e_end_date;
		this.e_write_date = e_write_date;
		this.e_image = e_image;
		this.ei_join = ei_join;
	}

	@Override
	public String toString() {
		return "EventDTO [e_seq=" + e_seq + ", e_type=" + e_type + ", g_seq=" + g_seq + ", m_id=" + m_id + ", m_name="
				+ m_name + ", e_title=" + e_title + ", e_content=" + e_content + ", e_location=" + e_location
				+ ", e_start_date=" + e_start_date + ", e_end_date=" + e_end_date + ", e_write_date=" + e_write_date
				+ ", e_image=" + e_image + ", ei_join=" + ei_join + "]";
	}

	public int getE_seq() {
		return e_seq;
	}

	public void setE_seq(int e_seq) {
		this.e_seq = e_seq;
	}

	public int getE_type() {
		return e_type;
	}

	public void setE_type(int e_type) {
		this.e_type = e_type;
	}

	public int getG_seq() {
		return g_seq;
	}

	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
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

	public String getE_title() {
		return e_title;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public String getE_content() {
		return e_content;
	}

	public void setE_content(String e_content) {
		this.e_content = e_content;
	}

	public String getE_location() {
		return e_location;
	}

	public void setE_location(String e_location) {
		this.e_location = e_location;
	}

	public String getE_start_date() {
		return e_start_date;
	}

	public void setE_start_date(String e_start_date) {
		this.e_start_date = e_start_date;
	}

	public String getE_end_date() {
		return e_end_date;
	}

	public void setE_end_date(String e_end_date) {
		this.e_end_date = e_end_date;
	}

	public String getE_write_date() {
		return e_write_date;
	}

	public void setE_write_date(String e_write_date) {
		this.e_write_date = e_write_date;
	}

	public String getE_image() {
		return e_image;
	}

	public void setE_image(String e_image) {
		this.e_image = e_image;
	}


	public int getEi_join() {
		return ei_join;
	}


	public void setEi_join(int ei_join) {
		this.ei_join = ei_join;
	}
}