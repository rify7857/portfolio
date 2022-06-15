<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<head>
<html lang="en">
<link href="/f5/resources/css/member/mypage/mypage_com.css"
	rel="stylesheet" />
<link href="/f5/resources/css/member/common.css" rel="stylesheet" />
<link href="/f5/resources/css/main/index.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		
	function showPopup(hasFilter) {
		const popup = document.querySelector('#popup');

		if (hasFilter) {
			popup.classList.add('has-filter');
		} else {
			popup.classList.remove('has-filter');
		}

		popup.classList.remove('hide');
	}

	function closePopup() {
		const popup = document.querySelector('#popup');
		popup.classList.add('hide');
	}

$(document).ready(function(){
	$(document).on('click',".popup_btn1",function(){
		var idx = $(".reviewIdx").attr("id");
		var content = $(".reviewcontent").val();
		var score = $(".score").val();
		const popup = document.querySelector('#popup');
		console.log(content);
		$.ajax({
			url : "reviewUpdate.do?idx="+idx+"&content="+content+"&score="+score,
			success : function(msg) {
				
				if ( msg == "succ" ) {
					popup.classList.add('hide');
					location.reload();
				} else {
					alert("error");
				}
			}
		});
	});// .popup_btn1
	
	
});
</script>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<!-- UnderBar -->
	<jsp:include page="../../member/mypage/mypageNav.jsp"></jsp:include>
	<!-- UnderBar -->
	<div class="profile">
		<img class="user-img" src="/f5/resources/images/user.png"><br>
	</div>
	<span class="profile-h"><h2>${sessionScope.memberId } 님, 환영합니다!</h2></span>
	<hr>

	<!-- comment -->
	<div>
		<div class="com_container">
			<H2>My Review</H2>
			<br>

			<table>
				<tr id="table_title">
					<th>매장명</th>
					<th>내용</th>
					<th>평점</th>
					<th>변경사항</th>
				</tr>
				<c:forEach var="rvo"  items="${list}">
				<tr id=${ rvo.reviewIdx } class="reviewIdx">
					<td>${rvo.storeName }</td>
					<td>${rvo.reviewContent }</td>
					<td>${rvo.reviewScore }</td>
					<td><button id="reset_btn" onclick="showPopup(false)">변경하기</button></td>
				</tr>
				</c:forEach>
			</table>
			<br>

			<!-- Search -->
			<div class="my-search-bar">
				<select>
					<option>제목</option>
					<option>내용</option>
				</select> <input class="my-search" type="text"
					placeholder="제목 또는 내용을 입력해주세요."> <span><input
					class="my-bt" type="button" value="검색"></span>
			</div>

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

			<!-- Popup창 -->
			<div id="popup" class="hide">
				<div class="content">
					<div class="pop_name">
					<h3>Store Name<h3>
					</div>
					<p>내용 : <input type="text" class="reviewcontent"></p>
					<p>평점 : <select id="store_score" class="score">
									<option value=1>★</option>
									<option value=2>★★</option>
									<option value=3>★★★</option>
									<option value=4>★★★★</option>
									<option value=5>★★★★★</option>
							</select></p>
					<button class="popup_btn1">수정하기</button>
					<button class="popup_btn2" onclick="closePopup()">취소하기</button>
				</div>
			</div>

		</div>
	</div>

	<!-- Footer-->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
