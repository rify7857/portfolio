<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<html lang="en">
<link href="/f5/resources/css/member/mypage/mypage_rez.css" rel="stylesheet" />
<link href="/f5/resources/css/member/common.css" rel="stylesheet" />
<link href="/f5/resources/css/main/index.css" rel="stylesheet" />
</head>
    <body>
    	<jsp:include page="../../header.jsp"></jsp:include>
    	<!-- UnderBar -->
    	<jsp:include page="../../member/mypage/mypageNav.jsp"></jsp:include>
    	<!-- UnderBar -->
        
       <!-- comment -->
       <div class="rez_container">
	       		<H2>나의 단골매장</H2>
	       		<div class="store">
	       			<img class="store_img"src="/f5/resources/images/sample1.jpg">
	       			<a>Store Name</a>
	       			<div class="store_btn">
	       				<button>예약하기</button>
	       				<button>단골취소</button>
	       			</div>
	       			<img class="store_img"src="/f5/resources/images/sample1.jpg">
	       			<a>Store Name</a>
	       			<div class="store_btn">
	       				<button>예약하기</button>
	       				<button>단골취소</button>
	       			</div>
	       			<img class="store_img"src="/f5/resources/images/sample1.jpg">
	       			<a>Store Name</a>
	       			<div class="store_btn">
	       				<button>예약하기</button>
	       				<button>단골취소</button>
	       			</div>
	       		
	       		</div>
	       		<br>
	       		<!-- Search -->
	       		<div class="my-search-bar">
	       			<select>
	       				<option>매장명</option>	
	       				<option>내용</option>
	       			</select>
	       			<input class="my-search" type="text" placeholder="매장명 또는 내용을 입력해주세요.">
                   	<span><input class="my-bt"type="button" value="검색"></span>
	       		</div>
       			<!-- Pagination-->
                <nav aria-label="Pagination">
                    <hr class="my-0" />
                       <ul class="pagination justify-content-center my-4">
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                            <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                            <li class="page-item"><a class="page-link" href="#!">15</a></li>
                            <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                        </ul>
                    </nav>
       	
       </div>
        
        <!-- Footer-->
	<jsp:include page="../../footer.jsp"></jsp:include>
    </body>
</html>
