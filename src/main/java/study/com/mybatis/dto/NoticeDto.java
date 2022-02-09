package study.com.mybatis.dto;

public class NoticeDto {

	private int notice_id;
	private String notice_title,notice_content,notice_writetime;
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_writetime() {
		return notice_writetime;
	}
	public void setNotice_writetime(String notice_writetime) {
		this.notice_writetime = notice_writetime;
	}
	
	
	
}
