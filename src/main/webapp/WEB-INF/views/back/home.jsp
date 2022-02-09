<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/sockjs.min.js"></script>
</head>
<body>
	<form id="chatForm">
		<input type="text" id="message"/><p>
		${userid}
		<input type="hidden" id="userid" value="${userid }"/>
		<button>send</button>
	</form>
	<div id="chat"></div>
	<script>
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				event.preventDefault();
				sock.send(userid.value+"  : "+$("#message").val());
				$("#message").val('').focus();
			});
		});
		
		var sock = new SockJS("/echo");
		sock.onmessage = function(e){
			var cut  = e.data.indexOf(":")+1;
			var da = e.data.substr(cut)
			$("#chat").append(da + "<br/>");
		}
		
		sock.onclose = function(){
			$("#chat").append("연결 종료");
		}
		
		

		
	</script>
</body>
</html>