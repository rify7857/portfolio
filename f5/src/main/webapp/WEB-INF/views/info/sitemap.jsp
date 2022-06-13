<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>
<link href="/f5/resources/css/info/sitemap.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="head-nav-container">
		<label class="head-nav-title">Introduce</label>
		<div class="head-nav-inner">
			<ul class="nav-col-ul">
				<li><a href="info.do">소개글</a></li>
				<li><a href="sitemap.do">사이트맵</a></li>
				<li><a href="#">-</a></li>
				<li><a href="#">-</a></li>
				<li><a href="#">-</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div id="content">
				
				<section>
					<div class="content">
						<img class="image" src="/f5/resources/images/main.png">
						<div class="site_info">
						<h1>사이트맵</h1><br>
							<span id="hea">> 메인 페이지</span><br> '메인 페이지'에서 검색 / 로그인 버튼을 클릭시, 해당펭지 이동합니다.<br>
							로그인 시, 로그인 부분에 로그아웃 / 마이페이지 버튼이 나타납니다.<br> <br> 
							검색 창에 입력후, 해당 상점 관련 페이지로 이동합니다.<br> 
							헤드헌팅된 맛집을 클릭하면 태그에 맞는 검색 결과 페이지로 이동합니다.<br> 
							게시판 별 관련 링크를 클릭 시, 해당 관련 게시판으로 이동합니다. <br> 
							회원가입이 필요한 경우<br> 
							'헤더' 또는 '로그인 페이지'에 '회원가입'버튼(링크)를 누르면 회원가입 페이지로 이동하게 되고, 
							입력란에 정보를 입력 후 가입하기 버튼을 누르면 메인 페이지로 이동되며 로그인을 진행할 수 있습니다.<br>
						</div>
					</div>
				</section>
				<hr>
				<section>
					<div class="content">
						<img class="image" src="/f5/resources/images/login.png">
						<div class="site_info">
							<span id="hea">> 로그인 페이지</span><br> 
							'Username/Password'에서 아이디/비밀번호 입력란에 입력 후, 로그인 버튼을 누르면
							로그인 상태가 됩니다.<br> <br> 
							Inviteme를 누르면, 회원가입페이지로 넘어갑니다.<br>
							Forgetme를 누르면, 아이디/비밀번호 찾기페이지로 넘어갑니다<br>
							Submit을 누르면, 로그인이 가능합니다.<br><br> 
							>간편로그인<br>
							네이버 또는 카카오톡으로 간편하고 손쉽게 가입 및 회원이 될 수 있습니다.<br>
						</div>
					</div>
				</section>
				<hr>
				<section>
					<div class="content">
						<img class="image" src="/f5/resources/images/join.png">
						<div class="site_info">
							<span id="hea">> 회원가입 페이지</span><br> '메인페이지' 또는 '로그인'에서 회원가입 링크를 누르면 
							회원가입 페이지가 출력되며 이 곳에서 회원가입을 진행하면 됩니다.<br><br> 
							입력창 : 아이디, 비밀번호, 비밀번호확인, 이름, 생년월일, 휴대전화, 이메일<br> 
							선택창 : 성별, 비밀번호힌트<br><br> 
							아이디 중복체크를 하여, 사용가능한 아이디로 가입해주세요.<br> 
							주소를 검색하여 보다 편하게 주소를 입력받으세요.<br> 
							정보수집 및 이용약관에 대해 체크해주시고 동의해주시면 됩니다.<br>
						</div>
					</div>
				</section>
				<hr>
				<section>
					<div class="content">
						<img class="image" src="/f5/resources/images/mypage.png">
						<div class="site_info">
							<span id="hea">> 마이 페이지</span><br> 회원이 되시면 보다 쉽고 빠르게 내 정보 및 관련 정보를 쉽게 보고 수정할 수 있습니다.<br><br> 
							쿠폰함 : 단골매장의 이벤트 및 쿠폰을 관리할 수 있습니다.<br>
							리뷰관리 : 내가 쓴 리뷰를 수정하고 평점을 변경할 수 있습니다.<br>
							게시판 : 내가 쓴 글을 보고 관리할 수 있습니다.<br> 
							예약현황 : 예약된 사항을 변경하거나 수정할 수 있습니다.<br> 
							단골매장 : 단골매장으로 등록된 매장을 취소하거나 변경할 수 있습니다.<br><br>
							
							정보변경 : 프로필사진 및 개인 정보를 모두 변경할 수 있습니다.
						</div>
					</div>
				</section>
				<hr>
		
				<hr>
			
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" /><br>
</body>
</html>