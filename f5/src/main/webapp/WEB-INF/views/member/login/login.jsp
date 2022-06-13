<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Gangnam Foodly</title>
<!--  meta tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../favicon.ico">


<!--================= Include All Styles ==================-->
<link rel="stylesheet" type="text/css"
	href="/f5/resources/css/member/login/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="/f5/resources/css/member/login/font-awesome.css" />
<!-- main styles-->
<link rel="stylesheet" type="text/css"
	href="/f5/resources/css/member/login/styles.css" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    	$(document).ready(function(){
    		$('#btnLogin').on('click',function(){
    			if($('#InputUserEmail1').val() == ""){
    				alert("아이디를 입력해주세요");
    			}else if($('#InputPassword').val() == ""){
    				alert("비밀번호를 입력해주세요");
    			}else{
    				member_login_form.submit();
    			}
    		});
    	});
</script>
</head>
<!--==================== body ======================= -->

<body>

	<!--================= Main Wrapper ==================-->


	<div class="login-form">
		<form name="member_login_form" action="login.do" method="post">
			<div class="login-form-title">
				<a href="index.do"><img src="/f5/resources/images/mainlogo2.png"></a>
			</div>
			<div class="form-group">
				<label for="InputUserEmail1">Username</label> <input type="email"
					class="form-control" id="InputUserEmail1" name="memberId" />
			</div>
			<div class="form-group">
				<label for="InputPassword">Password</label> <input type="password"
					class="form-control" id="InputPassword" name="memberPass">
			</div>
			<div class="form-group forgo-remember">
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="CheckBox">
					<label class="form-check-label" for="CheckBox">Remember me
					</label>
				</div>

				<div class="forgot-password">
					<a href="join.do" class="txt1"> Invite me</a> / <a href="#"
						class="txt1"> Forget me</a>
				</div>
			</div>
			<button type="button" id="btnLogin"
				class="btn btn-primary custom-btn">S U B M I T</button>

		</form>

		<div class="or">간편로그인</div>

		<div class="social-login">
			<div class="loginButton" id="button_area">
				<div id="naverIdLogin"></div>
			</div>
			<script
				src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
				charset="utf-8"></script>
			<script type="text/javascript">

const naverLogin = new naver.LoginWithNaverId(
 {
  clientId: "UGfLaF3AX0yt1KjWZC57",
  callbackUrl: "http://localhost:9000/f5/login.do",
  loginButton: {color: "green", type: 3}
  }
 );


  naverLogin.init();
  naverLogin.getLoginStatus(function (status) {
    if (status) {
        const nickName=naverLogin.user.getNickName();
        const age=naverLogin.user.getAge();
        const birthday=naverLogin.user.getBirthday();

        if(nickName===null||nickName===undefined ){
          alert("별명이 필요합니다. 정보제공을 동의해주세요.");
          naverLogin.reprompt();
          return ;  
       }else{
        setLoginStatus();
       }
	}
  });
  console.log(naverLogin);

  function setLoginStatus(){
  
    const message_area=document.getElementById('message');
    message_area.innerHTML=`
    <h3> Login 성공 </h3>
    <div>user Nickname : ${naverLogin.user.nickname}</div>
    <div>user Age(범위) : ${naverLogin.user.age}</div>
    <div>user Birthday : ${naverLogin.user.birthday}</div>
    `;
   
    const button_area=document.getElementById('button_area');
    button_area.innerHTML="<button id='btn_logout'>로그아웃</button>";

    const logout=document.getElementById('btn_logout');
    logout.addEventListener('click',(e)=>{
      naverLogin.logout();
	location.replace("http://localhost:9000/f5/index.do");
    })
  }
 
</script>
		</div>
		<div class="kakaoButton">
			<ul>
				<li onclick="kakaoLogin();"><a href="javascript:void(0)"> <img
						class="kakaoButton" src="/f5/resources/images/kakao_login.png">
				</a></li>

			</ul>
			<!-- 카카오 스크립트 -->
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
Kakao.init('196685263f4cd00c83c3569bec45c7a3'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: 'http://localhost:9000/f5/login.do',
          success: function (response) {
        	  console.log(response)
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
		</div>


	</div>

	<!--================= Div End ==================-->

	<!--================= Include All JS ==================-->
	<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap v4.3.1-->
	<script src="/f5/resources/js/member/bootstrap.min.js"></script>
</body>

</html>