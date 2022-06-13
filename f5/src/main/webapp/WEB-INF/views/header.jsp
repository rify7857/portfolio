<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gangnam Foodly</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/f5/resources/favicon.ico" />
<script src="/f5/resources/js/scripts.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<meta charset="UTF-8">
<link href="/f5/resources/css/styles.css" rel="stylesheet" />

<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css"
	href="/f5/resources/engine1/style.css" />
<script type="text/javascript" src="/f5/resources/engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click', '.fw-bt', function(){
		var search = $(".fw-search").val();
		if ( search == '' ) {
			
			alert("검색어를 입력해주세요.");
		} else {
			
			location.href="store_search.do?search="+search;
		}
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-orange">

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<div class="container">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<div class="header-img-box">
						<a class="navbar-brand" href="index.do"><img
							class="header-image" src="/f5/resources/images/mainlogo.png"></a>
					</div>
					<li class="nav-item mber_bar"><c:choose>
							<c:when test="${sessionScope.memberId ==null}">
								<a class="nav-link" href="#">Member</a>
								<ul class="nav-inner">
									<li><a href="http://localhost:9000/f5/login.do">로그인</a></li>
									<li><a href="http://localhost:9000/f5/join.do">회원가입</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="#">MemberInfo</a>
								<ul class="nav-inner">
									<li><a href="http://localhost:9000/f5/logout.do">로그아웃</a></li>
									<li><a href="http://localhost:9000/f5/mypage.do">마이페이지</a></li>
								</ul>
							</c:otherwise>
						</c:choose></li>
					<li class="nav-item"><a class="nav-link" href="#">Introduce</a>
						<ul class="nav-inner">
							<li><a href="http://localhost:9000/f5/info.do">회사소개</a></li>
							<li><a href="http://localhost:9000/f5/sitemap.do">사이트맵</a></li>
							<li><a href="#">이용약관</a></li>
							<li></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#!">Board</a>
						<div></div>
						<ul class="nav-inner">
							<li><a href="board_list.do">자유게시판</a></li>
							<li><a href="promote_list.do">홍보게시판</a></li>
							<li><a href="news_list.do">뉴스</a></li>
							<li></li>
							<li></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#!">Store</a>
						<div></div>
						<ul class="nav-inner">
							<li><a href="http://localhost:9000/f5/store.do">매장검색</a></li>
							<li><a href="store_join.do">매장등록</a></li>
							<li><a href="#">예약확인</a></li>
							<li><a href="#">배달접수</a></li>
						</ul></li>
					<li class="nav-item" class="nav-litem"><a class="nav-link"
						aria-current="page" href="#">Center</a>
						<div></div>
						<ul class="nav-inner">
							<li><a href="http://localhost:9000/f5/faq_list.do">FAQ</a></li>
							<li><a href="http://localhost:9000/f5/question_list.do">문의하기</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page header with logo and tagline-->
	<header class="py-5 bg-light border-bottom mb-4">
		<!-- Start WOWSlider.com BODY section -->
		<div id="wowslider-container1">
			<div class="ws_images">
				<ul>
					<li><img src="/f5/resources/data1/images/1.png" alt=""
						title="" id="wows1_0" /></li>
					<li><img src="/f5/resources/data1/images/2.png" alt=""
						title="" id="wows1_1" /></li>
					<li><img src="/f5/resources/data1/images/3.png" alt=""
						title="" id="wows1_2" /></li>
					<li><img src="/f5/resources/data1/images/4.png" alt=""
						title="" id="wows1_3" /></li>
					<li><a href="http://wowslider.net"><img
							src="/f5/resources/data1/images/5.png" alt="css slideshow"
							title="" id="wows1_4" /></a></li>

				</ul>
			</div>
		</div>
		<script type="text/javascript"
			src="/f5/resources/engine1/wowslider.js"></script>
		<script type="text/javascript" src="/f5/resources/engine1/script.js"></script>
		<!-- End WOWSlider.com BODY section -->
		<div class="container">
			<div class="text-center my-5">
				<div class="py-51_box">
					<h1 class="fw-bolder">친근하고 맛있는 검색!</h1>
					<img class="fw-img" src="/f5/resources/images/mainlogo2.png"><br>
					<input class="fw-search" type="text" placeholder="원하시는 가게 또는 음식을 입력해주세요." value="${ search }">
					<span><input class="fw-bt" type="button" value="검색"></span>
				</div>
			</div>
		</div>
	</header>
</body>
</html>