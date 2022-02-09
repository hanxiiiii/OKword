<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

</script>
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

<table>
	<tr>
		<td valign="top">
			<c:forEach var="ndto" items="${list2}" begin="0" end="${news_count }" step="2">
				<table style="border:1.5px solid #00000050;border-radius: 15px;" >
				<a href="news_content?news_id="+${ndto.news_id }>
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
				</a>
				</table>
			</c:forEach>
			</td>
			
			<td valign="top">
		
			<c:forEach var="ndto" items="${list2}" begin="1" end="${news_count }" step="2">
				<table style="border:1.5px solid #00000050;border-radius: 15px;">
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

</body>
</html>