<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
   Date date = new Date();
   
   if(request.getParameter("Date") != null) {         
      String test = request.getParameter("Date");
   }
%>
<%
request.setCharacterEncoding("utf-8"); // utf8 인코딩을 받기위해 필요!
String time = request.getParameter("Date");
String subject = request.getParameter("subject");
String key = request.getParameter("param2");
%>

<%
   Calendar cal = Calendar.getInstance();
   Calendar time_next = Calendar.getInstance();
   Calendar time_back = Calendar.getInstance();
   String sub = request.getParameter("sub");
   Date today = new Date();
   cal.setTime(today);
   SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
   SimpleDateFormat ymd = new SimpleDateFormat("yyyy.MM.dd");   
   SimpleDateFormat hm = new SimpleDateFormat("HH:mm");   
   if(request.getParameter("date") == null){    
      SimpleDateFormat format2 = new SimpleDateFormat("mm");      
      int min_c = Integer.parseInt(format2.format(today));
      if ((min_c / 30) < 1){
         System.out.println("Test");
         cal.set(Calendar.MINUTE, 0);
         cal.set(Calendar.SECOND, 0);
      }else{
         System.out.println("Test2");
         cal.set(Calendar.MINUTE, 30);
         cal.set(Calendar.SECOND, 0);
      }   
   }else{
      cal.setTime(format0.parse(request.getParameter("date")));
   }
   System.out.println(format0.format(cal.getTime()));
   time_next = (Calendar) cal.clone();
   time_back = (Calendar) cal.clone();
   time_next.add(Calendar.MINUTE, 30);
   time_back.add(Calendar.MINUTE, -30);
   System.out.println(format0.format(time_next.getTime()));
   System.out.println(format0.format(time_back.getTime()));
%>


<html>
<head>
    <meta charset="utf-8">
    <title>OKWORDS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
    <style>
    /* custom css styles will go here */
   html{
   background: linear-gradient( to bottom, #7543c0, #8A54A2 );
   height: 120%;
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
 
 .outer {
    text-align: center;
    margin-right: 120px;
 }
 
.content {overflow-y:hidden;}
.content:hover {overflow-y:scroll;}
 
    </style>
    
</head>
<body>
<script src="https://d3js.org/d3.v5.min.js"></script>
 <c:import url="top.jsp"></c:import>

 
<div class="outer">
<div style="width:1600px; align:center; background-color: white; display: inline-block; height: 800px; margin-top: 50px; margin-bottom: 118px;">
<div  style="display: flex; height: 800px;">
<div style="flex:1; margin-left: 100px">
<!-- 주제 재목 날짜 -->
<div class="box1" style="width:100px">
   <a>경제</a>  
   <p><%=ymd.format(cal.getTime()) %> </p>
</div>
<div>
<img id ="img" src="resources/img/Star.png" onclick="toggleImg()"/>
<script> 
function toggleImg() {
   document.getElementById("img").src="resources/img/NoStar.png";
   alert("즐겨찾기가 해제되었습니다");
}
</script>
</div>

<!-- 워드 클라우드 -->
<div class="word" style="width:500px; height:500px; position:relative; margin-right: 200px;">
<c:import url="word.jsp"></c:import> 
</div>    
<!-- 실시간 시간 -->
<div class="clock" style="width:500px">
<%=hm.format(cal.getTime()) %>
</div>
<input type="button" value="이전" onclick="location.href='?sub=<%=sub%>&date=<%=format0.format(time_back.getTime()) %>'">
<input type="button" value="이후" onclick="location.href='?sub=<%=sub%>&date=<%=format0.format(time_next.getTime()) %>'">


</div>
 <div style="flex:1;">

<c:if test="${news_list != null}">
<div style="overflow: scroll; height:750px;" >
<table>
   <tr>
      <td valign="top">
         <c:forEach var="ndto" items="${news_list}" begin="0" end="${fn:length(news_list)}" step="2">
            <table style="border:1.5px solid #00000050;border-radius: 15px;">
               <tr>
               <c:if test="${ndto.news_img != null}">
                  <td>
                       <img src="${ndto.news_img }"style= "width:320px;height:190px;border-radius: 15px 15px 0px 0px;">
                    </td>
                </c:if>
                    <c:if test="${ndto.news_img == null}">
                      
                    </c:if>
               </tr>   
               <tr>
                  <td style= "width:320px;height:190px; font-size:30px; text-align:top;">${ndto.news_title }</td>
               </tr>
            </table>
         </c:forEach>
         </td>
         
         <td valign="top">
      
         <c:forEach var="ndto" items="${news_list}" begin="1" end="${fn:length(news_list)}" step="2">
            <table style="border:1.5px solid #00000050; border-radius: 15px;"onClick="location.href=''">
               <tr>
                  <td>
                     <c:if test="${ndto.news_img != null}">
                          <img src="${ndto.news_img }"style= "width:320px;height:190px;border-radius: 15px 15px 0px 0px;">
                      </c:if>
                       <c:if test="${ndto.news_img == null}">
                       </c:if>
                    </td>
               </tr>   
               <tr>
                  <td style= "width:320px;height:190px; font-size:30px; text-align:top;">${ndto.news_title }</td>
               </tr>
            </table>
         </c:forEach>
      </td>
   </tr>
</table>   
</div>
 </c:if>
   </div>
 </div>
 </div>
 </div>
</body>
</html>