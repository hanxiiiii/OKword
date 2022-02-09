<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/top.css">
 <script>      
 $(function() 
		   {  
			   // 종합 카테고리 클릭했을때 컬러 변경
			   $("#total").click(function()  
			   {
				   $("#total").css("color","#FFF700");
			   });
		   }); 

 function login_click(){
	 if(document.getElementById('social_login_ul').style.display != 'block'){
    	document.getElementById('social_login_ul').style.display='block';
	 }else{
		 document.getElementById('social_login_ul').style.display='none';
	 }
 } 
 
 function login_mypage(){
	 alert("비회원이십니다. 로그인을 해주세요.");
 }
</script>

</head>


<body> 
 <div id="top">
 <!-- OKWORD 로고 영역 -->
  <div id="menu_logo">
       <a href="main?sub=${like_subject}" id = "manu_logo_url"><img src="resources/img/okword_logo.png"></a>
  </div> 
 <!-- 카테고리별 메뉴 영역 -->
  <div id="index_menu">
  <ul id="menu">
      <c:set var="sub_list" value="${fn:split('종합,정치,경제,사회,생활,세계,과학,연예,스포츠', ',')}" />
      <script>
      var link = document.location.href;
      </script>
      <c:forEach var="i" begin="100" end="108">
         <c:if test="${sub == i}">
            <li><a href="/main?sub=${i}" id="${i}" style="color:yellow">${sub_list[i-100]}</a></li>
         </c:if>
         <c:if test="${sub != i}">
            <li><a href="/main?sub=${i}" id="${i}">${sub_list[i-100]}</a></li>
         </c:if>
      </c:forEach>
  <!-- 마이페이지 아이콘 영역 -->
<c:if test="${user_id != null}">
  <div id="mypage"><a href="mypage"><img src="resources/img/my.png"></a></div>
</c:if>
  </ul>
 </div>
   <div class="main_div" style="z-index:999;"> 
	<ul class="main_ul">
		<c:if test="${user_id == null}">
			<li class="main_li" id="login_button" onClick='login_click()' ><a style="cursor:pointer">Login</a>
				<ul id="social_login_ul" style="background-image:url(resources/img/login_chat.png);z-index:998; margin-left:-20px; margin-top:5px; width:103px; height:342.6px;" >
					<li>
					<b style="font-size:20px;"><br></b>					
					<b style="color:#7543c0; font-size:20px; position: relative; bottom:75px; right:50px;z-index:999;">Social&nbsp;Login</b>
					</li>
					<li style="all:unset;"  class="social_login">	
					<div id="naver_id_login" style="text-align:center">
						<a href="nlogin" onclick="test();">
							<img width="223" src="resources/img/naver_icon.png" style="position: relative; width:120px; bottom:60px; right:28px;z-index:999;"/>
						</a>
					</div>
					<br>
				
<!-- 카카오 로그인 버튼 임포트 -->
					<c:import url="login.jsp"></c:import>
					<li style="all:unset; font-size: 5px;">&nbsp;</li>
				</ul>
			</li>
		</c:if>
		<c:if test="${user_id != null}">
			<li class="main_li"><a href="logout">Logout</a></li><br>		
		</c:if>	
		
	</ul>
	</div>
</div>

<!-- 따라다니는 버튼 -->
<c:import url="button.jsp"></c:import>

  
  
  
  
  
  
  
  
  
  
  