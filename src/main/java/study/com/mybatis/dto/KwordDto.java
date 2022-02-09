package study.com.mybatis.dto;
public class KwordDto {
	private int keyword_id, keyword_set_number, subject_id;
	private String keyword, keyword_writetime, keyword_news_list;
	public int getKeyword_id() {
		return keyword_id;
	}
	public void setKeyword_id(int keyword_id) {
		this.keyword_id = keyword_id;
	}
	public int getKeyword_set_number() {
		return keyword_set_number;
	}
	public void setKeyword_set_number(int keyword_set_number) {
		this.keyword_set_number = keyword_set_number;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getKeyword_writetime() {
		return keyword_writetime;
	}
	public void setKeyword_writetime(String keyword_writetime) {
		this.keyword_writetime = keyword_writetime;
	}
	public String getKeyword_news_list() {
		return keyword_news_list;
	}
	public void setKeyword_news_list(String keyword_news_list) {
		this.keyword_news_list = keyword_news_list;
	}
	
	
}
