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
import study.com.mybatis.dao.NewsDao;
import study.com.mybatis.dto.CommentDto;
import study.com.mybatis.dto.NewsDto;
import study.com.mybatis.dto.UserlikeDto;
import study.com.mybatis.login.NaverLoginBO;
import study.com.mybatis.login.login;

@Controller
public class NewsController {
	@Autowired
	private SqlSession sqlSession;
	private NaverLoginBO naverLoginBO;
	login login = new login();
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}

	
	@RequestMapping("/news_list")
	public String word(Model model ,HttpSession session,NewsDto ndto,HttpServletRequest request) {
//뉴스리스트 시간데이터와 서브메뉴로 불러오기		
		String news_writetime  = (String) session.getAttribute("news_writetime");
		
		if(news_writetime != null) {
			int sub = Integer.parseInt(request.getParameter("sub"));
			session.setAttribute("news_writetime", news_writetime);
			model.addAttribute("sub", sub);
			model.addAttribute("news_writetime", news_writetime);
			NewsDao ndao=sqlSession.getMapper(NewsDao.class);
			ArrayList<NewsDto> list2=ndao.list2(sub,news_writetime);
			session.setAttribute("member_id", list2.get(0).getMember_id());
			Integer news_count = ndao.news_count(ndto);
			session.setAttribute("news_count", news_count);
			model.addAttribute("list2", list2);
		}
		return "news_list";
	}
	
//뉴스 상세페이지	
	@RequestMapping("/news_content")
	public String news_content(Model model ,HttpSession session,NewsDto ndto,HttpServletRequest request,UserlikeDto uldto) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);	
		int news_id =Integer.parseInt(request.getParameter("news_id"));
		int member_id = 99999;
		if(session.getAttribute("member_id") != null) {
			member_id = (Integer) session.getAttribute("member_id");
		}
			session.setAttribute("news_id", news_id);
			NewsDao ndao=sqlSession.getMapper(NewsDao.class);
			Integer num = ndao.like_id_chk(member_id,news_id);	
			UserlikeDto select = ndao.like_id_select(member_id,news_id);	
			System.out.println(" 뉴스상세페이지news_id"+news_id);
			System.out.println("뉴스상세페이지member_id"+member_id);
			System.out.println("뉴스상세페이지num"+ num);
			session.setAttribute("num", num);
			if(num != 0) {
				session.setAttribute("like_id", select.getLike_id());
				int like_id = (Integer) session.getAttribute("like_id");
				System.out.println("마이페이지에서 이동한 뉴스상세페이지"+like_id);
			}
			
			session.setAttribute("sub", request.getParameter("sub"));
			ndto=ndao.news_content(news_id);
			model.addAttribute("ndto",ndto);
	
			//댓글리스트
			CommentDao cdao=sqlSession.getMapper(CommentDao.class);
			String nickname  = (String) session.getAttribute("nickname");
			System.out.println("코멘트"+news_id);
			ArrayList<CommentDto> clist=cdao.clist(news_id);
			model.addAttribute("clist",clist);
	
		return "news_content";
	}


	
}
