<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<style type="text/css">
/*버튼고정*/
#loginbtn3{position:fixed;right:80px;bottom:70px;z-index:1000}
#loginbtn2{position:fixed;right:80px;bottom:150px;z-index:1000}
#loginbtn{position:fixed;right:80px;bottom:252px;z-index:1000}

#nonloginbtn2{position:fixed;right:80px;bottom:70px;z-index:1000}
#nonloginbtn{position:fixed;right:80px;bottom:162px;z-index:1000}


</style>

 <script type="text/javascript">
//팝업창 띄우기

   var winRef;
   
   function popupAction(){
       if(winRef == null){
           winRef = window.open('chat', 'popupName', 'width=350,height=350,resizeable=no,toolbars=no,menubar=no');
       }else{
           if (winRef.closed == false) {
               winRef.focus();
           }else{
               winRef = window.open('chat', 'popupName', 'width=350,height=350,resizeable=no,toolbars=no,menubar=no');
           }
       }
   }
</script>
<!-- 홈화면 버튼 상태 -->

	<ul>
		<li>
			<div style="cursor:pointer;" onclick="window.scrollTo(0,0); document.getElementById('iframeID').contentWindow.scrollTo(0,0);"id="nonloginbtn">
				<img id="button_img" src="resources/top.png"style="width:80px;">
			</div>		 
 		</li>
		<li>
			<div onclick="popupAction()" id="nonloginbtn2" style="cursor:pointer;">
		   		   <img id="button_img"src="resources/chat.png"style="width:80px;">
		    </div>
		</li>
    </ul>

