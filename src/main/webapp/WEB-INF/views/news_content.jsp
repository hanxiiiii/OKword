<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>News</title>
<style>


body {
	  background-attachment:fixed;
	  width: 100%;
	  height: 100%;
	  background-color: white;
}
li{
list-style:none; 
}
</style>

</head>
<body>
<c:import url="top.jsp"/>




<iframe id ="iframeID" frameborder="0"style="z-index:997;position: relative;width: 99vw;height: 1000px;right: 6px;" src="${ndto.news_url }">

</iframe>


<c:import url="comment_view_all.jsp"/>

<c:import url="button2.jsp"/>
<c:import url="bottom.jsp"/>
</body>

</html>