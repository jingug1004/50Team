package sist.co.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sist.co.model.FriendDTO;
import sist.co.model.MemberDTO;

import java.util.ArrayList;
import java.util.List;

@Repository
public class FriendDAO {

	@Autowired
	private SqlSession sqlSession;
	private String ns="Friend.";
	
	public List<FriendDTO> getFriendsList(String m_id) throws Exception{
		List<FriendDTO> list = new ArrayList<FriendDTO>();
		list = sqlSession.selectList(ns+"getFriendsList", m_id);
		return list;
	}
	
	public MemberDTO getFriendsInformation(String f_id) throws Exception{
		return sqlSession.selectOne(ns+"getFriendsInformation", f_id);
	}
	
	public List<FriendDTO> getAskFriendsList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getAskFriendsList", m_id);
	}
	
	public List<FriendDTO> getAnsFriendsList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getAnsFriendsList", m_id);
	}

	//그룹별 친구 리스트
	public List<String> getFamilyList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getFamilyList", m_id);
	}

	public List<String> getBestFriendsList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getBestFriendsList", m_id);
	}

	public List<FriendDTO> getKnowList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getKnowList", m_id);
	}
	
	public List<String> getBlockList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getBlockList", m_id);
	}
	
	//친구가 맺은  총 친구 인원수 출력 
	public int getFriendsTotalNumOfFriends(String m_id) throws Exception{
		return sqlSession.selectOne(ns+"getFriendsTotalNumOfFriends", m_id);
	}
	
	//친구 외 검색
	public List<MemberDTO> searchsomeone(MemberDTO memberdto) throws Exception{
		return sqlSession.selectList(ns+"searchsomeone", memberdto);
	}
	
	//친구맺기(친구 요청 보내기) : 기존 데이터 존재 x
	public boolean befriend(FriendDTO friendDTO) throws Exception{
		sqlSession.insert(ns+"befriend", friendDTO);
		return true;
	}
	
	//친구맺기(친구 요청 보내기) : 기존 데이터 존재 o
	public boolean befriendupate(FriendDTO friendDTO) throws Exception{
		sqlSession.update(ns+"befriendupdate", friendDTO);
		return true;
	}
	
	
	// 친구요청 수락 (받은 친구요청)
	public boolean accept(FriendDTO friendDTO) throws Exception{
		sqlSession.update(ns+"acceptupdate", friendDTO);
		sqlSession.insert(ns+"acceptinsert", friendDTO);
		return true;
	}
	
	// 친구요청 거절 (받은 친구요청)
	public boolean refuse(FriendDTO friendDTO) throws Exception{
		sqlSession.delete(ns+"refuse", friendDTO);
		return true;
	}
	
	// 친구요청 취소 (보낸 친구요청)
	public boolean cancle(FriendDTO friendDTO) throws Exception{
		sqlSession.delete(ns+"cancle", friendDTO);
		return true;
	}
	
	// 친구 끊기
	public boolean stranger(FriendDTO friendDTO) throws Exception{
		sqlSession.delete(ns+"cancle", friendDTO);
		sqlSession.delete(ns+"refuse", friendDTO);
		return true;
	}
	
	// 차단하기  : 기존 데이터 존재 x
	public boolean block(FriendDTO friendDTO) throws Exception{
		sqlSession.insert(ns+"block", friendDTO);
		return true;
	}
	
	// 차단하기  : 기존 데이터 존재 o
	public boolean blockupdate(FriendDTO friendDTO) throws Exception{
		sqlSession.update(ns+"blockupdate", friendDTO);
		return true;
	}
	
	// 차단풀기
	public boolean cancleblock(FriendDTO friendDTO) throws Exception{
		sqlSession.delete(ns+"cancle", friendDTO);
		return true;
	}
	
	// 해당 회원을 차단한 친구 리스트
	public List<String> blockme(String m_id) throws Exception{
		return sqlSession.selectList(ns+"blockme", m_id);
	}

	// 그룹 변경
	public boolean changegroup(FriendDTO friendDTO) throws Exception{
		sqlSession.update(ns+"changegroup", friendDTO);
		return true;
	}
	
	//FRIEND TABLE에 데이터 존재 여부 확인
	public int confirmdata(FriendDTO friendDTO) throws Exception{
		return sqlSession.selectOne(ns+"confirmdata", friendDTO);
	}
	
	//친구요청관련 : 2명의 id를 넣고 차단 확인
	public String youblockme(FriendDTO friendDTO) throws Exception{
		return sqlSession.selectOne(ns+"youblockme", friendDTO);
	}
	
}
