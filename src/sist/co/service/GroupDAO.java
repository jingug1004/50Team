package sist.co.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;
import sist.co.model.GroupPhotoDTO;
import sist.co.model.GroupRequestDTO;
import sist.co.model.NewsFeedDTO;
import sist.co.model.VoteDTO;
import sist.co.model.VotelistDTO;
import sist.co.model.VoterDTO;

@Repository
public class GroupDAO {

	@Autowired	
	private SqlSession sqlSession;		
	private String ns="Group.";
	
	
	public boolean group_make(GroupMakeDTO group)throws Exception{
		sqlSession.insert(ns+"group_make", group);
		return true;
	}
	public GroupMakeDTO select_make_group(GroupMakeDTO group)throws Exception{
		GroupMakeDTO dto = sqlSession.selectOne(ns+"select_make_group", group);
		return dto;
	}
	
	public List<GroupMemberDTO> select_mem(GroupMemberDTO g_memdto)throws Exception{
		return sqlSession.selectList(ns+"select_mem", g_memdto);
	}
	
	public boolean add_group_manager(GroupMemberDTO member)throws Exception{
		sqlSession.insert(ns+"add_group_manager", member);
		return true;
	}
	
	public List<GroupListDTO> group_list(GroupListDTO gdto)throws Exception{
		 List<GroupListDTO> glist = sqlSession.selectList(ns+"group_list", gdto);
		return glist;
	}

	public GroupMakeDTO group_detail(GroupMakeDTO gmake)throws Exception{
		GroupMakeDTO g_make = sqlSession.selectOne(ns+"group_detail", gmake);
		return g_make;
	}
	
	public List<GroupMemberListDTO> group_mem_list(GroupMakeDTO gmake)throws Exception{
		List<GroupMemberListDTO> g_m_list = sqlSession.selectList(ns+"group_mem_list", gmake);
		return g_m_list;
	}
	public List<GroupMemberListDTO> group_mem_admin_list(GroupMakeDTO gmake)throws Exception{
		List<GroupMemberListDTO> g_m_a_list = sqlSession.selectList(ns+"group_mem_admin_list", gmake);
		return g_m_a_list;
	}
	public List<GroupMemberListDTO> group_mem_reply_list(GroupMakeDTO gmake)throws Exception{
		List<GroupMemberListDTO> g_m_r_list = sqlSession.selectList(ns+"group_mem_reply_list", gmake);
		return g_m_r_list;
	}
	public List<GroupMemberListDTO> group_mem_block_list(GroupMakeDTO gmake)throws Exception{
		List<GroupMemberListDTO> g_m_b_list = sqlSession.selectList(ns+"group_mem_block_list", gmake);
		return g_m_b_list;
	}
	
	public List<GroupMakeDTO> recommend_group_list(GroupListDTO glist)throws Exception{
		
		List<GroupMakeDTO> re_list = sqlSession.selectList(ns+"recommend_group_list", glist);
		return re_list;
	} 
	public boolean groupimageUpload(GroupMakeDTO gmake)throws Exception{
		sqlSession.update(ns+"groupimageUpload",gmake);
		return true;
	}
	
	public List<GroupPhotoDTO> group_photo(GroupMakeDTO gmake)throws Exception{
		List<GroupPhotoDTO> g_photolist = sqlSession.selectList(ns+"group_photo", gmake);
		return g_photolist;
	}
	
	public List<GroupPhotoDTO> group_video(GroupMakeDTO gmake)throws Exception{
		List<GroupPhotoDTO> g_videolist = sqlSession.selectList(ns+"group_video", gmake);
		return g_videolist;
	}
	public boolean make_vote(VoteDTO vote)throws Exception{
		sqlSession.insert(ns+"make_vote", vote);
		return true;
	}
	public VoteDTO select_make_vote(VoteDTO vote)throws Exception{
		return sqlSession.selectOne(ns+"select_make_vote", vote);
	}
	
	public boolean add_vote(VotelistDTO vdto)throws Exception{
		 sqlSession.insert(ns+"add_vote", vdto);
		 return true;
	}
	
	public boolean add_newsfeed(VoteDTO vdto)throws Exception{
		sqlSession.insert(ns+"add_newsfeed", vdto);
		return true;
	}
	
	public List<GroupPhotoDTO> filelist(GroupMakeDTO gmake)throws Exception{
		List<GroupPhotoDTO> flist = sqlSession.selectList(ns+"filelist", gmake);
		return flist;
	}
	public List<GroupPhotoDTO> upfilelist(GroupMakeDTO gmake)throws Exception{
		List<GroupPhotoDTO> flist = sqlSession.selectList(ns+"upfilelist", gmake);
		return flist;
	}
	
	public boolean group_join_request(GroupRequestDTO rdto)throws Exception{
		sqlSession.insert(ns+"group_join_request", rdto);
		return true;
	}
	
	public List<GroupMemberDTO> join_search(GroupRequestDTO rdto)throws Exception{
		return sqlSession.selectList(ns+"join_search", rdto);
	}	
	
	public List<GroupRequestDTO> join_requset_search(GroupRequestDTO rdto)throws Exception{
		return sqlSession.selectList(ns+"join_requset_search", rdto);
	}	
	
	public List<GroupRequestDTO> requset_list(GroupMakeDTO gmake)throws Exception{
		List<GroupRequestDTO> list = sqlSession.selectList(ns+"requset_list", gmake);
		return list;
	}

	public boolean accept_group(GroupRequestDTO gdto)throws Exception{
		sqlSession.update(ns+"accept_group", gdto);
		return true;
	}
	public boolean no_accept_group(GroupRequestDTO gdto)throws Exception{
		sqlSession.update(ns+"no_accept_group", gdto);
		return true;
	}
	
	public boolean add_group_member(GroupRequestDTO gdto)throws Exception{
		sqlSession.insert(ns+"add_group_member", gdto);
		return true;
	}
	
	public boolean out_groupjoin(GroupMemberDTO gdto)throws Exception{
		sqlSession.delete(ns+"out_groupjoin", gdto);
		return true;
	}
	public boolean out_groupmember(GroupMemberDTO gdto)throws Exception{
		sqlSession.delete(ns+"out_groupmember", gdto);
		return true;
	}
	// 테스트중
	public void group_writeNewsFeed(NewsFeedDTO ndto){
		sqlSession.insert(ns+"group_writeNewsFeed", ndto);
	}
	
	
	public void group_writeNewsFeedImage(NewsFeedDTO ndto){
		sqlSession.insert(ns+"group_writeNewsFeedImage", ndto);
		if (ndto.getN_form_num() == 1) {
			sqlSession.insert(ns+"group_writeNewsFeedImage2", ndto);
		}
		if (ndto.getN_form_num() == 2) {
			sqlSession.insert(ns+"group_writeNewsFeedImage3", ndto);
		}
		if (ndto.getN_form_num() == 3) {
			sqlSession.insert(ns+"group_writeNewsFeedImage4", ndto);
		}
		
	}
	
	
	//그룹 리스트
	public List<GroupPhotoDTO> group_newsfeed_list(GroupMakeDTO gmake)throws Exception{
		 List<GroupPhotoDTO> g_l_list = sqlSession.selectList(ns+"group_newsfeed_list", gmake);
		return g_l_list;
	}
	//그룹 리스트 아작스
	public List<GroupPhotoDTO> group_add_newsfeed_list(GroupListDTO gdto)throws Exception{
		 List<GroupPhotoDTO> g_l_list = sqlSession.selectList(ns+"group_add_newsfeed_list", gdto);
		return g_l_list;
	}
	
	
	//리스트 폼 
	public GroupPhotoDTO group_newsfeed_p_form(int n_seq)throws Exception{
		return sqlSession.selectOne(ns+"group_newsfeed_p_form", n_seq);
	}
	public GroupPhotoDTO group_newsfeed_v_form(int n_seq)throws Exception{
		return sqlSession.selectOne(ns+"group_newsfeed_v_form", n_seq);
	}
	public VoteDTO group_newsfeed_b_form( VoteDTO vo)throws Exception{
		return sqlSession.selectOne(ns+"group_newsfeed_b_form", vo);
	}
	
	public List<VoterDTO> find_voter(VoteDTO vo)throws Exception{
		List<VoterDTO> list = sqlSession.selectList(ns+"find_voter",vo);
		
		return  list;
	}
	
	
	// 투표 하기
	public boolean add_voter(VoterDTO vo)throws Exception{
		sqlSession.update(ns+"plus_votelist", vo);
		sqlSession.insert(ns+"add_voter", vo);
		
		 return true;
	} 
	
	public List<VotelistDTO> vote_result(VoterDTO vo)throws Exception{
		List<VotelistDTO> list= sqlSession.selectList(ns+"vote_result", vo);
		return list;
	}
	
	public VoterDTO my_vote(VoterDTO vo)throws Exception{
		return sqlSession.selectOne(ns+"my_vote", vo);
	}
	
	
	//댓글
	public List<GroupPhotoDTO> group_coment(GroupPhotoDTO gdto)throws Exception{
		return sqlSession.selectList(ns+"group_coment", gdto);
	}
	
	public List<GroupPhotoDTO> group_add_coment(GroupPhotoDTO gdto)throws Exception{
		return sqlSession.selectList(ns+"group_add_coment", gdto);
	}
	
	public List<GroupMakeDTO> group_local_find(GroupMakeDTO gdto)throws Exception{
		return sqlSession.selectList(ns+"group_local_find", gdto);
	}
	
	public boolean group_name_update(GroupMakeDTO gdto)throws Exception{
		 sqlSession.update(ns+"group_name_update", gdto);
		 
		 return true;
	}
	
}
