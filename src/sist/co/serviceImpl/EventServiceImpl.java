package sist.co.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.CalendarDTO;
import sist.co.model.EventDTO;
import sist.co.model.EventInviteDTO;
import sist.co.model.EventInviteMemberDTO;
import sist.co.service.EventDAO;
import sist.co.service.EventService;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDAO;
	
	@Override
	public void addEvent(EventDTO event) throws Exception {
		eventDAO.addEvent(event);
	}

	@Override
	public boolean updateEvent(EventDTO event) throws Exception {
		return eventDAO.updateEvent(event);
	}

	@Override
	public boolean deleteEvent(int seq) throws Exception {
		return eventDAO.deleteEvent(seq);
	}

	@Override
	public List<EventDTO> selectEventDayList(CalendarDTO calendar) throws Exception {
		return eventDAO.selectEventDayList(calendar);
	}

	@Override
	public List<EventDTO> selectEventList(CalendarDTO calendar) throws Exception {
		return eventDAO.selectEventList(calendar);
	}
	
	@Override
	public List<EventDTO> selectEventInviteList(CalendarDTO calendar) throws Exception {
		return eventDAO.selectEventInviteList(calendar);
	}

	@Override
	public EventDTO selectEventDetail(int seq) throws Exception {
		return eventDAO.selectEventDetail(seq);
	}

	@Override
	public EventDTO selectEventInvite(EventDTO event) throws Exception {
		return eventDAO.selectEventInvite(event);
	}

	@Override
	public EventInviteMemberDTO selectEventInviteMember(EventInviteDTO eventInvite) throws Exception {
		return eventDAO.selectEventInviteMember(eventInvite);
	}

	@Override
	public List<EventInviteDTO> selectEventInviteResult(int seq) {
		return eventDAO.selectEventInviteResult(seq);
	}

	@Override
	public void insertEventInvite(HashMap<String, List<EventInviteDTO>> inviteList) throws Exception {
		eventDAO.insertEventInvite(inviteList);
	}

	@Override
	public boolean updateEventInvite(EventDTO event) throws Exception {
		return eventDAO.updateEventInvite(event);
	}

	@Override
	public boolean deleteEventInvite(int seq) throws Exception {
		return eventDAO.deleteEventInvite(seq);
	}
}