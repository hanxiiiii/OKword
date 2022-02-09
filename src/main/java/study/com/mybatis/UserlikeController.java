package study.com.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import study.com.mybatis.dao.UserlikeDao;
import study.com.mybatis.dto.UserlikeDto;



@Controller
public class UserlikeController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/user_like_in")
	public String user_like_in(Model model ,HttpSession session,UserlikeDto uldto,HttpServletRequest request) {
		int news_id  = (Integer) session.getAttribute("news_id");
		int member_id  = (Integer) session.getAttribute("member_id");
		
		if(member_id != 99999) {
		UserlikeDao uldao=sqlSession.getMapper(UserlikeDao.class);	
		uldto.setMember_id(member_id);
		uldto.setNews_id(news_id);
		uldao.user_like_in(uldto);

		System.out.println("좋아요 등록 완료");
		}
		else {
			System.out.println("비회원");
		}
	
		return "redirect:/news_content?news_id="+news_id;
	}
	
	
	@RequestMapping("/user_like_out")
	public String user_like_out(Model model ,HttpSession session,UserlikeDto uldto,HttpServletRequest request) {
		int news_id  = (Integer) session.getAttribute("news_id");
		int like_id  = (Integer) session.getAttribute("like_id");
		
		System.out.println("뉴스취소아이디"+news_id);
		System.out.println("좋아요취소 아이디"+like_id);
		UserlikeDao uldao=sqlSession.getMapper(UserlikeDao.class);
		uldto.setLike_id(like_id);
		uldao.user_like_out(like_id);
		

		System.out.println("좋아요 취소 완료"+news_id);
		System.out.println("좋아요 취소 완료"+like_id);
		
		return "redirect:/news_content?news_id="+news_id;
	}
	
}
