package sist.co.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.NewsFeedDTO;
import sist.co.model.NewsFeedLikeDTO;
import sist.co.model.NewsFeedListDTO;
import sist.co.service.NewsFeedDAO;
import sist.co.service.NewsFeedService;

@Service
public class NewsFeedImpl implements NewsFeedService {
	
	@Autowired
	private NewsFeedDAO newsFeeDAO;

	@Override
	public void writeNewsFeed(NewsFeedDTO dto) {
			newsFeeDAO.writeNewsFeed(dto);
	}

	@Override
	public void writeNewsFeedImage(NewsFeedDTO dto) {
			newsFeeDAO.writeNewsFeedImage(dto);		
	}

	@Override
	public List<NewsFeedDTO> getNewsFeedList(NewsFeedListDTO newsfeedlistDTO) {
		return newsFeeDAO.getNewsFeedList(newsfeedlistDTO);
	}

	@Override
	public List<NewsFeedDTO> addPrintNewsFeed(NewsFeedListDTO newsfeedlistDTO) {
		return newsFeeDAO.addPrintNewsFeed(newsfeedlistDTO);
	}

	@Override
	public void updateShow(HashMap<String, Integer> map){
			newsFeeDAO.updateShow(map);
		
	}

	@Override
	public void deleteNews(int seq) {
		newsFeeDAO.deleteNews(seq);
		
	}

	@Override
	public String getImageFile(int seq) {

		return newsFeeDAO.getImageFile(seq);
	}

	@Override
	public void insertLike(NewsFeedLikeDTO dto) {
		newsFeeDAO.insertLike(dto);
		
	}

	@Override
	public int getLikeListCount(NewsFeedLikeDTO dto) {
		// TODO Auto-generated method stub
		return newsFeeDAO.getLikeListCount(dto);
	}

	@Override
	public void deleteLike(NewsFeedLikeDTO dto) {
		newsFeeDAO.deleteLike(dto);	
	}

	@Override
	public List<String> getLikeList(int seq) {
		// TODO Auto-generated method stub
		return newsFeeDAO.getLikeList(seq);
	}

	@Override
	public void insertComment(NewsFeedDTO dto) {
		newsFeeDAO.insertComment(dto);
		
	}

	@Override
	public List<NewsFeedDTO> getAllNewsFeedList() {
		return newsFeeDAO.getAllNewsFeedList();
	}

	@Override
	public void updateNewsfeed(NewsFeedDTO dto) {
		newsFeeDAO.updateNewsfeed(dto);
	}

	
	

	
}
