package study.com.mybatis.dto;

public class ChatDto {
	private int chat_id,member_id,chat_delete_admin,subject_id;
	private String chat_content,chat_writetime;
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getChat_delete_admin() {
		return chat_delete_admin;
	}
	public void setChat_delete_admin(int chat_delete_admin) {
		this.chat_delete_admin = chat_delete_admin;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public String getChat_writetime() {
		return chat_writetime;
	}
	public void setChat_writetime(String chat_writetime) {
		this.chat_writetime = chat_writetime;
	}
	
	
	
}
