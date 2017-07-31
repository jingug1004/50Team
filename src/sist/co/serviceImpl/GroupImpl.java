package sist.co.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import sist.co.service.GroupDAO;
import sist.co.service.GroupService;
@Service
public class GroupImpl implements GroupService {

	@Autowired
	private GroupDAO groupDAO;
	
	@Override
	public boolean group_make(GroupMakeDTO group) throws Exception {
		return groupDAO.group_make(group);
	}

	@Override
	public GroupMakeDTO select_make_group(GroupMakeDTO group) throws Exception {
		
		return groupDAO.select_make_group(group);
	}

	@Override
	public boolean add_group_manager(GroupMemberDTO member) throws Exception {

		return groupDAO.add_group_manager(member);
	}

	@Override
	public List<GroupListDTO> group_list(GroupListDTO gdto) throws Exception {
		return groupDAO.group_list(gdto);
	}

	@Override
	public GroupMakeDTO group_detail(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_detail(gmake);
	}

	@Override
	public List<GroupMemberListDTO> group_mem_list(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_mem_list(gmake);
	}

	@Override
	public List<GroupMemberListDTO> group_mem_admin_list(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_mem_admin_list(gmake);
	}

	@Override
	public List<GroupMemberListDTO> group_mem_reply_list(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_mem_reply_list(gmake);
	}

	@Override
	public List<GroupMemberListDTO> group_mem_block_list(GroupMakeDTO gmake) throws Exception {
		
		return groupDAO.group_mem_block_list(gmake);
	}

	@Override
	public List<GroupMakeDTO> recommend_group_list(GroupListDTO glist) throws Exception {
		return groupDAO.recommend_group_list(glist);
	}

	@Override
	public boolean groupimageUpload(GroupMakeDTO gmake) throws Exception {
		return 	groupDAO.groupimageUpload(gmake);
	}

	@Override
	public List<GroupPhotoDTO> group_photo(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_photo(gmake);
	}

	@Override
	public List<GroupPhotoDTO> group_video(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_video(gmake);
	}


	@Override
	public boolean make_vote(VoteDTO vote) throws Exception {
		return groupDAO.make_vote(vote);
	}

	@Override
	public VoteDTO select_make_vote(VoteDTO vote) throws Exception {
		
		return groupDAO.select_make_vote(vote);
	}

	@Override
	public boolean add_vote(VotelistDTO vdto) throws Exception {
		
		return groupDAO.add_vote(vdto);
	}

	@Override
	public boolean add_newsfeed(VoteDTO vdto) throws Exception {
		return groupDAO.add_newsfeed(vdto);
	}

	@Override
	public List<GroupPhotoDTO> filelist(GroupMakeDTO gmake) throws Exception {
		return groupDAO.filelist(gmake);
	}
	@Override
	public List<GroupPhotoDTO> upfilelist(GroupMakeDTO gmake) throws Exception {
		return groupDAO.upfilelist(gmake);
	}

	@Override
	public boolean group_join_request(GroupRequestDTO rdto) throws Exception {
		return groupDAO.group_join_request(rdto);
	}

	@Override
	public List<GroupMemberDTO> join_search(GroupRequestDTO rdto) throws Exception {
		return groupDAO.join_search(rdto);
		 
	}
	@Override
	public List<GroupRequestDTO> join_requset_search(GroupRequestDTO rdto) throws Exception {
		return groupDAO.join_requset_search(rdto);
	}

	@Override
	public List<GroupRequestDTO> requset_list(GroupMakeDTO gmake) throws Exception {
		return groupDAO.requset_list(gmake);
	}

	@Override
	public boolean accept_group(GroupRequestDTO gdto) throws Exception {
		return groupDAO.accept_group(gdto);
	}

	@Override
	public boolean no_accept_group(GroupRequestDTO gdto) throws Exception {
		return groupDAO.no_accept_group(gdto);
	}

	@Override
	public boolean add_group_member(GroupRequestDTO gdto) throws Exception {
		return groupDAO.add_group_member(gdto);
	}

	@Override
	public List<GroupMemberDTO> select_mem(GroupMemberDTO g_memdto) throws Exception {
		 return groupDAO.select_mem(g_memdto);
	}

	@Override
	public boolean out_groupjoin(GroupMemberDTO gdto) throws Exception {
		return groupDAO.out_groupjoin(gdto);
	}

	@Override
	public boolean out_groupmember(GroupMemberDTO gdto) throws Exception {
		return groupDAO.out_groupmember(gdto);
	}
	// 테스트

	@Override
	public void group_writeNewsFeed(NewsFeedDTO ndto) {
		groupDAO.group_writeNewsFeed(ndto);
		
	}

	@Override
	public void group_writeNewsFeedImage(NewsFeedDTO ndto) {
		groupDAO.group_writeNewsFeedImage(ndto);
		
	}

	@Override
	public List<GroupPhotoDTO> group_newsfeed_list(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_newsfeed_list(gmake);
	}

	@Override
	public List<GroupPhotoDTO> group_add_newsfeed_list(GroupListDTO gdto) throws Exception {
		return groupDAO.group_add_newsfeed_list(gdto);
	}

	@Override
	public GroupPhotoDTO group_newsfeed_p_form(int n_seq) throws Exception {
		return groupDAO.group_newsfeed_p_form(n_seq);
	}
	@Override
	public GroupPhotoDTO group_newsfeed_v_form(int n_seq) throws Exception {
		return groupDAO.group_newsfeed_v_form(n_seq);
	}

	@Override
	public VoteDTO group_newsfeed_b_form( VoteDTO vo) throws Exception {
		return groupDAO.group_newsfeed_b_form(vo);
	}

	@Override
	public List<VoterDTO> find_voter(VoteDTO vo) throws Exception {
		return groupDAO.find_voter(vo);
	}

	@Override
	public boolean add_voter(VoterDTO vo) throws Exception {
		return groupDAO.add_voter(vo);
	}

	@Override
	public List<VotelistDTO> vote_result(VoterDTO vo) throws Exception {
		return groupDAO.vote_result(vo);
	}

	@Override
	public VoterDTO my_vote(VoterDTO vo) throws Exception {
		return groupDAO.my_vote(vo);
	}

	@Override
	public List<GroupPhotoDTO> group_coment(GroupPhotoDTO gdto) throws Exception {
		return groupDAO.group_coment(gdto);
	}

	@Override
	public List<GroupPhotoDTO> group_add_coment(GroupPhotoDTO gdto) throws Exception {
		return groupDAO.group_add_coment(gdto);
	}

	@Override
	public List<GroupMakeDTO> group_local_find(GroupMakeDTO gdto) throws Exception {
		return groupDAO.group_local_find(gdto);
	}

	@Override
	public boolean group_name_update(GroupMakeDTO gdto) throws Exception {
		return groupDAO.group_name_update(gdto);
	}
	
	
	
}
