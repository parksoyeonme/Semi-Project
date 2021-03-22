package search.model.service;

import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import search.model.dao.HashtagDao;
import search.model.vo.Hashtag;

public class HashtagService {
	
	private HashtagDao hashtagDao = new HashtagDao();
	
	public ArrayList<Hashtag> selectAll() {
		Connection conn = getConnection();
		ArrayList<Hashtag> hashtagList = hashtagDao.selectAll(conn);
		close(conn);
		return hashtagList;
	}
	


}
