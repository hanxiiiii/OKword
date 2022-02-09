<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
   width: 200px;
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
    <script>

function news_content_url(){
   const news_id = document.querySelector('#news_id').value;
   window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port)+"/news_content?news_id="+news_id);
}
function news_content_url2(){
   const news_id = document.querySelector('#news_id2').value;
   window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port)+"/news_content?news_id="+news_id);
}
</script>
</head>
<body>
<script src="https://d3js.org/d3.v5.min.js"></script>
 <c:import url="top.jsp"></c:import>
<div class="outer">
<div style="width:1600px; align:center; background-color: white; display: inline-block; height: 800px; margin-top: 50px; margin-bottom: 118px;">
<div  style="display: flex; height: 800px;">
<div style="flex:1; margin-left: 100px">
<!-- 주제 재목 날짜 -->
<div class="box1" style="width:200px">
   <b style="font-size:50px">
         <c:set var="sub_list" value="${fn:split('종합,정치,경제,사회,생활,세계,과학,연예,스포츠', ',')}" />
       <c:forEach var="i" begin="100" end="108">
            <c:if test="${sub == i}">
               ${sub_list[i-100]}
            </c:if>
       </c:forEach>
    </b>
   <br>
         <span class="datepicker-toggle">
        <span class="datepicker-toggle-button">${ymd}</span>
        <input type="date" class="datepicker-input"value="${ymd}" max="${max}" min="2021-06-30" onchange ="date_change(this.value)" >
        <script>
      function date_change(date){
         var time = '${hm}';
         //alert(date +" "+time);
         location.href='?sub=${sub}&date='+date+" "+time+":00";
      }
      </script>
      <script>
      function time_change(time){
         var date = '${ymd2}';
         //alert(date +" "+time);
         location.href='?sub=${sub}&date='+date+" "+time;
      }
      </script>  
        
   </span> 
 <style>
    .datepicker-toggle {
     display: block;
     position: relative;
     width: 0px;
     height: 19px;
     left: 50px;
   }
   .datepicker-toggle-button {
     position: absolute;
     left: 0;
     top: 0;
     width: 100%;
     height: 100%;
     font-size:20px;
     font-weight:bold;
   }
   .datepicker-input {
     position: absolute;
     left: 0;
     top: 0;
     width: 200px;
     height: 25px;
     opacity: 0;
     cursor: pointer;
     box-sizing: border-box;
     background-color:red;
   }
   .datepicker-input::-webkit-calendar-picker-indicator {
     position: absolute;
     left: 0;
     top: 0;
     width: 100%;
     height: 100%;
     margin: 0;
     padding: 0;
     cursor: pointer;
   }
   
   .clock select { 
         width: 150px; 
         height: 30px; 
         padding-left: 5px; 
         font-weight: bold;
       font-size: 30px;
         color:black;
         text-align-last:center; 
         border: 0px solid black; 
         border-radius: 3px; /* 화살표 없애기 */ 
         -webkit-appearance: none; 
         -moz-appearance: none; 
         appearance: none; 
         overflow:hidden;
         }
      .clock select option{
         overflow:hidden;
         text-align-last:center; 
      }
   #main_table td {
         border-spacing  : 30px;
         border-collapse: separate;
   }
   td {
         text-align:left;
         vertical-align : top;
         font-weight:bold;
         font-size:25px;
   }
   .in_table {
      border:1.5px solid #00000050;   
      border-radius: 15px;   
      cursor:pointer;
   } 
    .in_table .title {
      width:310px;
      height:150px;
      border-spacing  : 50px;
      border-collapse: separate;         
      justify-content: space-between;
      display: flex;
      flex-direction: column;
   } 
   
   .in_table img{
         height:240px;
          width:310px;
          object-fit: cover;
          border-radius: 10px 10px 0px 0px;"
   }
   

   .in_table td .only_title{
         position:relative;
         top:20px;   
         display: block;  
   }
   
   .in_table td .title_text{
         display:block;
         height:105px;
         overflow:hidden;
         white-space:nowrap;
         white-space: normal; 
   }
   
   .in_table td .news_time{   
         position:relative;
         bottom:10px;   
         display: block;  
         vertical-align : bottom;
         text-align:right;
         font-weight:bold;
         font-size:15px;
   }
   	
   
   </style>
<c:if test="${member_id != null && sub !=100}" >  
	<c:if test="${sub == like_subject}">
		 <img style="position: relative;left: 580px; bottom: 80px; z-index:999; cursor:pointer;" id ="img" src="resources/img/Star.png"onclick="toggleImg2()"/>
	</c:if>
	<c:if test="${sub != like_subject}">
		 <img style="position: relative;left: 580px; bottom: 80px; z-index:999; cursor:pointer;" id ="img" src="resources/img/NoStar.png"onclick="toggleImg()"/>
	</c:if>
</c:if>
<script> 
window.onload = function() {
    star = document.getElementById("img");
}
function toggleImg() {
	 var chk=new XMLHttpRequest();
	 var url="like_change?sub="+"${sub}&member_id=${member_id}";
	 chk.open("get",url,false);
	 chk.send();	 
	 chk.onreadystatechange=function()
	 {
		 if(chk.readyState == 4) //동작완료
			 { // 현재 문서에서 동작시킬 내용 추가
			 	if(chk.responseText.trim() == "1")// 성공
			 		{
			 		
			 		}else{
			 			alert("문제가 발생했습니다<br>잠시후 다시 시도해 주세요.");
			 		}
			  }
	 }  
	 star.setAttribute("onclick","toggleImg2()");
	star.src="resources/img/Star.png"; 	
	document.getElementById("manu_logo_url").href = "main?sub=${sub}";
	  alert("즐겨찾기가 추가되었습니다");
}
function toggleImg2() {	
	 var chk=new XMLHttpRequest();
	 var url="like_change?sub="+"100&member_id=${member_id}";
	 chk.open("get",url,false);
	 chk.send();	 
	 chk.onreadystatechange=function()
	 {
		 if(chk.readyState == 4) //동작완료
			 { // 현재 문서에서 동작시킬 내용 추가
			 	if(chk.responseText.trim() == "1")// 성공
			 		{
			 		}else{
			 			alert("문제가 발생했습니다<br>잠시후 다시 시도해 주세요.");
			 		}
			  }
	 }				
	   star.src="resources/img/NoStar.png";
	   star.setAttribute("onclick","toggleImg()");
	   document.getElementById("manu_logo_url").href = "main?sub=100";
	   alert("즐겨찾기가 헤지되었습니다");
}
</script>
</div>

<!-- 워드 클라우드 -->
<c:choose>
<c:when test="${Klist[0] !=null }">
	<div class="word" style="width:500px; height:500px; position:relative; top: 50px;left: 80px;">
			<c:import url="word.jsp"></c:import> 
	</div>
</c:when>

<c:otherwise>
	<div style="width:900px; height:500px; position:relative; bottom: 80px;left: 250px;">
		<span style=" font-size:50px;font-weight:bold;position: relative;top: 85px;"><b style="color:#7543c0;font-size:250px;">OK</b> <b style="color:#7543c0;font-size:120px;">word</b> </span><br>
		<span style="font-size:40px; font-weight:bold;position: relative;top: 105px; left:20px;color:#7543c0">해당 시간에 뉴스가 존재하지 않습니다.</span> 
	</div>
</c:otherwise>
</c:choose>
<!-- 실시간 시간 -->
<div class="clock" style="width:500px;    position: relative;top: 60px;">
<select onchange ="time_change(this.value)" style="cursor:pointer;">
<c:forEach var="i" begin="0" end="${minute_max}">
   <c:if test="${(i mod 2) == 0}">
      <fmt:formatNumber var="chk" minIntegerDigits="2" value="${(i div 2)}"/>
      <c:set var="chk2" value="${chk}:00"/>   
      <c:if test="${chk2 == hm}">
         <option id="${i}" value="<fmt:formatNumber  minIntegerDigits="2" value="${(i div 2)}"/>:00:00" selected> <fmt:formatNumber minIntegerDigits="2" value="${(i div 2)}"/> : 00 </option>
      </c:if>
      <c:if test="${chk2 != hm}">
         <option id="${i}" value="<fmt:formatNumber  minIntegerDigits="2" value="${(i div 2)}"/>:00:00"> <fmt:formatNumber minIntegerDigits="2" value="${(i div 2)}"/> : 00 </option>
      </c:if>
   </c:if>
   <c:if test="${(i mod 2) != 0}">
      <fmt:formatNumber var="chk" minIntegerDigits="2" value="${(i div 2)-0.5}"/>
      <c:set var="chk2" value="${chk}:30"/>   
      <c:if test="${chk2 == hm}">
         <option id="${i}" value="<fmt:formatNumber  minIntegerDigits="2" value="${(i div 2)}"/>:30:00" selected> <fmt:formatNumber minIntegerDigits="2" value="${(i div 2)-0.5}"/> : 30 </option>
      </c:if>   
      <c:if test="${chk2 != hm}">
      <option id="${i}" value="<fmt:formatNumber  minIntegerDigits="2" value="${(i div 2)-0.5}"/>:30:00"> <fmt:formatNumber minIntegerDigits="2" value="${(i div 2)-0.5}"/> : 30 </option>
      </c:if>
   </c:if>
</c:forEach>
</select>
</div>
<img src="resources/left_button.png" style="cursor:pointer;width:30px;position: absolute;top: 550px;left: 200px;"onclick="location.href='?sub=${sub}&date=${time_back}'">
<img src="resources/right_button.png" style="z-index:999;cursor:pointer;width:30px;position: absolute;right: 180px;top: 550px;"onclick="location.href='?sub=${sub}&date=${time_next}'">



</div>
 <div style="flex:1;">
<c:if test="${Klist[0] != null }"> 
	<c:if test="${news_list == null}">
	<div style="width:900px; height:500px; position:relative; bottom:30px;">
	  <span style=" font-weight:bold;position: relative;top: 185px;"><b style="color:#7543c0;font-size:200px;">OK</b> <b style="color:#7543c0;font-size:120px;">word</b> </span><br>
	  <span style="position: relative;top: 300px; font-size: 40px;font-weight: bold;left:10px;color:#7543c0;">키워드를선택해주세요.</span>
	</div>
	</c:if>
</c:if>

<c:if test="${news_list != null}">
<style>
#scrollbar_news::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
</style>
<div id = "scrollbar_news"style="overflow: scroll; height:750px;" >
<table >
   <tr>
    <td valign="top">
<!-- 뉴스 리스트 1번째 -->
         <input type="hidden" id = "member_id" value="${member_id }">
         <c:forEach var="ndto" items="${news_list}" begin="0" end="${fn:length(news_list)}" step="2">
         		   <fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss" value="${ndto.news_dateline }"/>      
                   <fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd HH:mm" value="${dateFmt}"/>
                   <fmt:parseNumber var="startTime_N" value="${dateFmt.time}" integerOnly="true" />                    
                   <c:set var="news_time" value="${dateTempParse}"/>
                   
                   
                   <c:set var="now_dateFmt" value="<%=new java.util.Date()%>"/>
                   <fmt:parseNumber var="endTime_N" value="${now_dateFmt.time}" integerOnly="true" />
                   <c:set var="time_set" value="${(endTime_N - startTime_N) / 60000}"/>
                   <c:if test="${(time_set/60/24) < 7}" >
                            <fmt:parseNumber value= "${time_set/60/24}" var= "min_time" integerOnly="true"  />
                            <c:set var="news_time" value="${min_time} 일전"/>
                      </c:if>
                   	  <c:if test="${(time_set/60) < 24}" >
                            <fmt:parseNumber value= "${time_set/60}" var= "min_time" integerOnly="true"  />
                            <c:set var="news_time" value="${min_time} 시간전"/>
                      </c:if>
                      <c:if test="${time_set < 60}" >
                            <fmt:parseNumber value= "${time_set}" var= "min_time" integerOnly="true"  />
                            <c:set var="news_time" value="${min_time} 분전"/>
                      </c:if>                
         
         <c:if test="${ndto.news_subject != 107 }" >
             <c:if test="${member_id == null}">  
               <table class ="in_table" onclick="location.href='news_content?sub=${ndto.news_subject}&member_id=99999&news_id=${ndto.news_id}'">
             </c:if>  
             <c:if test="${member_id != null}">
               <table class ="in_table" onclick="location.href='news_content?sub=${ndto.news_subject}&news_id=${ndto.news_id }'">
             </c:if> 
          </c:if>
          <c:if test="${ndto.news_subject == 107 }" >
             <c:if test="${member_id == null}">  
               <table class ="in_table"onclick="window.open( ${ndto.news_url}')">
             </c:if>  
             <c:if test="${member_id != null}">
               <table class ="in_table" onclick="window.open('${ndto.news_url}')">
             </c:if> 
          </c:if>                 
          
               <tr>             
               <c:if test="${ndto.news_img != null}">
                  <td>
                    <input type="hidden" id="news_id" value="${ndto.news_id }">
                      <a id="news_title" ><img src="${ndto.news_img }"></a>                    
                    </td>
                   
                      
                    <tr>              
                        <td  class="title"><div class="title_text">${ndto.news_title }</div><div class="news_time"><br><b>${news_time}&nbsp;&nbsp;</b></div></td>
                     </tr>
                </c:if>
                    <c:if test="${ndto.news_img == null}">
                     <tr>              
                        <td  class="title"><div class="only_title title_text">${ndto.news_title }</div><div class="news_time"><br><b>${news_time}&nbsp;&nbsp;</b></div></td>
                     </tr>
                    </c:if>
               </tr>   
            </table>
         </c:forEach>
         </td>
         
     <td valign="top">
<!-- 뉴스 리스트 2번째 -->
         <input type="hidden" id = "member_id" value="${member_id }">
         <c:forEach var="ndto" items="${news_list}" begin="1" end="${fn:length(news_list)}" step="2">
         		   <fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss" value="${ndto.news_dateline }"/>      
                   <fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd HH:mm" value="${dateFmt}"/>
                   <fmt:parseNumber var="startTime_N" value="${dateFmt.time}" integerOnly="true" />                    
                   <c:set var="news_time" value="${dateTempParse}"/>
                   
                   
                   <c:set var="now_dateFmt" value="<%=new java.util.Date()%>"/>
                   <fmt:parseNumber var="endTime_N" value="${now_dateFmt.time}" integerOnly="true" />
                   <c:set var="time_set" value="${(endTime_N - startTime_N) / 60000}"/>
                   <c:if test="${(time_set/60/24) < 7}" >
                            <fmt:parseNumber value= "${time_set/60/24}" var= "min_time" integerOnly="true"  />
                            <c:set var="news_time" value="${min_time} 일전"/>
                      </c:if>
                   	  <c:if test="${(time_set/60) < 24}" >
                            <fmt:parseNumber value= "${time_set/60}" var= "min_time" integerOnly="true"  />
                            <c:set var="news_time" value="${min_time} 시간전"/>
                      </c:if>
                      <c:if test="${time_set < 60}" >
                            <fmt:parseNumber value= "${time_set}" var= "min_time" integerOnly="true"  />
                            <c:set var="news_time" value="${min_time} 분전"/>
                      </c:if>                
         
         
         <c:if test="${ndto.news_subject != 107 }" >
             <c:if test="${member_id == null}">  
               <table class ="in_table" onclick="location.href='news_content?sub=${ndto.news_subject}&member_id=99999&news_id=${ndto.news_id}'">
             </c:if>  
             <c:if test="${member_id != null}">
               <table class ="in_table" onclick="location.href='news_content?sub=${ndto.news_subject}&news_id=${ndto.news_id }'">
             </c:if> 
          </c:if>
          <c:if test="${ndto.news_subject == 107 }" >
             <c:if test="${member_id == null}">  
               <table class ="in_table"onclick="window.open( ${ndto.news_url}')">
             </c:if>  
             <c:if test="${member_id != null}">
               <table class ="in_table" onclick="window.open('${ndto.news_url}')">
             </c:if> 
          </c:if>                 
          
               <tr>
               <c:if test="${ndto.news_img != null}">
                  <td>
                    <input type="hidden" id="news_id" value="${ndto.news_id}">
                      <a id="news_title" ><img src="${ndto.news_img }"></a>                    
                    </td>                      
                      
                    <tr>              
                        <td  class="title"><div class="title_text">${ndto.news_title }</div><div class="news_time"><br><b >${news_time}&nbsp;&nbsp;</b></div></td>
                     </tr>
                </c:if>
                    <c:if test="${ndto.news_img == null}">
                     <tr>              
                        <td  class="title"><div class="only_title title_text">${ndto.news_title }</div><div class="news_time"><br><b >${news_time}&nbsp;&nbsp;</b></div></td>
                     </tr>
                    </c:if>
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
<div style="position: relative; left:80px;">
<c:import url="bottom.jsp"/> 
</div>
</body>

</html>

