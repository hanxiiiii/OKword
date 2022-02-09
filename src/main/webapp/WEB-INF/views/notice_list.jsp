<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
	background: linear-gradient( to bottom, #7543c0, #8A54A2 );
	color:white;
	 background-attachment:fixed;
}
.custom {
padding-top:-20px;
padding-left:186px;
font-size:50px;
}
.notice {
margin-bottom:50px;
padding-left:186px;
width:510px;
font-size:50px;
display:inline;
float:left;
}
.info {
padding-left:222px;
align:center;
font-size:40px;
}
#input {
width:1530px;
height:65px;
margin-left:300px;
}
#list {
height:100%;
}
</style>
<!-- top 메뉴 import-->
<c:import url="top.jsp"/>
<!-- top 메뉴  끝-->
</head>
<body>
<div class="custom"><b>고객센터</b></div>
<div class="info">
<table style="border:1px white;width:1600px;height:250px; border-radius:20px;">
 <tr>
  <td><img style="transition: 0.5s;
		filter :brightness(0) invert(1);" src="resources/img/email.png" width="150"></td>
  <td><b>LARIVE82@gamil.com</b></td>
  <td><img style="transition: 0.5s;
		filter :brightness(0) invert(1);" src="resources/img/telephone.png" width="130"></td>
  <td><b>010-6291-8918</b></td>
 </tr>
</table>
</div>
<div style="margin-bottom:60px;">
<div class="notice"><b>공지사항</b></div>
<!-- 검색창 -->
<div id="input">
<table>
<tr>
 <td colspan="2">
  <form name="search" method="post" action="notice_list">
   <div id="outer" style="width:530px;height:60px;background:white;float:right;">
    <div id="left" style="height:60px;width:50px;display:flex;align-items:center;float:left;">
    
    <!-- 이미지 버튼 -->
      <input type="submit" id ="imgbt" alt="" value="">
      <style>
      	#imgbt{
      		background:url("resources/img/search_icon.png");
      		background-repeat: no-repeat;      		
      		width:35px;
      		height:35px;
      		float:left;
      		background-size: 33px;
      		border:0px;
      		margin-left:10px;
      	}      
		 #notice td {		 	
		 	height:118.5px;
		 	padding:40px;
		 	
		 }
		
		 .content {
		  width        : 500px;     /* 너비는 변경될수 있습니다. */
		  height	   : 40px;
		  text-overflow: ellipsis;  /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
		  overflow     : hidden;    /* 내용이 길면 감춤니다 */
		  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
		 	
		 }
		 a {
		 font-size:40px; color:white;
		 text-decoration:none; 
		 font-weight:bold;
		 }      	
      </style>
	<!-- 버튼 끝 -->     
    </div>
    <div id="right" style="">
       <input type="text" id="sword" name="sword" style="border:none;width:465px;height:57px;font-size:30px;">
    </div>
   </div>
   </form>
 </td>
</tr>
</table>
</div>
</div>
 <form name="ok" method="post" action="notice_content">
  <input type="hidden" name="id">
 </form>
 <!-- 검색창 끝 -->
 <!-- 검색 리스트 관련 시작 -->
<div style="width:100%; height:400px">
<div id="list" style="display:flex; width:1690px; margin:0 auto;">
 <div class="left_button" style="flex:1; height:400px; line-height:400px; vertical-align:middle;">
	<c:if test="${page > 1}">
          <a href="notice_list?page=${page-1}"><img style="margin-top:150px;"src="resources/img/left.png"> </a>  
    </c:if>
    <c:if test="${page == 1}"> 
          <img style="margin-top:150px;" src="resources/img/left.png">     
    </c:if>
	</div>
<div style="flex:10; border-radius:20px; border:3px solid #FFFFFF;">
 <table id="notice" width="1520px" height="400" align="center" style="">

<!-- 공지사항 리스트 -->
 <tr>
 <c:forEach var="i" begin="0" end="1">  
  <td>
  <c:if test="${list[i].notice_id!=null}">
  <a href="notice_content?id=${list[i].notice_id}">${list[i].notice_id}. ${list[i].notice_title}</a>
  <p>
  <div class="content">${list[i].notice_content}</div>
  </c:if>
  <c:if test="${list[i].notice_id==null}">
  </c:if>
  </td> 
 </c:forEach> 
 </tr>
 <tr> 
 <c:forEach var="i" begin="2" end="3"> 
  <td>
  <c:if test="${list[i].notice_id!=null}">
  <a href="notice_content?id=${list[i].notice_id}">${list[i].notice_id}. ${list[i].notice_title}</a>
  <p>
  <div class="content">${list[i].notice_content}</div>  
  </c:if>
   
  <c:if test="${list[i].notice_id==null}">
  </c:if>
  </td>
 </c:forEach> 
 </tr>
 <!-- 다음 1페이지 이동 -->  
 </table>
 </div>
  <div align="right" style="flex:1;">
  <c:if test="${page != pagecnt}">
  <a href="notice_list?page=${page+1}"><img style="margin-top:150px;" src="resources/img/right.png"></a>
  </c:if>
  <c:if test="${page == pagecnt}">
   <img style="margin-top:150px;" src="resources/img/right.png">
  </c:if>
 </div>
 </div>
 </div>
 <div style= "position: absolute;left: 850px;bottom: -200px;">
	<c:import url="bottom.jsp"/>
</div>
</body>
</html>
<!-- 하단 footer import-->

<!--끝-->