<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> <!--  -->

<html>
<head>
    <meta charset="utf-8">
    <title>OKWORDS404PAGE</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
    <style>
    /* custom css styles will go here */
	html{
	background: linear-gradient( to bottom, #7543c0, #8A54A2 );
	height: 110%;
	}
	.bubble{
	background-color: white;
	}
	.box1{
	width: 100px;
	/* background-color: white; */
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 50px;
	height: 100px;
	}
	.box1 a {
	margin-top: 20px;
	font-size: 30px;
	padding-left: 20px;
	font-weight: bolder;
	}
	.box1 p {
	padding-left: 20px;
	border: 20px;
	font-size: 20px;
	font-weight: bolder;
	}
	.bottom_time {
	width: 500px;
	background-color: white;
	margin-left: 300px;
	height: 35px;
	text-align: center;
	font-size: 25px;
	margin-bottom: 200px;
	}
	.news_list{
	width: 500px;
	background-color: white;
	margin-left: 800px;
	margin-bottom: 500px;
	}
	 svg {
	  display: block;	  
	  margin: 0 auto;
	  position: absolute;
	  top: calc(0%);
	  left: calc(0%);
	}	
	
 /* 테이블 디자인 시작 부분 */
 table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
}
table.type11 th {
  width: 500px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: white ;
  text-align: center;
}
table.type11 td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid white;
  background: white;
}
 /* 테이블 디자인 끝 부분 */
 
.content {overflow-y:hidden;}
.content:hover {overflow-y:scroll;}

/* 404 디자인 시작 부분 */
.404main {
	text-align: center;
	margin-top: 1000px;
}
 .outer {
    text-align: center;
}
 </style>
    
</head>


<body>

<c:import url="top.jsp"></c:import>
<div class="outer">
<div class="404main" style="text-align: center; margin-top: 70px; position: relative">
<img src="<spring:url value='/resources/img/404main.png'/>">
</div> 
<b style="color:white; font-size:30px;">
요청하신 페이지를 찾을 수 없습니다
<p>
요청하신 페이지가 사라졌거나, 잘못된 경로를 이용하셨습니다.
<div style="position: relative; left: 70px;top: 50px;">
<c:import url="bottom.jsp"/> 
</div>
</p>
</b>
 </div>
</body>
</html>