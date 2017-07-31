package sist.co.service;

import java.util.HashMap;
import java.util.List;

import sist.co.model.CalendarDTO;
import sist.co.model.EventDTO;
import sist.co.model.EventInviteDTO;
import sist.co.model.EventInviteMemberDTO;

public interface EventService {

	void addEvent(EventDTO event) throws Exception;
	boolean updateEvent(EventDTO event) throws Exception;
	boolean deleteEvent(int seq) throws Exception;
	List<EventDTO> selectEventDayList(CalendarDTO calendar) throws Exception;
	List<EventDTO> selectEventList(CalendarDTO calendar) throws Exception;
	List<EventDTO> selectEventInviteList(CalendarDTO calendar) throws Exception;
	EventDTO selectEventDetail(int seq) throws Exception;
	EventDTO selectEventInvite(EventDTO event) throws Exception;
	EventInviteMemberDTO selectEventInviteMember(EventInviteDTO eventInvite) throws Exception;
	List<EventInviteDTO> selectEventInviteResult(int seq);
	void insertEventInvite(HashMap<String, List<EventInviteDTO>> inviteList) throws Exception;
	boolean updateEventInvite(EventDTO event) throws Exception;
	boolean deleteEventInvite(int seq) throws Exception;
}