<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<html lang="en">
<link href="/f5/resources/css/member/mypage/mypage.css" rel="stylesheet" />
<link href="/f5/resources/css/member/common.css" rel="stylesheet" />
<link href="/f5/resources/css/main/index.css" rel="stylesheet" />
</head>
    <body>
    	<jsp:include page="../../header.jsp"></jsp:include>
    	<!-- UnderBar -->
    	<jsp:include page="../../member/mypage/mypageNav.jsp"></jsp:include>
		<!-- UnderBar -->
        <!-- User Information -->
        <div>
        	<div>
        		<div class="profile">
					<img class="user-img" src="/f5/resources/images/user.png"><br>
					<a href="mypage_info.do"><button class="user-fix" type="button">회원정보변경</button></a>
				</div>
				<span class="profile-h"><h2>${sessionScope.memberId } 님, 환영합니다!</h2></span>
				<hr>
			
        	</div>
        </div>
        
        <!-- Footer-->
	<jsp:include page="../../footer.jsp"></jsp:include><br>
    </body>
</html>
