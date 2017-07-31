package sist.co.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.FriendDTO;
import sist.co.service.FriendDAO;
import sist.co.service.FriendService;
import sist.co.model.MemberDTO;

@Service
public class FriendServiceImpl implements FriendService{

	@Autowired
	private FriendDAO frienddao;
	
	@Override
	public List<FriendDTO> getFriendsList(String m_id) throws Exception {
		return frienddao.getFriendsList(m_id);
	}

	@Override
	public MemberDTO getFriendsInformation(String f_id) throws Exception {
		return frienddao.getFriendsInformation(f_id);
	}

	@Override
	public List<FriendDTO> getAskFriendsList(String m_id) throws Exception {
		return frienddao.getAskFriendsList(m_id);
	}

	@Override
	public List<FriendDTO> getAnsFriendsList(String m_id) throws Exception {
		return frienddao.getAnsFriendsList(m_id);
	}
	
	//그룹별 친구 관리
	@Override
	public List<String> getFamilyList(String m_id) throws Exception {
		return frienddao.getFamilyList(m_id);
	}

	@Override
	public List<String> getBestFriendsList(String m_id) throws Exception {
		return frienddao.getBestFriendsList(m_id);
	}

	@Override
	public List<FriendDTO> getKnowList(String m_id) throws Exception {
		return frienddao.getKnowList(m_id);
	}

	@Override
	public List<String> getBlockList(String m_id) throws Exception {
		return frienddao.getBlockList(m_id);
	}

	// 친구가 맺은 총 친구 인원수 출력
	@Override
	public int getFriendsTotalNumOfFriends(String m_id) throws Exception {	
		return frienddao.getFriendsTotalNumOfFriends(m_id);
	}

	@Override
	public List<MemberDTO> searchsomeone(MemberDTO memberdto) throws Exception {
		return frienddao.searchsomeone(memberdto);
	}

	@Override
	public boolean befriend(FriendDTO friendDTO) throws Exception {
		return frienddao.befriend(friendDTO);
	}
	
	@Override
	public boolean befriendupate(FriendDTO friendDTO) throws Exception {
		return frienddao.befriendupate(friendDTO);
	}	

	@Override
	public boolean accept(FriendDTO friendDTO) throws Exception {
		return frienddao.accept(friendDTO);
	}

	@Override
	public boolean refuse(FriendDTO friendDTO) throws Exception {
		return frienddao.refuse(friendDTO);
	}

	@Override
	public boolean cancle(FriendDTO friendDTO) throws Exception {
		return frienddao.cancle(friendDTO);
	}

	@Override
	public boolean stranger(FriendDTO friendDTO) throws Exception {
		return frienddao.stranger(friendDTO);
	}

	@Override
	public boolean block(FriendDTO friendDTO) throws Exception {
		return frienddao.block(friendDTO);
	}
	
	@Override
	public boolean blockupdate(FriendDTO friendDTO) throws Exception {
		return frienddao.blockupdate(friendDTO);
	}

	@Override
	public boolean changegroup(FriendDTO friendDTO) throws Exception {
		return frienddao.changegroup(friendDTO);
	}

	@Override
	public int confirmdata(FriendDTO friendDTO) throws Exception {
		return frienddao.confirmdata(friendDTO);
	}

	@Override
	public List<String> blockme(String m_id) throws Exception {
		return frienddao.blockme(m_id);
	}

	@Override
	public String youblockme(FriendDTO friendDTO) throws Exception {
		return frienddao.youblockme(friendDTO);
	}


	

	
	
	

	
	
}
