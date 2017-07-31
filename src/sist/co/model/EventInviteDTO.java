package sist.co.model;

import java.io.Serializable;
import java.util.List;

public class EventInviteDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int		e_seq;
	private String	m_id;
	private int		ei_join;
	private String	ei_write_date;
	
	public EventInviteDTO() {}

	public EventInviteDTO(int e_seq, String m_id, int ei_join, String ei_write_date) {
		super();
		this.e_seq = e_seq;
		this.m_id = m_id;
		this.ei_join = ei_join;
		this.ei_write_date = ei_write_date;
	}

	@Override
	public String toString() {
		return "EventInviteDTO [e_seq=" + e_seq + ", m_id=" + m_id + ", ei_join=" + ei_join + ", ei_write_date="
				+ ei_write_date + "]";
	}

	public int getE_seq() {
		return e_seq;
	}

	public void setE_seq(int e_seq) {
		this.e_seq = e_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getEi_join() {
		return ei_join;
	}

	public void setEi_join(int ei_join) {
		this.ei_join = ei_join;
	}

	public String getEi_write_date() {
		return ei_write_date;
	}

	public void setEi_write_date(String ei_write_date) {
		this.ei_write_date = ei_write_date;
	}
}