package study.com.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import study.com.mybatis.dao.CommentDao;
import study.com.mybatis.dto.CommentDto;
import study.com.mybatis.login.login;


@Controller
public class Comment_Controller {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/comment_view_all_ok")
	public String comment_view_all_ok(HttpServletRequest request,Model model,CommentDto cdto,HttpSession session)
	{	
		
		login login = new login();
		int member_id_session  = login.member_id(session);
		System.out.println("댓글입력후페이지1234");
		session.setAttribute("member_id_session", member_id_session);
		
		System.out.println("댓글입력후페이지"+member_id_session);
		
		//댓글입력
		
		CommentDao cdao=sqlSession.getMapper(CommentDao.class);
		cdto.setMember_id(member_id_session);
		cdao.comment_view_all_ok(cdto);
		System.out.println("댓글입력후 첫동작"+member_id_session);
		//댓글리스트
		int news_id =Integer.parseInt(request.getParameter("news_id"));
		System.out.println("코멘트 오케이"+news_id);
		ArrayList<CommentDto> clist=cdao.clist(news_id);
		model.addAttribute("clist",clist);
		System.out.println("댓글입력후 두번째동작"+member_id_session);
		return "redirect:/news_content?news_id="+news_id;
		
	}
	@RequestMapping("/comment_delete")
	public String comment_delete(HttpServletRequest request)
	{
		int comment_id=Integer.parseInt(request.getParameter("comment_id"));
		CommentDao cdao=sqlSession.getMapper(CommentDao.class);
		cdao.comment_delete(comment_id);
		
		String referer = (String)request.getHeader("REFERER");
		String[] referer3 = referer.split("/");
		String referer4 = referer3[referer3.length-1];
		String referer2 = referer.substring(21);
		return "redirect:"+referer4;
	}

}
