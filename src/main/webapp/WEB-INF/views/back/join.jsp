<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script>
   function userid_check()
   {
	   var chk=new XMLHttpRequest();
	   var userid=document.pkc.userid.value;
	   chk.open("get","userid_check?userid="+userid);
	   chk.send();
	   
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState==4)
		   {
			   if(chk.responseText=="1")
			   {
				   alert("사용 불가능한 아이디 입니다");
				   document.pkc.userid.value="";
			   }
			   else
			   {
				   alert("사용 가능한 아이디 입니다");
			   }	   
			  // 한글처리 : alert(decodeURI(chk.responseText));
		   }
	   }
   }
 </script>
</head>
<body>
  <form name="pkc" method="post" action="join_ok">
  <input type="hidden" name="id">
    아이디<input type="text" name="userid">
  <input type="button" value="중복하기" onclick="userid_check()"> <p>
    이름 <input type="text" name="name"> <p>
    비번 <input type="password" name="pwd"> <p>
    전화번호<input type="text" name="phone">
  <input type="submit" value="회원가입">  
  </form>
</body>
</html>