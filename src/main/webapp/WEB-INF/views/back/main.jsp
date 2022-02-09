<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<style>
.main_div{
text-align:center;
vertical-align: middle;
}
.main_ul{
border:1px solid black;
margin-bottom: -17px;
}
.main_li{
display:inline-block;
vertical-align: middle;
}
.main_table_ul{
border:1px solid black;
width:1000px;
margin-left:400px;
}
.main_table_li{
display:inline-block;
border:1px solid black;
width:150px;
margin-right: -6px;

}
li{
list-style:none; 
}
.social_login{
width:150px;
}
#social_login_ul{
display:none;
}
</style>
  <script>
  
   function login_click(){
	   document.getElementById('social_login_ul').style.display='block';
   }
  </script>

</head>
<body>
<div class="main_div"" > 
	<ul class="main_ul">
		<li class="main_li"><image src="resources/newspoin.JPG" style="width:100px; height:50px;"></li>
		<li class="main_table_li">전체</a></li>
		<li class="main_table_li">경제</li>
		<li class="main_table_li">스포츠</li>
		<li class="main_table_li">등등</li>
		<li class="main_table_li">뉴스들</li>
		<c:if test="${sessionId ==null}">
			<li class="main_li" id="login_button" onClick='login_click()' style="position:absoulte; ">Login
				<ul id="social_login_ul">
					<li class="social_login"><c:import url="login.jsp"></c:import></li>
					<li class="social_login">카카오</li>
				</ul>
			</li>
		</c:if>
		<c:if test="${sessionId !=null}">
			<li class="main_li">'${sessionId}'님  환영합니다!</li>
			<li class="main_li"><a href="logout">Logout</a></li><br>
		</c:if>
	</ul>

	<ul class="main_table_ul">
		<li>
		<c:import url="home.jsp">
		</c:import>
		</li>
	</ul>	

</div>
	
</body>
</html>