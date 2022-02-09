package study.com.mybatis.dto;

public class UserlikeDto {

	private int like_id,news_id,member_id,num;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getLike_id() {
		return like_id;
	}

	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}

	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
	
}
