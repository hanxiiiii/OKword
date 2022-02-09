package study.com.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import study.com.mybatis.dao.NoticeDao;
import study.com.mybatis.dto.NoticeDto;



@Controller
public class Notice_Controller {
	
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping("/notice_list")
	public String notice_list(Model model,HttpServletRequest request)
	{
		NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
		
		// 원하는 페이지 값의 index를 계산하여 메소드에 전달
		int index; // 1페이지 => 0, 2페이지 4로 만들기
		int page;
		
		// 사용자가 페이지값을 보내지 않는 경우 => 게시판에 처음 접근할때
		
		if(request.getParameter("page")==null)
		{
			page=1;
			index=0;
		}
		else// 사용자가 페이지 값을 보내는 경우 
		{
			page=Integer.parseInt(request.getParameter("page"));
			index=(page-1)*4;
		}
		
		//다음 페이지 이동을 위한 링크
		int pstart = page/4;
		if (page%4 == 0)  // 4의 배수일 경우에만
			pstart=pstart-1;
		
		pstart=(pstart*4)+1;
		int pend=pstart+3;
		
		// 검색에 필요한 필드값과 검색어를 가져와서 검색을 한다.
		   
		   String cla,sword;
		   if(request.getParameter("cla")==null)
			   cla="notice_title";
		   else
		       cla=request.getParameter("cla");
		   
		   if(request.getParameter("sword")==null)
			   sword="";
		   else
		       sword=request.getParameter("sword");
		System.out.println("Test");
		ArrayList <NoticeDto> list=ndao.notice_list(sword,index);
		model.addAttribute("list",list);
		model.addAttribute("pstart",pstart);
		System.out.println(sword);
		System.out.println(index);
		model.addAttribute("page",page);
		Integer pagecnt=ndao.get_pagecnt();
		model.addAttribute("pagecnt",pagecnt);
		
		if(pend > pagecnt)
			pend=pagecnt;
		model.addAttribute("pend",pend);
		
		
		return "/notice_list";
	}
	@RequestMapping("/notice_content")
	public String notice_content(HttpServletRequest request,Model model)
	{
		String id=request.getParameter("id");
		NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
		NoticeDto ndto=ndao.notice_content(id);
		model.addAttribute("ndto",ndto);
		
		
		return "/notice_content";
		
		
	}
	
}
