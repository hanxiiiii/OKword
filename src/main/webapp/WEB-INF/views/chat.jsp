<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="resources/sockjs.min.js"></script>
<title>Chat</title>


<style>
body{
background: linear-gradient( to bottom, #7543c0, #8A54A2 );
background-attachment:fixed;
}
.send_message{position:fixed;right:10px;bottom:0px;z-index:1000;}
.me{
         color: #F6F6F6;
         text-align: right;
      }
.others{
   /*color: #FFE400;*/
   text-align: left;
}
#send_message{position:fixed;bottom:0px;z-index:1000}
</style>
   <form id="chatForm" style="position:fixed;background-color:#7543c0; z-index:999" >
   <div id="send_message">
      <c:if test="${mdto.member_id != null}">
      <input type="text" id="message" style="z-index:999;"/>
   
         <button id="send_btn" style="z-index:999;">send</button>
      </c:if>
      <c:if test="${mdto.member_id == null}">
      <a style="color:white">로그인시 채팅가능</a>
      </c:if>
      
      <p>
   </div>
         <c:if test="${mdto.member_nickname != null }">
         <div style="width: 100vw; color: #7543c0; height:50px;">
            <a class="chat_name"style="color: #F6F6F6;">사용자 : ${mdto.member_nickname}</a>
         </div>
         <input type="hidden" id="userid" value="${mdto.member_nickname}"/>
         <input type="hidden" id="memberid" value="${mdto.member_id}"/>
         <input type="hidden" id="memberuserid" value="${mdto.member_userid}"/>
         </c:if>         
         <c:if test="${mdto.member_id == null}">
               <span class="chat_name" style="color:white">사용자 : 게스트</span>
         <input type="hidden" id="userid" value="게스트"/>
         <input type="hidden" id="memberid" value="0000"/>
         </c:if>
      
   </form>
<style>

</style>
   <div id="chat" style="position: relative; top:50px;"></div>
   <script>
   //게스트 전송불가능
   const loginForm= document.querySelector("#chatForm");
         function onGestSubmit(event){
            event.preventDefault();
            console.log(event);
         }
   loginForm.addEventListener("submit",onGestSubmit);
         
   
   
   
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
         var da = e.data.substr(cut);
         var cut2  = da.indexOf(":");
         var cut3  = da.indexOf(":");
         var da2 = da.substring(0,cut2-2);
         
         
         var chattext2 =  da.substring(cut3+1);
         //alert(chattext2);
         
         if(chattext2.replace(/ /gi, "") == ""){
        	if(memberuserid == user_id){
        		alert("내용을 입력해 주세요");
        	}
              
            return 0;
         }else{
            var arr = ["<", ">", "'\'" ]; 
            for (var i = 0; i < arr.length - 1; i++) {
               if(chattext2.indexOf(arr[i]) != -1){
                  alert("사용 하 실 수 없는 문구가 포함되어있습니다. \n 사용 불가 문구 : '<', '>', ''\'' ");
                  return 0;
               }
                  
            }
         
            
         }
         
         
         var chattext = chattext2.trim();
         
         var da3 = da2.trim();
         var today = new Date();   
         var hours = ('0' + today.getHours()).slice(-2); 
         var minutes = ('0' + today.getMinutes()).slice(-2);
         var seconds = ('0' + today.getSeconds()).slice(-2); 
         var timeString = hours + '&nbsp:&nbsp' + minutes; 
         var sessionId = document.getElementById('chat').value;
         
         
         
      
         var test = memberid.value;
         var color = $("#userid").val();
         var color2 = " ";
         
      
         for(var i=0; i<=color.length-1; i++){
            color2 = color2 + color.charCodeAt(i);            
         }
         color2 = color2.trim();
         
         
         var color3 = color2.substring(0,3)%255;
         var color4 = color2.substring(3,6)%255;
         var color5 = color2.substring(6,9)%255;
         
         var color6 = color3+","+color4+","+color5;
         console.log(color3,color4,color5)
         console.log("chattext"+chattext,"sessionid"+sessionId ,"chat_message"+chat_message);
         if(da3 == $("#userid").val()){         
        	
            $("#chat").append("<p class='me'>" + da + "<br>" + timeString+"</p>");   
        
         }else{
            $("#chat").append("<p style='color:rgb("+color6+")'; class='others'>" + da + "<br>" + timeString+ "</p>");
        
         }   
        
         var chat_message = document.querySelector('.me').innerText;
         sessionStorage.setItem("chat_message", chat_message ); // 저장
         console.log("chat_message"+chat_message);
         $(document).scrollTop($(document).height());
          $.ajax({
                  url:"chat_message.do?chat_message="+chat_message,
                  data:{
                     chattext:chattext,
                     test:test,
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
      }
      
      sock.onclose = function(){
         $("#chat").append("연결 종료");
      }
      
   </script>