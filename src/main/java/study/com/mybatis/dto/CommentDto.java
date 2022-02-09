package study.com.mybatis.dto;

public class CommentDto {
	
	private int comment_id,news_id,member_id,comment_delete,comment_delete_admin;
	private String comment_content,comment_writetime, member_nickname;
	
	

	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
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
	public int getComment_delete() {
		return comment_delete;
	}
	public void setComment_delete(int comment_delete) {
		this.comment_delete = comment_delete;
	}
	public int getComment_delete_admin() {
		return comment_delete_admin;
	}
	public void setComment_delete_admin(int comment_delete_admin) {
		this.comment_delete_admin = comment_delete_admin;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_writetime() {
		return comment_writetime;
	}
	public void setComment_writetime(String comment_writetime) {
		this.comment_writetime = comment_writetime;
	}
	
	
}
