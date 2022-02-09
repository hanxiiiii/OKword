<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 댓글작성 & 댓글보기 </title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
    $('#text_input').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 200)");

        if($(this).val().length > 200) {
            $(this).val($(this).val().substring(0, 200));
            $('#test_cnt').html("(200 / 200)");
        }
    });
});
</script>
<style>
body{
background: linear-gradient( to bottom, #7543c0, #8A54A2 );
color:white; 
}
#text_input{ /* 댓글입력 textarea */
width:900px;
height:90px;
font-size:20px;
font-weight:bold;
box-sizing: border-box;
position:relative;
resize:none;
}
#test_cnt{ /* 댓글입력수 카운트 */
padding-left:823px;
margin-top:-20px;
position:absolute;
color:black;
font-size:15px;
}
#comment_input{/* 댓글입력 테이블 */
width:1300px;
height:100px;
border:6px solid white;
border-top: none; 
border-bottom: none; 
border-right: none;
border-spacing:25px 0px;
margin-left:42px;
margin-top:16px;
}
#table_edge { /* 겉테두리 */
border:2px solid white;
border-radius:30px;
width:1100px;
height:150px;
margin-left:390px;
margin-top:20px;
}
#img { /* input 버튼 (이미지로 넣음) */
margin-left:-309px;
margin-bottom:-10px;
}
.nickname { /* 닉네임 */
font-size:15px;
font-weight:bold;
}
#list_edge { /* 댓글 리스트 영역 */
border:2px solid white;
border-radius:30px;
width:1100px;
height:130px;
margin-left:390px;
margin-top:20px;
}
#list_table { /* 댓글내용 테이블 */
width:1300px;
height:100px;
border:6px solid white;
border-top: none; 
border-bottom: none; 
border-right: none;
border-spacing:15px 0px;
margin-left:46px;
padding-left:9px;
margin-top: -50px;
}
#delete_click {
height:40px;
padding-left:30px;
padding-top:22px;
text-align:right;
}
#time {
align:right; 
font-size:15px;
font-weight:bold;
width:1070px;
height:30px;
text-align:right;
margin-top:-10px;
}
#delete_a {
color:white;
font-size:20px;
font-weight:bold;
text-decoration:none;
margin-right:47px;
}
</style>
</head>
<body>
<!-- 댓글작성 -->
<form method="post" action="comment_view_all_ok?news_id=${ndto.news_id }">
<input type="hidden" name="comment_writetime">
<div id="table_edge">
<table id="comment_input">
 <tr>
  <td class="nickname">${nickname }</td>
 </tr>
 <tr>
  <c:if test="${user_id != null }">
  <td><textarea name="comment_content" id="text_input"></textarea>
  <!-- 글자수 카운트 -->
  <div id="test_cnt">(0 / 200)</div>
  </td>
  <td style="vertical-align:bottom;"><input id="img" type="image" src="resources/img/cm_submit.png" style="width:60px;height:40px"></td>
 </c:if>
  <c:if test="${user_id == null }">
   <td><textarea  disabled name="comment_content" id="text_input">댓글을 작성하려면 로그인을 해주세요.</textarea>
  <!-- 글자수 카운트 -->
  <div id="test_cnt">(0 / 200)</div>
  </td>
  <td style="vertical-align:bottom;"><input disabled id="img" type="image" src="resources/img/cm_submit.png" style="width:60px;height:40px"></td>
 </c:if>
 </tr>
 <tr>
 <input type="hidden" name = "news_id" value="${ndto.news_id }">

 </tr>
</table>
</form>
</div>
<!-- 댓글리스트 -->
 <c:forEach items="${clist}" var="cdto">
 <input type="hidden" name = "member_id" value="${cdto.member_id }">
  <input type="hidden" name = "session_id" value="${member_id_session }">
 <div id="list_edge">
  <div id="delete_click"> <!-- 댓글 삭제 영역 -->
  <c:if test="${cdto.member_id == member_id_session}">
   <a id="delete_a" href="comment_delete?comment_id=${cdto.comment_id}">삭제<%-- ${cdto.comment_id}, ${cdto.member_id} --%></a>
  </c:if>
  </div>
  <table id="list_table">
   <tr>
    <td width="1330" class="nickname" style="height:50px;vertical-align:top;">${cdto.member_nickname}</td>
    <td><!-- 빈칸 --></td>
   </tr>
   <tr> 
    <td style="font-size:25px;vertical-align:top;">${cdto.comment_content}</td>
    <td><!-- 빈칸 --></td>
   </tr>
  </table>
  <div id="time"> <!-- 날짜와 시간 영역 -->
  <fmt:parseDate value="${cdto.comment_writetime}" var="day" pattern="yyyy-MM-dd HH:mm"/>
  <fmt:formatDate value="${day}" var="day" pattern="yyyy.MM.dd"/>
  <fmt:parseDate value="${cdto.comment_writetime}" var="time" pattern="yyyy-MM-dd HH:mm"/>
  <fmt:formatDate value="${time}" var="time" pattern="a h:mm"/>
   ${day} ${time}
  </div>
 </div>
</c:forEach>

<!-- 날짜,시간 표시  -->



</body>
</html>