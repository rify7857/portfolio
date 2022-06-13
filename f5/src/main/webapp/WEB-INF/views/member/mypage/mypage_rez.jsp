<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<html lang="en">

  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link href="/f5/resources/css/member/common.css" rel="stylesheet" />
  <link href="/f5/resources/css/member/mypage/mypage_rez.css"rel="stylesheet" />
	<link href="/f5/resources/css/main/index.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
//calandar
 $( function() {
    $( "#datepicker" ).datepicker(
			
    );
  } );
 
//modal		
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


	
	
</script>

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
				</div>
				<span class="profile-h"><h2>Username 님, 환영합니다!</h2></span>
				<hr>
		
        	</div>
        </div>

	<!-- comment -->
	<div class="rez_container">
		<H2>나의 예약현황</H2>
		<div class="store">
			
			<div class="store_btn">
				<img class="store_img" src="/f5/resources/images/sample1.jpg"><br>
				<a>Store Name</a><br>
				<button class="store_btn1" id="testDatepicker" onclick="showPopup(false)">예약변경</button>
				<button class="store_btn2">예약취소</button>
			</div>
			<div class="store_btn">
				<img class="store_img" src="/f5/resources/images/sample1.jpg"><br>
				<a>Store Name</a><br>
				<button class="store_btn1" id="testDatepicker" onclick="showPopup(false)">예약변경</button>
				<button class="store_btn2">예약취소</button>
			</div>
			<div class="store_btn">
				<img class="store_img" src="/f5/resources/images/sample1.jpg"><br>
				<a>Store Name</a><br>
				<button class="store_btn1" onclick="showPopup(false)">예약변경</button>
				<button class="store_btn2">예약취소</button>
			</div>
		

		</div>
		<br>
		<!-- Search -->
		<div class="my-search-bar">
			<select>
				<option>매장명</option>
				<option>내용</option>
			</select> <input class="my-search" type="text"
				placeholder="매장명 또는 내용을 입력해주세요."> <span><input
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
		<!-- Calendar -->
		<!-- Popup창 -->
		<div id="popup" class="hide">
			<div class="content">
				<div class="pop_name">
					<!-- Calendar -->
					<div>
					
						날 짜 :
						<input type="button" class = "rez-sel" id="datepicker" value="날짜"><br>
						인 원 :
						<select class = "rez-sel">
								<option>--선택--</option>
								<option>1명</option>
								<option>2~3명</option>
								<option>4~5명</option>
								<option>단체(6명이상)</option>
						</select><br>
						시 간 :
						<select class = "rez-sel">
								<option>--선택--</option>
								<option>10:00</option>
								<option>11:00</option>
								<option>12:00</option>
								<option>13:00</option>
								<option>14:00</option>
								<option>17:00</option>
						</select>
					</div><br>
					<div class="store_btn">
					<button class="store_btn1" type="button">변경하기</button>
					<a href="http://localhost:9000/f5/mypage_rez.do"><button class="store_btn2" type="button">취소하기</button></a>
					</div>
				</div>
			</div>
			

		</div>
</div>
		<!-- Footer-->
		<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
