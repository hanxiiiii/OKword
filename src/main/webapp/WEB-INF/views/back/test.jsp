<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>
  <title>Document</title>

  <script language="javascript">
  function showPopup() {
	  window.open("test2", "a", 
		  "width=400, height=300, left=100, top=50");  
	  }
  function showPopup2() {
	  var focusPopup;
	  focusPopup = Window.open("test2", "a" );foucusPopup.focus();  
	  }
  var winRef;
  
  function popupAction(){
      if(winRef == null){
          winRef = window.open('test2', 'popupName', 'width=1300,height=400');
      }else{
          if (winRef.closed == false) {
              winRef.focus();
          }else{
              winRef = window.open('test2', 'popupName', 'width=1300,height=400');
          }
      }
  }
   

  </script>
  
</head>

<body>
  <input type="button" value="팝업창 호출" onclick="showPopup();" />
  <input type="button" value="팝업창 호출" onclick="showPopup2();" />
   <button onclick="popupAction()">
      Focus GeeksforGeeks
    </button>
   
</body>
</html>