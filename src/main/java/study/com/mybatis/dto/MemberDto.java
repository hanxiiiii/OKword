package study.com.mybatis.dto;

public class MemberDto {
	
	private int member_id,member_state,member_like_subject;
	private String member_name,member_writetime,member_social,member_userid,member_nickname;
	
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getMember_state() {
		return member_state;
	}
	public void setMember_state(int member_state) {
		this.member_state = member_state;
	}
	public int getMember_like_subject() {
		return member_like_subject;
	}
	public void setMember_like_subject(int member_like_subject) {
		this.member_like_subject = member_like_subject;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_writetime() {
		return member_writetime;
	}
	public void setMember_writetime(String member_writetime) {
		this.member_writetime = member_writetime;
	}
	public String getMember_social() {
		return member_social;
	}
	public void setMember_social(String member_social) {
		this.member_social = member_social;
	}
	public String getMember_userid() {
		return member_userid;
	}
	public void setMember_userid(String member_userid) {
		this.member_userid = member_userid;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	
}

