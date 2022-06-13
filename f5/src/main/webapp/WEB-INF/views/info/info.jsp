<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>
<link href="/f5/resources/css/info/info.css" rel="stylesheet">
<head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 언더바 -->
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

			<!-- 로고 -->

			<div class="hyun">
				
				<img alt="" src="/f5/resources/images/로고(원형).png" />
			</div>

			<!--텍스쳐 입력-->

			<div class="text">
				<h1>소개글</h1><br>
				<h5>안녕하세요! F5 [REFRESH] Team 입니다.</h5>

				<P>인구대비 매일 20% 유동인구를 차지하고 있는 강남역은 항상 만남과 소통이 가득한 곳이지요.<br>
				그만큼 많은 문화의 거리도 있지만, 가장 중요한 것은 입으로 즐기는 맛집이 제일 큽니다!<Br>
				하지만 즐기지 못하는 여러분!</P><br>
				<h4>F5 Team에서 야심차게 준비한 <br><span id="GangnamFoodly">Gangnam Foodly</span>를 통해 강남을 즐겨보세요.</h4><br>

				<p>Gangnam Foodly는 위치기반을 바탕으로 맛집을 소개 및 홍보를 할 수 있는 사이트 입니다.<br> 
				음식점 검색 및 정보를 누구나 이용할 수 있으며, 언제든지 자유롭고 편하게 이용이 가능합니다.<br><br>
				회원님의 경우 내가 가본 그 집! 바로 좋아요! 눌러주고 댓글남기고 싶으면 -> <span id=syn>추천 및 댓글</span><br>
				단골매장 등록하여 매달 매장의 이벤트를 받는 건 어떠신지요? -> <span id=syn>단골매장등록</span><br>
				기다리기 지루하시죠? 더이상 기다리지 마세요. -> <span id=syn>예약하기</span><br>
				그 집이 참 맛있었는데.. 편리하게 주문하는 건 어때요? -> <span id=syn>주문하기</span><br>
				<br>
				혹시 <span id=syn>사장님</span>이세요?<br>
				손 쉽고 간편하게 매장에 대한 정보를 관리하고 싶으시죠? -> <span id=syn>매장관리</span><br>
				우리 매장의 단골에 대해 알고 싶으시죠? -> <span id=syn>단골관리</span><br>
				오늘은 예약이 몇 건이 있지? -> <span id=syn>예약관리</span><br>
				이번 달에 우리 매장이 이벤트 할건데.. -> <span id=syn>이벤트관리</span><br><br>
				이렇게 쉽고 좋은 기능이 있는데 아직도 회원이 아니세요? -> <a id=syn href="join.do">회원가입</a>		 
				</p>
				
				<h5>이상으로 <span id="GangnamFoodly">Gangnam Foodly</span> 많이 이용해주세요!</h5>
				<br><br><br>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<jsp:include page="../footer.jsp"></jsp:include><br>
</head>
</body>
</html>