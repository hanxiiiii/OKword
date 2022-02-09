<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Kakao LOGIN</title>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">


Kakao.init('0f743acacb4ef645a3f078a777984d01'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
         	  var Duserid = response.id;
        	  var Dnickname = response.properties.nickname;

        	  console.log(response)
        	  console.log('Duserid',Duserid)
        	  console.log('Dnickname',Dnickname)
        	  window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/login_ok?userid="+Duserid+"&nickname="+Dnickname);
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
 
</script>

</head>
<body>


	<div onclick="kakaoLogin();">
      <a href="javascript:void(0)" onclick="test2();">
          <img width="223" src="resources/img/kakao_icon.png" style="z-index:999;position: relative; bottom:100px; right:28px; width:120px; "/>
      </a>
	</div>

</body>
</html>

