<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage</title>
</head>
<style>

   #popup {
     position:absolute;
     visibility:hidden;
     width:200px;
     height:100px;
   }

html {
	  background-attachment:fixed;
	  width: 100%;
	  height: 125vh;
	  background: linear-gradient( to bottom, #7543c0, #8A54A2 );
}
li{
list-style:none; 
}
</style>
<script>

</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('0f743acacb4ef645a3f078a777984d01'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
var state = 1;





//카카오로그아웃  
function Logoff(social){
	if(social == 'kakao'){
		kakaoLogout();
	}else if(social == 'naver') {
		naverLogout();
	}	
}


console.log(state);
function kakaoLogout() {
	  if (confirm("정말 탈퇴하시겠습니까??") == true) {
		    if (Kakao.Auth.getAccessToken()) {
		        Kakao.API.request({
		          url: '/v1/user/unlink',
		          success: function (response) {
		          	console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		        Kakao.Auth.setAccessToken(undefined)
		        alert("탈퇴하셨습니다.");
		        window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port)+"/logoff?state="+state);
		      }
	        } else {
	      
	        }
  } 
//네이버 로그아웃
function naverLogout() {
	  if (confirm("정말 탈퇴하시겠습니까??") == true) {   
		  const accessToken_test = document.querySelector('#accessToken_test').value;
		  console.log(accessToken_test);
		  alert("탈퇴되었습니다.");
		  $.ajax({
	            url:"https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=GpDHKzjPe__hh3XCfT2m&client_secret=DAMsn8Smth&access_token="+accessToken_test+"&service_provider=NAVER",
	            data:{
	            	accessToken_test:accessToken_test
	            
	            	},
	            type:"post",
	            success:function(data){
	                console.log(data);
	                if(data != ""){
						console.log("test ok");
	                }else{
	                	console.log("test else");
	                }
	            },
	            error:function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                
	                // 에러 로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
	        });
		  window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port)+"/logoff?state="+state);
	
	  }	     	        
} 

function nick_check(){
     const nickname = document.querySelector("#nickname").innerText;
     console.log(nickname);
     var user_id = document.querySelector('#userid').value;
	 const new_nickname = prompt("변경할 닉네임을 입력해주세요.(최대 8글자)",nickname);
	
	 if(new_nickname.length <= 8 && new_nickname.length != 0){	 
		 alert("변경되었습니다.");
		 window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port)+"/update?user_id="+user_id+"&nickname="+new_nickname);
	 }else if(new_nickname.length >= 8){
	 	alert("닉네임은 8글자 까지 가능합니다.");
	 }
	 else if(new_nickname.length == 0){
		 	alert("닉네임은 최소 한글자 이상 입력해주셔야 합니다.");
		 }
}

//닉네임 변경 클릭시 동작
function nickname_change() {
	  
	  var change_btn = document.querySelector('#change_btn');
	  console.log(change_btn);
	  change_btn.id = 'nickname_btn';								//버튼 ID값 수정
	  change_btn.setAttribute("onClick", "new_btn_change()");		//버튼 온클릭이름수정
	  $('#nickname').html(new_input);
	}
//변경된 닉네임변경 클릭시 동작
function new_btn_change(){
	var userid = document.querySelector('#userid').value;
	var Nnickname = document.querySelector('#new_nickname').value;
	window.location.href ="update?userid="+userid+"&Nnickname="+Nnickname;

}
	
//댓글 버튼 클릭시 댓글내역 나옴
function coment_btn(){
	const like_mypage = document.querySelector("#like_mypage").style.color="white";
	const coment_mypage = document.querySelector("#coment_mypage").style.color="yellow";
	document.querySelector("#coment_mypage").style.cursor="default";
	document.querySelector("#like_mypage").style.cursor="pointer";
	const like_table=document.querySelector("#like_table").style.display="none";
	const comment_table=document.querySelector("#comment_table").style.display="block";
	const he = 125-(10-"${fn:length(cmlist)}")*5;
	if(he >= 100){
		document.querySelector("HTML").style.height=he+"vh";
	}else{
		document.querySelector("HTML").style.height="100vh";
	}
	
}
//좋아요 버튼 클릭시 좋아요내역 나옴
function like_btn(){
	const like_mypage = document.querySelector("#like_mypage").style.color="yellow";
	const coment_mypage = document.querySelector("#coment_mypage").style.color="white";
	const like_table=document.querySelector("#like_table").style.display="block";
	document.querySelector("#like_mypage").style.cursor="default";
	document.querySelector("#coment_mypage").style.cursor="pointer";
	const comment_table=document.querySelector("#comment_table").style.display="none";
	const he = 125-(10-"${fn:length(list)}")*8;
	if(he >= 100){
		document.querySelector("HTML").style.height=he+"vh";
	}else{
		document.querySelector("HTML").style.height="100vh";
	}
}
//댓글삭제시 화면 댓글로 유지
window.onload = function() {

	const rescod = document.querySelector("#rescod").value;
	console.log(rescod);
	
	if (rescod == "true") {
		
		const he = 125-(10-"${fn:length(cmlist)}")*8;
		
			if(he >= 100){
				
				
				const like_mypage = document.querySelector("#like_mypage").style.color="white";
				const coment_mypage = document.querySelector("#coment_mypage").style.color="yellow";
				const like_table=document.querySelector("#like_table").style.display="none";
				const comment_table=document.querySelector("#comment_table").style.display="block";
				document.querySelector("HTML").style.height=he+"vh";
			}else{
				
				const like_mypage = document.querySelector("#like_mypage").style.color="white";
				const coment_mypage = document.querySelector("#coment_mypage").style.color="yellow";
				const like_table=document.querySelector("#like_table").style.display="none";
				const comment_table=document.querySelector("#comment_table").style.display="block";
				document.querySelector("HTML").style.height="100vh";
			}
	}
	else{
	
		const he = 125-(10-"${fn:length(list)}")*8;
		if(he >= 100){
			document.querySelector("HTML").style.height=he+"vh";
		}else{
			document.querySelector("HTML").style.height="100vh";
		}
	
	}
}


	//
</script>


<body>
<c:import url="top.jsp">
</c:import>
  <div id="popup" style="z-index:999;">  <!-- 레이어 형태 -->
    <form name="pkc" method="post" action="#popup_check">
	    <table style="width:400px;">
	    <tr>	
	    	<td><span style="color:white;"> 변경을 원하시는 닉네임을 입력해주세요 .</span></td>
	    </tr>
	      <tr>
	      	<td><input type="text" id="new_nickname"></td>
	      </tr>
	      <tr>
	      	<td><input type="button" value="확인" onclick="new_btn_change()"></td>
	      </tr>
	     </table>
    </form>
  </div>
<table>
	<tr>
		<td><input type="hidden" id="rescod" value="${rescod}"></td>
		<td><h1 style="color:white; font-size:50px;position: relative;">마이페이지</h1></td>
	</tr>
</table>
<table style="
		border: 3px solid white; width:1598px; height:245px;position: relative;
        left: 160px; border-radius: 50px;
        " >
     <tr>
		<td rowspan="3" style="position:relative; left:50px;">
			<hr width="3" size="150px" style="background-color:white;">
		</td>
	</tr>
	<tr>
	<c:if test="${user_id != null}">
		<td style="position: relative;top:15px;left:100px;" ><a id ="nickname" style="color:white;font-size:30px;"> ${nickname}</a>  <a style="color:white;font-size:30px;">(회원번호 :${member_id2})</a>  </td>	
		<td style="position: relative; position: relative;width: 300px;top: 18px;"><a id="change_btn" onclick="nick_check()" style="color:white;font-size:25px; cursor:pointer;">닉네임 변경</a> <a style="color:white;font-size:25px;">|</a> <a style="color:white;font-size:25px; cursor:pointer;" onclick="Logoff('${social}');">회원 탈퇴</a></td>
	</c:if>
	</tr>
	<tr>
		<td style="font-size:25px;color:white;position: relative;bottom:35px; left:100px;">총 좋아요 ${user_like_count}개 | 댓글수 ${user_comment_count}개</td>
	</tr>
</table>
<table>
	<tr>
		<td style="position:relative;top:30px; left:180px;">
			<a id="like_mypage" style="font-size:30px;color:yellow; cursor:pointer;" onclick="like_btn()">좋아요♥</a> 
			<a style="font-size:30px;color:white;">|</a> 
			<a id="coment_mypage"style="font-size:30px;color:white;cursor:pointer;"onclick="coment_btn()">댓글</a>
		</td>
	</tr>
<!-- 좋아요 버튼 클릭시 좋아요 리스트 나옵니다. -->
</table>

<table id="like_table">
	<c:forEach var="ndto" items="${list}">   
	<c:if test="${like_id != 0}">
	<tr>
		<td><input type="hidden" value="${ndto.news_id }"></td>
		<td style="position:relative;top:50px; width:1500px; left:150px; color:white;"><a style="font-size:30px;width:1250px; display: block;text-overflow: ellipsis;  overflow:hidden;white-space:nowrap;font-weight:normal;"href="news_content?news_id=${ndto.news_id }">${ndto.news_title}</a></td>
		<td style="position:relative;top:50px; width:160px; font-size:30px;color:white;display: block;overflow:hidden;white-space:nowrap;">${ndto.news_writetime}</td>
		<td ><a href="delete?like_id=${ndto.like_id }&member_id=${mdto.member_id}"style="left:10px;position:relative;top:50px; font-size:30px;color:white;font-weight:normal;">x</a></td>	
	</tr>
	</c:if>
	</c:forEach>
	<tr style="position: relative;top: 100px; left:110px;">
		<td colspan="4" align="center">
			<!-- 이전페이지 이동 -->
			
				<!-- 1페이지 이동 -->
			<c:if test="${user_like_count != 0}">
				<c:if test="${page > 1 }">
					<a href="mypage?page=${page - 1}" style="z-index:999; font-size:20px;color:yellow; position: absolute;bottom: 6px;left: 650px;"> PREV </a>
				</c:if>
				<c:if test="${page == 1 }">
					<a style="color:white; font-size:20px;position: absolute;bottom: 6px;left: 650px;">PREV</a>
				</c:if>
			</c:if>
				<!-- 1페이지 이동 끝 -->
				
	
			<!-- 이전페이지 이동 끝 -->
			<span style="width:400px; position:absolute; bottom:0px; left:650px;">
			<c:forEach begin="${pstart}" end="${pend}" var="i">
				<c:if test="${page == i}">
					<a href="mypage?page=${i}" style="font-weight:normal; font-size:30px;color:yellow">${i}</a>
				</c:if>
				<c:if test="${page != i}">
					<a href="mypage?page=${i}"style=" font-weight:normal;font-size:30px;">${i}</a>
				</c:if>
			</c:forEach>
			</span>	
			<!-- 다음페이지 이동 -->
				<!-- 1페이지 이동 -->
				<c:if test="${page < pagecnt }">
					<a href="mypage?page=${page + 1}" style="z-index:999; font-size:20px;color:yellow; position: absolute;bottom: 6px;left: 1005px;"> NEXT </a>
				</c:if>
				<c:if test="${page == pagecnt }">
					<a style="color:white; font-size:20px; position: absolute;bottom: 6px;left: 1005px;">NEXT</a>
				</c:if>
				<!-- 1페이지 이동 끝 -->
				
				
				<!-- 마지막페이지 끝 -->
			<!-- 다음페이지 이동 끝 -->
		</td>
	</tr>
</table>




<!-- 댓글 버튼 클릭시 댓글리스트가 나옵니다. -->	
<table id="comment_table" style="display:none">
	<c:forEach var="cmdto" items="${cmlist}">
		<tr>
			<td><input type="hidden" id="rescod" value="${rescod }"></td>
			<td><input type="hidden" value="${cmdto.comment_id }"></td>
			<td><input type="hidden" value="${cmdto.news_id }"></td>
			<td style="position:relative;top:50px; width:1500px;left:150px;font-size:30px; color:white;"><a style="font-size:30px; width:1250px; display: block;text-overflow: ellipsis;font-weight:normal;  overflow:hidden;white-space:nowrap;" href="news_content?news_id=${cmdto.news_id }">${cmdto.comment_content}</a></td>
			<td style="position:relative;top:50px; width:160px;font-size:30px;color:white; display: block;overflow:hidden;white-space:nowrap;">${cmdto.comment_writetime}</td>
			<td ><a href="delete2?comment_id=${cmdto.comment_id }&member_id=${mdto.member_id}"style=" left:10px;position:relative;top:50px; font-size:30px;color:white;font-weight:normal;">x</a></td>	
		</tr>
	</c:forEach>
	<tr style="position: relative;top: 100px; left:110px;">
		<td colspan="4" align="center">
			<!-- 이전페이지 이동 -->
			
				<!-- 1페이지 이동 -->
			<c:if test="${user_comment_count != 0}">
				<c:if test="${page2 > 1 }">
					<a href="mypage?rescod=true&page2=${page2 - 1}" style="z-index:999; font-size:20px;color:yellow; position: absolute;bottom: 6px;left: 650px;"> PREV </a>
				</c:if>
				<c:if test="${page2 == 1 }">
					<a style="color:white; font-size:20px;position: absolute;bottom: 6px;left: 650px;">PREV</a>
				</c:if>
			</c:if>
				<!-- 1페이지 이동 끝 -->
				
	
			<!-- 이전페이지 이동 끝 -->
			<span style="width:400px; position:absolute; bottom:0px; left:650px;">
			<c:forEach begin="${pstart2}" end="${pend2}" var="i">
				<c:if test="${page2 == i}">
					<a href="mypage?rescod=true&page2=${i}" style="font-weight:normal; font-size:30px;color:yellow">${i}</a>
				</c:if>
				<c:if test="${page2 != i}">
					<a href="mypage?rescod=true&page2=${i}"style=" font-weight:normal;font-size:30px;">${i}</a>
				</c:if>
			</c:forEach>
			</span>	
			<!-- 다음페이지 이동 -->
				<!-- 1페이지 이동 -->
				<c:if test="${page2 < pagecnt2 }">
					<a href="mypage?rescod=true&page2=${page2 + 1}" style="z-index:999; font-size:20px;color:yellow; position: absolute;bottom: 6px;left: 1005px;"> NEXT </a>
				</c:if>
				<c:if test="${page2 == pagecnt2 }">
					<a style="color:white; font-size:20px; position: absolute;bottom: 6px;left: 1005px;">NEXT</a>
				</c:if>
				<!-- 1페이지 이동 끝 -->
				
				
				<!-- 마지막페이지 끝 -->
			<!-- 다음페이지 이동 끝 -->
		</td>
	</tr>
</table>

<input type="hidden" id="accessToken_test" value="${accessToken_test }">
<input type="hidden" id="userid" value="${user_id}">




<!-- 하단 footer import-->
<div style="position: relative; top: 150px;left: 75px;">
<c:import url="bottom.jsp"/>
</div>
<!--끝-->