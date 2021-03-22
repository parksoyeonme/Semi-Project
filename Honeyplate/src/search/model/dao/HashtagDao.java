package search.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import search.model.vo.Hashtag;



public class HashtagDao {
	
	private Properties prop = new Properties();
	
	public HashtagDao() {
		String fileName = "/sql/search/search-query.properties";
		String path = HashtagDao.class.getResource(fileName).getPath();
		
//		System.out.println("path@MemberDao = " + path);
//		System.out.println("prop@MemberDao = " + prop);
		
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Hashtag> selectAll(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAll");
		ArrayList<Hashtag> hashtagList = new ArrayList<Hashtag>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hashtag h = new Hashtag();
				h.setHashtag_keyword(rset.getString("hashtag_keyword"));
				hashtagList.add(h);				
			}
//			System.out.println(hashtagList + "a");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return hashtagList;
	}

	
	
	

	
	
	
	
	
	
	
	
	

}
