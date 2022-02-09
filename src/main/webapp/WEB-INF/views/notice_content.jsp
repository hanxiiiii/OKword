<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
.notice {
padding-left:185px;
padding-top:45px;
padding-bottom:45px;
font-size:50px;
}
#tablefirst{
width:1532px;
height:80px;
align:center;
font-size:50px;
}
#tablesecond{
width:1639px;
height:1000px;
border:3px solid white;
border-radius:20px;
align:center;
font-size:30px;
text-align:center;
}
</style>
</head>
<body>
<c:import url="top.jsp"/>
 <div class="notice"><b>공지사항</b></div><p>
<div style="padding-left:185px;padding-bottom:60px;">
<table id="tablefirst"> 
 <tr>
  <td align="left">${ndto.notice_id} . &nbsp ${ndto.notice_title}</td>
  <td align="right" style="font-size:25px;">
  <fmt:parseDate value="${ndto.notice_writetime}" var="day" pattern="yyyy-MM-dd HH:mm"/>
  <fmt:formatDate value="${day}" var="day" pattern="yyyy.MM.dd"/>
  <fmt:parseDate value="${ndto.notice_writetime}" var="time" pattern="yyyy-MM-dd HH:mm"/>
  <fmt:formatDate value="${time}" var="time" pattern="a h:mm"/>
  
  ${day}<br>
  ${time}
  </td>
 </tr>
</table>
</div>
<div class="tablesecond" style="padding-left:141px;">
<table id="tablesecond">
 <tr>
  <td>${ndto.notice_content}</td>
 </tr>
</table>
</div>
<div style="position: absolute; left: 850px; bottom: -550px;">
	<c:import url="bottom.jsp"/>
</div>
</body>
</html>