package sist.co.service;

import java.util.HashMap;
import java.util.List;
import sist.co.model.NewsFeedDTO;
import sist.co.model.NewsFeedLikeDTO;
import sist.co.model.NewsFeedListDTO;

public interface NewsFeedService {

	public void writeNewsFeed(NewsFeedDTO dto);
	public void writeNewsFeedImage(NewsFeedDTO dto);
	public List<NewsFeedDTO> getNewsFeedList(NewsFeedListDTO newsfeedlistDTO);
	public List<NewsFeedDTO>  addPrintNewsFeed(NewsFeedListDTO newsfeedlistDTO);
	public void updateShow(HashMap<String, Integer> map);
	public void deleteNews(int seq);
	public String getImageFile(int seq);
	public void insertLike(NewsFeedLikeDTO dto);
	public int getLikeListCount (NewsFeedLikeDTO dto);
	public void deleteLike (NewsFeedLikeDTO dto);
	public List<String> getLikeList(int seq);
	public void insertComment (NewsFeedDTO dto);
	public List<NewsFeedDTO> getAllNewsFeedList();
	public void updateNewsfeed(NewsFeedDTO newsfeeddto);
}
