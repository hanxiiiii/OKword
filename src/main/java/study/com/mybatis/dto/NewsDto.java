package study.com.mybatis.dto;

public class NewsDto {
	private String news_title,news_content,news_img,news_writetime,news_url,news_dateline;
	private int news_id,news_subject,like_id,member_id,sub,num;
	
	
	

	public int getSub() {
		return sub;
	}
	public void setSub(int sub) {
		this.sub = sub;
	}
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public String getNews_img() {
		return news_img;
	}
	public void setNews_img(String news_img) {
		this.news_img = news_img;
	}
	public String getNews_writetime() {
		return news_writetime;
	}
	public void setNews_writetime(String news_writetime) {
		this.news_writetime = news_writetime;
	}
	public String getNews_url() {
		return news_url;
	}
	public void setNews_url(String news_url) {
		this.news_url = news_url;
	}
	public String getNews_dateline() {
		return news_dateline;
	}
	public void setNews_dateline(String news_dateline) {
		this.news_dateline = news_dateline;
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public int getNews_subject() {
		return news_subject;
	}
	public void setNews_subject(int news_subject) {
		this.news_subject = news_subject;
	}
	
	
}
