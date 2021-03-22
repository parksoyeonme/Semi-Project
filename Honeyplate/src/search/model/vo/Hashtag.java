package search.model.vo;

public class Hashtag {


	private String hashtag_keyword;
	
	

	public Hashtag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Hashtag(String hashtag_keyword) {
		super();
		this.hashtag_keyword = hashtag_keyword;
	}

	public String getHashtag_keyword() {
		return hashtag_keyword;
	}

	public void setHashtag_keyword(String hashtag_keyword) {
		this.hashtag_keyword = hashtag_keyword;
	}

	@Override
	public String toString() {
//		return "Hashtag [hashtag_keyword=" + hashtag_keyword + "]";
		return hashtag_keyword;
	}
	
	

	
	

}
