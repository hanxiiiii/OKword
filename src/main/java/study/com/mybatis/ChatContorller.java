package study.com.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import study.com.mybatis.dao.ChatDao;
import study.com.mybatis.dao.MemberDao;
import study.com.mybatis.dto.ChatDto;
import study.com.mybatis.dto.MemberDto;
import study.com.mybatis.login.login;
@Controller
public class ChatContorller {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	//팝업    
    @RequestMapping("/chat")
    public String chat(HttpSession session,MemberDto mdto,Model model) {
    	String chat_message  = (String) session.getAttribute("chat_message");
		System.out.println("chat 채팅기능"+chat_message);
    	login login = new login();
		String nickname = login.nickname(session);
		String user_id = login.user_id(session);
		System.out.println(user_id);
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		MemberDto user_data = mdao.user_data(user_id);		
		model.addAttribute("mdto",user_data);    	
	    
    	return "/chat";
    }
    
    
    
    
    //채팅
    @RequestMapping(value = "/chat_message.do")
    public String chat_message(ChatDto cdto,HttpServletRequest request,HttpSession session) {
    	String chattext = request.getParameter("chattext");
    	int chat_userid = Integer.parseInt(request.getParameter("test"));
    	System.out.println("chattext"+chattext+"chat_userid"+chat_userid);
        ChatDao cdao = sqlSession.getMapper(ChatDao.class);
        System.out.println("채팅 dto값넣기");
        cdto.setMember_id(chat_userid);
    	cdto.setChat_content(chattext);
    	System.out.println("채팅 디비저장 시작");
    	cdao.Chat_write(cdto);
    	System.out.println("채팅 디비저장 완료");
    	return "/chat";
    }
    
    
    
    
}
