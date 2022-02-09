<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>


body {
	  background-attachment:fixed;
	  width: 100vw;
	 height: 100vh;

	  background: linear-gradient( to bottom, #7543c0, #8A54A2 );
}
li{
list-style:none; 
}
</style>
</head>
<body>
<c:import url="top.jsp"/>
${like_id }좋아요 번호입니다.
<div>
<iframe style="	position: relative;width: 1400px;left: 100px; height: 1000px;" src="${ndto.news_url }">

</iframe>

</div>
<c:import url="comment_view_all.jsp"/>

<c:import url="button2.jsp"/>
<c:import url="bottom.jsp"/>
</body>

</html>