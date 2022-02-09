
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


	<form id="chatForm">
		<input type="text" id="message"/>
			<c:if test="${sessionId != null }">
				${sessionId}
			<input type="hidden" id="userid" value="${sessionId }"/>
			</c:if>
			<c:if test="${Dnickname != null }">
				${Dnickname}
			<input type="hidden" id="userid" value="${Dnickname }"/>
			</c:if>
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
