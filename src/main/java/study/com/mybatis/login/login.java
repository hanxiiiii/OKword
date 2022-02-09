package study.com.mybatis.login;

import javax.servlet.http.HttpSession;

public class login {
	public int member_id(HttpSession session) {
		int member_id  = (Integer) session.getAttribute("member_id");
		return member_id;
	}
	public String name(HttpSession session) {
		String name  = (String) session.getAttribute("name");
		return name;
	}
	
	public String user_id(HttpSession session) {
		String user_id  = (String) session.getAttribute("user_id");
		return user_id;
	}
	
	public String nickname(HttpSession session) {
		String nickname  = (String) session.getAttribute("nickname");
		return nickname;
	}
	public int state(HttpSession session) {
		int state  = (Integer) session.getAttribute("state");
		return state;
	}
	public String New_nickname(HttpSession session) {
		String New_nickname  = (String) session.getAttribute("New_nickname");
		return New_nickname;
	}
	public String social(HttpSession session) {
		String social  = (String) session.getAttribute("social");
		return social;
	}
	public int like_subject(HttpSession session) {
		int like_subject  = (Integer) session.getAttribute("like_subject");
		return like_subject;
	}

	
}