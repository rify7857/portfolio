<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<link href="/f5/resources/css/main/index.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    	$(document).ready(function(){
    		$('.main_login_button').on('click',function(){
    			if($('#input_id').val() == ""){
    				alert("아이디를 입력해주세요");
    			}else if($('#input_pass').val() == ""){
    				alert("비밀번호를 입력해주세요");
    			}else{
    				member_login_form.submit();
    			}
    		});
    	});
</script>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->

			<div class="col-lg-8">

				<div class="card mb-41">
					<a href="store.do"> <span class="text-top">이달의 맛집</span>
						<p class="text-down">"아빠 어디가? 추천 맛집! 푸들리가 추천드립니다."</p> <img
						class="card-img-top" src="/f5/resources/images/고기.jpeg" alt="..." />
					</a>
				</div>
				<div class="card mb-41">
					<a href="store.do"> <span class="text-top">평점 맛집</span>
						<p class="text-down">"너도 가봤어? 야나두! 여러분이 추천드립니다."</p> <img
						class="card-img-top" src="/f5/resources/images/스시.jpeg" alt="..." />
					</a>
				</div>
				<div class="card mb-41">
					<a href="store.do"> <span class="text-top">인증샷 맛집</span>
						<p class="text-down">"자기야! 카페도 가고 인증샷 찍으러 가자! GoGo!"</p> <img
						class="card-img-top" src="/f5/resources/images/빵.jpeg" alt="..." />
					</a>
				</div>
				<div class="card mb-41">
					<a href="store.do"> <span class="text-top">점심 맛집</span>
						<p class="text-down">"오늘은 뭘 먹지? 란 고민 말고! 얼른 가서 즐겨보자!"</p> <img
						class="card-img-top" src="/f5/resources/images/짬뽕.jpeg" alt="..." />
					</a>
				</div>
				<div class="card mb-41">
					<a href="store.do"> <span class="text-top">회식 맛집</span>
						<p class="text-down">"부장님, 오늘은 여기 가시죠! 직장인이 추천드립니다."</p> <img
						class="card-img-top" src="/f5/resources/images/전.jpeg" alt="..." />
					</a>
				</div>
			</div>

			<!-- Side widgets-->

			<div class="col-lg-4">

				<c:choose>
					<c:when test="${sessionScope.memberId == null}">
						<div class="card mb-4 login_sec">
							<div class="card-body">
							<form name="member_login_form" action="login.do" method="post">
								<button class="main_login_button" type="button">로 그 인</button>
								<input class="input_id" type="text" placeholder="Username" name="memberId" id="input_id">
								<input class="input_id" type="password" placeholder="****" name="memberPass" id="input_pass">
							</form>



							</div>
							<div class="main_join_button1">
								<a href="">아이디/비밀번호찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="join.do">회원가입</a>
							</div>
							<div class="card-body">
								<div class="login-easily">
									<a href="login.do">
									<button type="button" class="easy_login">
										<img class="login-logo"
											src="/f5/resources/images/kakao_logo.jpeg"> <img
											class="login-logo" src="/f5/resources/images/naver_logo.jpeg">
										간 편 로 그 인
									</button>
									</a>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card mb-4">
							<div class="card-header">${sessionScope.memberName }님, 환영합니다. <span id="hellotext">맛있는 하루되세요!</span>
								</div>
							<div class="card-body">
								<a href="mypage.do"><button type="button" class="mypage-button">마이페이지</button></a>
								<a href="mypage_rez.do"><button type="button" class="reservation-button">예약확인</button></a>
								<a href=""><button type="button" class="reservation-button">장바구니</button></a>
								<a href="http://localhost:9000/f5/logout.do"><button type="button" class="logout-button">로그아웃</button></a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="card mb-4">
					<div class="card-header1">공 지 사 항</div>
					<div class="card-body">
						<div class="main_notice">
							<ul class="new_notice">
								<c:forEach var="result" items="${ result.noticeList }">
									<li><a href="board_content.do?boardIdx=${ result.boardIdx }">
									<c:if test="${result.boardCategory eq '공지'}">[공지]</c:if>
									${ result.boardTitle }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div class="card mb-4">
					<div class="card-header1">최 신 뉴 스</div>
					<div class="card-body">
						<div class="main_news">
							<ul class="new_news">
								<c:forEach var="result" items="${ result.newsList }">
									<li>
										<a class="content" href="${result.contentURL }">${result.title }</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header1">CATEGORIES</div>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">#단체 회식</a></li>
									<li><a href="#!">#인스타 감성</a></li>
									<li><a href="#!">#치맥 한잔?</a></li>
								</ul>
							</div>
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">#점심 맛집</a></li>
									<li><a href="#!">#데이트</a></li>
									<li><a href="#!">#유투브 도전</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4 ">
					<div class="card-header1">자유게시판</div>
					<div class="card-body">
						<div class="main_board">
							<ul class="new_board">
							<c:forEach var="result" items="${ result.boardList }">
								<li><a href="board_content.do?boardIdx=${ result.boardIdx }">
								<c:if test="${ result.boardCategory eq '일반' }">[일반]</c:if>
								<c:if test="${ result.boardCategory eq '홍보' }">[홍보]</c:if>
								${ result.boardTitle }</a></li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- row -->
		<!-- Pagination-->

				<nav aria-label="Pagination">
					<hr class="my-0" />
					<ul class="pagination justify-content-center my-4">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">Newer</a></li>
						<li class="page-item active" aria-current="page"><a
							class="page-link" href="#!">1</a></li>
						<li class="page-item"><a class="page-link" href="#!">2</a></li>
						<li class="page-item"><a class="page-link" href="#!">3</a></li>
						<li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
						<li class="page-item"><a class="page-link" href="#!">15</a></li>
						<li class="page-item"><a class="page-link" href="#!">Older</a></li>
					</ul>
				</nav>
	</div>
	<!-- container -->

	<!-- Footer-->
	<jsp:include page="../footer.jsp"></jsp:include><br>
</body>
</html>
