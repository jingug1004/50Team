package sist.co.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.CalendarDTO;
import sist.co.model.EventDTO;
import sist.co.model.EventInviteDTO;
import sist.co.model.EventInviteMemberDTO;

@Repository
public class EventDAO {

	@Autowired
	private SqlSession sqlSession;
	private String ns="Event.";
	
	public void addEvent(EventDTO event) throws Exception {
		sqlSession.insert(ns + "addEvent", event);
	}
	
	public boolean updateEvent(EventDTO event) throws Exception {
		sqlSession.update(ns + "updateEvent", event);
		return true;
	}
	
	public boolean deleteEvent(int seq) throws Exception {
		sqlSession.delete(ns + "deleteEvent", seq);
		return true;
	}
	
	public List<EventDTO> selectEventDayList(CalendarDTO calendar) {
		return sqlSession.selectList(ns + "selectEventDayList", calendar);
	}
	
	public List<EventDTO> selectEventList(CalendarDTO calendar) {
		return sqlSession.selectList(ns + "selectEventList", calendar);
	}
	
	public List<EventDTO> selectEventInviteList(CalendarDTO calendar) {
		return sqlSession.selectList(ns + "selectEventInviteList", calendar);
	}
	
	public EventDTO selectEventDetail(int seq) {
		return sqlSession.selectOne(ns + "selectEventDetail", seq);
	}
	
	public EventDTO selectEventInvite(EventDTO event) {
		return sqlSession.selectOne(ns + "selectEventInvite", event);
	}
	
	public EventInviteMemberDTO selectEventInviteMember(EventInviteDTO eventInvite) {
		return sqlSession.selectOne(ns + "selectEventInviteMember", eventInvite);
	}
	
	public List<EventInviteDTO> selectEventInviteResult(int seq) {
		return sqlSession.selectList(ns + "selectEventInviteResult", seq);
	}
	
	public void insertEventInvite(HashMap<String, List<EventInviteDTO>> inviteList) {
		sqlSession.insert(ns + "insertEventInvite", inviteList);
	}
	
	public boolean updateEventInvite(EventDTO event) {
		sqlSession.update(ns + "updateEventInvite", event);
		return true;
	}
	
	public boolean deleteEventInvite(int seq) {
		sqlSession.delete(ns + "deleteEventInvite", seq);
		return true;
	}
}