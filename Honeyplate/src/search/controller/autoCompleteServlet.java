package search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search.model.service.HashtagService;
import search.model.vo.Hashtag;

/**
 * Servlet implementation class autoComplete
 */
@WebServlet("/autoComplete")
public class autoCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HashtagService hashtagService = new HashtagService();  
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//1.사용자입력값 처리
		String searchHashtags = request.getParameter("searchHashtags");
//		System.out.println("searchHashtags = " + searchHashtags  );
	//2.업무로직
		List<Hashtag> hashtagList = hashtagService.selectAll();
		StringBuilder ht = new StringBuilder();
		for(Hashtag hashtag : hashtagList) {
//			System.out.println(hashtag);
			if(hashtag.getHashtag_keyword().contains(searchHashtags)) {
//				System.out.println(hashtag + searchHashtags + "servlet");
				ht.append(hashtag);
				ht.append(",");
			}

		}
		if(ht.length() > 0)
			ht = new StringBuilder(ht.substring(0, ht.length() - 1));
//		System.out.println(ht );
		
		//3.응답에 작성
		response.setContentType("text/csv; charset=utf-8");
		response.getWriter()
				.append(ht);
	}

}
