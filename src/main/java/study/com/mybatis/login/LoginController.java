package study.com.mybatis.login;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import study.com.mybatis.dao.MemberDao;
import study.com.mybatis.dto.MemberDto;
/**
* Handles requests for the application home page.
*/


@Controller
public class LoginController {


/* NaverLoginBO */

private NaverLoginBO naverLoginBO;
private String apiResult = null;

@Autowired
private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
this.naverLoginBO = naverLoginBO;
}
@Autowired
private SqlSession sqlSession;
//로그인 첫 화면 요청 메소드
@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
public String login(HttpServletRequest request,Model model, HttpSession session) {


	return "redirect:/main";
}
//네이버 로그인 성공시 callback호출 메소드
@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
public String callback(Model model,MemberDto mdto,HttpServletRequest request,HttpSession session, @RequestParam String code, @RequestParam String state,HttpServletResponse response) throws IOException {
	System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		response.setContentType("text/html; charset=utf-8");

		try {
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
			/** apiResult json 구조
			{"resultcode":"00",
			"message":"success",
			"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			**/
			//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			//3. 데이터 파싱
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response의 nickname값 파싱
			String navernickname = (String)response_obj.get("nickname");
			String naveruserid = (String) response_obj.get("id");
			String navername = (String) response_obj.get("name");
			
			String referer = (String)request.getHeader("REFERER");
			System.out.println("로컨"+referer);
			session.setAttribute("referer",1); //세션 생성
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("nickname",navernickname); //세션 생성
			session.setAttribute("user_name",navername); //세션 생성
			session.setAttribute("user_id",naveruserid); //세션 생성
			
			
			
			return "redirect:login_ok";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			PrintWriter out = response.getWriter();
			

			out.println("<script language='javascript'>");

			out.println("alert('필수항목에 동의를 하지않았습니다."
					+"\\n"+ "네이버에서 연동 해지후 다시 가입해주세요.') ");

			out.println("</script>");

			out.flush();
			return "login_ok";
		}

}
////닉네임 수정
//@RequestMapping(value = "/nick_change", method = { RequestMethod.GET, RequestMethod.POST })
//public String nick_change(HttpServletRequest request)throws IOException {
//	
//System.out.println("여기는 nick_change");
//ModelAndView mv = new ModelAndView();
//
//HttpSession session = request.getSession();
//String name = (String) session.getAttribute("sessionId");
//    
//System.out.println("==============================");
//System.out.println("세션에 저장 되 있는 변수 : "+name);
//System.out.println("==============================");
//    
//name = "세션값 변경";
//session.setAttribute("sessionId", name);
//mv.setViewName("/test/test");
//
//
//return "redirect:/mypage";
//}



//로그아웃
@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
public String logout(HttpServletRequest request,HttpSession session,MemberDto mdto)throws IOException {
	String referer = (String)request.getHeader("REFERER");
	String[] referer3 = referer.split("/");
	String referer4 = referer3[referer3.length-1];
	String referer2 = referer.substring(21);
	System.out.println(referer4);
	String mypage= "/mypage";
//세션초기화	
	
	
	if(("/"+referer4).equals(mypage)) {
		//System.out.println("메인화면"+referer4);
		session.invalidate();
		return "redirect:/main";
	}else {
		session.invalidate();
		//System.out.println("다른화면"+referer4);
		return "redirect:"+referer4;
	}
	
}


//로그오프
@RequestMapping(value = "/logoff", method = { RequestMethod.GET, RequestMethod.POST })
public String logoff(HttpServletRequest request,HttpSession session,MemberDto mdto)throws IOException {

	int state  = Integer.parseInt(request.getParameter("state"));

	String user_id  = (String) session.getAttribute("user_id");
	MemberDao mdao = sqlSession.getMapper(MemberDao.class);
	mdto.setMember_userid(user_id);
	mdto.setMember_state(state);
	mdao.logoff(mdto);

//세션초기화	
	session.invalidate();
return "redirect:/main";
}

}