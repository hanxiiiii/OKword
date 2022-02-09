package study.com.mybatis;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import study.com.mybatis.dao.CommentDao;
import study.com.mybatis.dao.KwordDao;
import study.com.mybatis.dao.MemberDao;
import study.com.mybatis.dao.NewsDao;
import study.com.mybatis.dto.CommentDto;
import study.com.mybatis.dto.KwordDto;
import study.com.mybatis.dto.MemberDto;
import study.com.mybatis.dto.NewsDto;
import study.com.mybatis.login.NaverLoginBO;
import study.com.mybatis.login.login;




/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private NaverLoginBO naverLoginBO;
	login login = new login();
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/nlogin")
	   public String nlogin(Model model,HttpServletRequest request,HttpSession session) throws IOException, ParseException  { 
	      System.out.println("nlogin");
	      String referer = (String)request.getHeader("REFERER");
	      System.out.println(referer);
	      session.setAttribute("lasturl", referer);   
	      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	      System.out.println(naverAuthUrl);
	      return "redirect:"+naverAuthUrl;
	   }
	@RequestMapping("/main")
	public String main(Model model,MemberDto mdto,HttpServletRequest request,HttpSession session) throws IOException, ParseException  { 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//카카오 api 세션값으로 설정s
		model.addAttribute("url", naverAuthUrl);		
		System.out.println("시작부터 안된다");
		

		 // 키정보
	      String sub_c = request.getParameter("sub");
//	      System.out.println(sub_c);
	      int sub = 100;
	      if (sub_c != null) {
	         if (sub_c.equals("101") || sub_c.equals("102") || sub_c.equals("103") || sub_c.equals("104") 
	               || sub_c.equals("105") || sub_c.equals("106") || sub_c.equals("107") || sub_c.equals("108") ) {
	   //         System.out.println("테스트입니다");
	            sub =  Integer.parseInt(sub_c);                
	         }
	      }
	      System.out.println(sub);
	      
	      
	      // 날짜 정보
      Calendar cal = Calendar.getInstance();
      Calendar time_next = Calendar.getInstance();
      Calendar time_back = Calendar.getInstance();
      SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
        SimpleDateFormat format2 = new SimpleDateFormat("mm");
        SimpleDateFormat format3 = new SimpleDateFormat("HH");
        SimpleDateFormat ymd = new SimpleDateFormat("yyyy.MM.dd");   
        SimpleDateFormat max = new SimpleDateFormat("yyyy-MM-dd");  
        SimpleDateFormat hm = new SimpleDateFormat("HH:mm");   
        Date today = new Date();
        cal.setTime(today);
          String date = request.getParameter("date");
        System.out.println("테스트2");
        int minute_max = 47;    
 
 // 값이 없을 경우 현재시간
       if(date == null) {                
              System.out.println("테스트");
                cal.setTime(today);                
                int min_c = Integer.parseInt(format2.format(today));
                if ((min_c / 30) < 1){
                      cal.set(Calendar.MINUTE, 0);
                      cal.set(Calendar.SECOND, 0);
                }else{
                      cal.set(Calendar.MINUTE, 30);
                      cal.set(Calendar.SECOND, 0);
                }  
             date = format0.format(cal.getTime());
      }else{
            Date test_date = format0.parse(request.getParameter("date"));
//            System.out.println(test_date.getTime()-today.getTime());
            
            // 넘어 온 시간이 현재 보다 과거일경우 과거 시간으로 처리
            if ((test_date.getTime()-today.getTime())<=0) {
//               System.out.println("test2");
//               System.out.println(today);
//               System.out.println(test_date);
                int min_c = Integer.parseInt(format2.format(today));
                if ((min_c / 30) < 1){
                   System.out.println("Test");
                   cal.set(Calendar.MINUTE, 0);
                   cal.set(Calendar.SECOND, 0);
                }else{
                   System.out.println("Test2");
                   cal.set(Calendar.MINUTE, 30);
                   cal.set(Calendar.SECOND, 0);
                }
                cal.setTime(format0.parse(request.getParameter("date")));
                
                // 넘어 온 시간이 미래일경우 현재 시간으로 처리
            }else{
               System.out.println("test");
               cal.setTime(today);                
                   int min_c = Integer.parseInt(format2.format(today));
                   if ((min_c / 30) < 1){
                         cal.set(Calendar.MINUTE, 0);
                         cal.set(Calendar.SECOND, 0);
                   }else{
                         cal.set(Calendar.MINUTE, 30);
                         cal.set(Calendar.SECOND, 0);
                   }
                
            }
            date = format0.format(cal.getTime());
     }
     //30일 이전 시간일경우
       if(format0.parse(date).getTime()-format0.parse("2021-06-30 00:00:00").getTime() <= 0) {
          date = "2021-06-30 00:00:00";
          cal.setTime(format0.parse(date));
       }
       // 30분 전후 계산
      time_next = (Calendar) cal.clone();
      time_back = (Calendar) cal.clone();
      time_next.add(Calendar.MINUTE, 30);
      time_back.add(Calendar.MINUTE, -30);
		

	      String key = request.getParameter("key");
	      model.addAttribute("sub", sub);
	      model.addAttribute("date", date);
	      model.addAttribute("key", key);
	      model.addAttribute("time_next", format0.format(time_next.getTime()));
	      model.addAttribute("time_back", format0.format(time_back.getTime()));
	      model.addAttribute("ymd", ymd.format(cal.getTime()));
	      model.addAttribute("ymd2", max.format(cal.getTime()));
	      model.addAttribute("hm", hm.format(cal.getTime()));
	      model.addAttribute("max", max.format(today));
	      if(ymd.format(today).equals(ymd.format(cal.getTime()))) {
	         minute_max = Integer.parseInt(format3.format(today))*2;
//	         System.out.println(format0.format(cal.getTime()));
	         if (Integer.parseInt(format2.format(today))>=30) {
//	            System.out.println("30분");
	            minute_max = minute_max + 1;
	         } 
      }
      model.addAttribute("minute_max", minute_max);
	      KwordDao kdao = sqlSession.getMapper(KwordDao.class);
	      ArrayList<KwordDto> Klist;
	      if(sub == 100) {
	             Klist=kdao.list_100(date);
	      }else {
	             Klist=kdao.Klist(sub,date);
	      }
	      model.addAttribute("Klist", Klist);
	      if(key != null) {   
	            String news_list = kdao.news_list(Integer.parseInt(key));
//	            System.out.println(news_list);
	            ArrayList<NewsDto> news_list2= kdao.news_list2(news_list);
//	            System.out.println("text"+news_list2);
	            model.addAttribute("news_list", news_list2);
	      }                  


//채팅메시지		
		String chat_message  = (String) session.getAttribute("chat_message");

		return "/main";
	}

//mypage에서 전송된 데이터로 닉넴수정
	@RequestMapping("/update")
	public String update(Model model,MemberDto mdto,HttpServletRequest request,HttpSession session) throws IOException {
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		String user_id = request.getParameter("user_id");		
		String New_nickname = request.getParameter("nickname");
		System.out.println("user_id"+user_id);
		System.out.println("New_nickname"+New_nickname);
		mdto.setMember_userid(user_id);
		mdto.setMember_nickname(New_nickname);
		mdao.update(mdto);
		System.out.println("닉넴체인지");
		session.setAttribute("nickname", New_nickname);	
	
		return "redirect:/mypage";
	}	



   
    @RequestMapping("/mypage")
    public String mypage(HttpServletRequest request,HttpSession session,MemberDto mdto,Model model,NewsDto ndto) {
//댓글 삭제해도 유지하는 rescod변수생성    	    	    
    	String rescod = request.getParameter("rescod");
    	session.setAttribute("rescod", rescod);
//멤버id값 가져오기    	
    	int member_id = login.member_id(session);
    	String nickname = login.nickname(session);
		String user_id = login.user_id(session);

//좋아요 기사
    	NewsDao ndao=sqlSession.getMapper(NewsDao.class);
    	 // 원하는 페이지 값의 index를 계산하여
  	   int index; // 1페이지=>0, 2페이지는 10
  	   int page;
  	   
  	   // 사용자가 페이지 값을 보내지 않는 경우=> 게시판에 처음 접근 
  	   if(request.getParameter("page")==null)
  	   {
  		   page=1;
  		   index=0;
  	   }
  	   else // 사용자가 페이지 값을 보내는 경우
  	   {
  		   page=Integer.parseInt(request.getParameter("page"));
  		   index=(page-1)*10;
  	   }
  	   
  	   // 게시판 하단에 다른페이지 이동을 위한 링크
  	   int pstart=page/10;
  	   if(page%10 == 0) // 10 의 배수일 경우
  	     pstart=pstart-1;
  	   
  	   pstart=(pstart*10)+1;
  	   int pend=pstart+9;
  	   //검색이 필요한 필드값과 검색어를 가져와서 검색을한다.
     	
     	
     	
    	
    	
    	
    	ArrayList<NewsDto> list = ndao.list(member_id,index);
//좋아요한 뉴스기사가 없을경우를 판별하기 위해 list.size가 0인지 식별해야한다.
    	if( list.size() != 0 ){
	    	session.setAttribute("like_id", list.get(0).getLike_id());
	    	int like_id = (Integer) session.getAttribute("like_id");
    	}

    	model.addAttribute("list",list);
    	model.addAttribute("pstart",pstart);
  	    model.addAttribute("page",page);

    	Integer pagecnt=ndao.get_pagecnt(member_id);
	    model.addAttribute("pagecnt",pagecnt);
	    // 출력될 pend값이 총페이지보다 클경우는 pend에 총페이지값을 전달
	    if(pend > pagecnt)
		    pend=pagecnt;
	    model.addAttribute("pend",pend);
  	    
	    
	    Integer user_like_count=ndao.user_like_count(member_id);
	    session.setAttribute("user_like_count", user_like_count);
	    
	    
	    
	    
//마이페이지 댓글
    	CommentDao cmdao=sqlSession.getMapper(CommentDao.class);
    	 // 원하는 페이지 값의 index를 계산하여
  	   int index2; // 1페이지=>0, 2페이지는 10
  	   int page2;
  	   
  	   // 사용자가 페이지 값을 보내지 않는 경우=> 게시판에 처음 접근 
  	   if(request.getParameter("page2")==null)
  	   {
  		   page2=1;
  		   index2=0;
  	   }
  	   else // 사용자가 페이지 값을 보내는 경우
  	   {
  		   page2=Integer.parseInt(request.getParameter("page2"));
  		   index2=(page2-1)*10;
  	   }
  	   
  	   // 게시판 하단에 다른페이지 이동을 위한 링크
  	   int pstart2=page2/10;
  	   if(page2%10 == 0) // 10 의 배수일 경우
  	     pstart2=pstart2-1;
  	   
  	   pstart2=(pstart2*10)+1;
  	   int pend2=pstart2+9;
  	   //검색이 필요한 필드값과 검색어를 가져와서 검색을한다.
     	
     	
     	
    	ArrayList<CommentDto> cmlist = cmdao.cmlist(member_id,index2);
    	model.addAttribute("cmlist",cmlist);	
    	model.addAttribute("pstart2",pstart2);
  	    model.addAttribute("page2",page2);

    	Integer pagecnt2 = cmdao.get_pagecnt2(member_id);
	    model.addAttribute("pagecnt2",pagecnt2);
	    // 출력될 pend값이 총페이지보다 클경우는 pend에 총페이지값을 전달
	    if(pend2 > pagecnt2)
		    pend2=pagecnt2;
	    model.addAttribute("pend2",pend2);
  	    
	    
	    Integer user_comment_count=cmdao.user_comment_count(member_id);
	    session.setAttribute("user_comment_count", user_comment_count);
    
    	
    	
    
    	return "mypage";
	}
//마이페이지 좋아요 기사 삭제
    @RequestMapping("/delete")
	public String delete(HttpServletRequest request,HttpSession session)
	{
    	int member_id = login.member_id(session);
		int like_id = Integer.parseInt(request.getParameter("like_id"));
		NewsDao ndao=sqlSession.getMapper(NewsDao.class);
		ndao.delete(like_id);
    	

		return "redirect:/mypage?member_id="+member_id;
		
	}

    
  //마이페이지 댓글삭제
    @RequestMapping("/delete2")
	public String delete2(HttpServletRequest request,HttpSession session)
	{
    	int member_id = login.member_id(session);
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
		String rescod = "true";
    	CommentDao cmdao=sqlSession.getMapper(CommentDao.class);
    	cmdao.delete(comment_id);
		return "redirect:/mypage?member_id="+member_id+"&rescod="+rescod;
		
	}

    
    
  //로그인 회원가입
    @RequestMapping("/login_ok")
	public String login_ok(Model model,MemberDto mdto,HttpServletRequest request,HttpSession session)
	{   
    	System.out.println("동작확인");
    	// 네이버 내용 호출
		String user_nickname = (String) session.getAttribute("user_nickname");
		String user_name = (String) session.getAttribute("user_name");
		String user_id = (String) session.getAttribute("user_id");		
		String New_nickname = login.New_nickname(session);
		
		// 카카오 내용 호출
    	if(user_id == null) {
    		user_id = request.getParameter("userid");
    		user_name = request.getParameter("nickname");
    		user_nickname = request.getParameter("nickname");

    	}	
    	
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		Integer num=mdao.id_check(user_id);	
		//동일 id가 디비에 0개 존재할경우 
		if(num == 0) {
			mdto.setMember_userid(user_id);
			mdto.setMember_name(user_name);
			mdto.setMember_nickname(user_nickname);
			mdao.write(mdto);

		}
		//동일id가 디비에 0개가 아닐경우			
		else {

		}
		MemberDto user_data = mdao.user_data(user_id);
		session.setAttribute("member_id", user_data.getMember_id());
		session.setAttribute("member_id2", String.format("%06d", user_data.getMember_id()));
		session.setAttribute("name", user_data.getMember_name());
		session.setAttribute("user_id", user_data.getMember_userid());
		session.setAttribute("nickname", user_data.getMember_nickname());
		session.setAttribute("state", user_data.getMember_state());
		session.setAttribute("writetime", user_data.getMember_writetime());
		session.setAttribute("social", user_data.getMember_social());
		session.setAttribute("like_subject", user_data.getMember_like_subject());
		
		String lasturl = (String) session.getAttribute("lasturl");
	    System.out.println("마지막 url"+lasturl);
		
		int state  = (Integer) session.getAttribute("state");
		int state2 = 0;
		System.out.println("로그인 동작시 나오는 state값은?"+state);
		if(state != 0) {
			mdto.setMember_userid(user_id);
			mdto.setMember_state(state2);
			mdao.loginstate0(mdto);
		}
		//@@네이버 회원가입 및 로그인 종료지점
		System.out.println("테스트테스트"+session.getAttribute("referer"));
		if(session.getAttribute("referer") == null) {
			session.removeAttribute("referer");
			String referer = (String)request.getHeader("REFERER");
			String[] referer3 = referer.split("/");
			String referer4 = referer3[referer3.length-1];
			String referer2 = referer.substring(21);
			//System.out.println(referer4);
			return "redirect:"+referer4;
		}else {
		
			return "redirect:"+lasturl;
		}
			
		
		
	}
}   

