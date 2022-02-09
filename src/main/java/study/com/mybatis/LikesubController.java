package study.com.mybatis;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import study.com.mybatis.dao.KwordDao;
import study.com.mybatis.dao.MemberDao;
import study.com.mybatis.dto.MemberDto;

@Controller
public class LikesubController {
	@Autowired
	private SqlSession sqlSession;

	@ResponseBody
	@RequestMapping(value="/like_change", produces = "application/String; charset=utf-8")
	public String like_change(HttpServletRequest request,HttpSession session){	
		try {
			int member_id= Integer.parseInt(request.getParameter("member_id"));		
			int sub= Integer.parseInt(request.getParameter("sub"));		
			System.out.println(sub);
			System.out.println(member_id);
			MemberDao mdao = sqlSession.getMapper(MemberDao.class);
			MemberDto mdto = new MemberDto();
			mdto.setMember_like_subject(sub);
			mdto.setMember_id(member_id);
			mdao.like_change(mdto);
			session.setAttribute("like_subject", sub);
			return "1";
		}catch (Exception e) {
			return "0";
		}
	}	
}
