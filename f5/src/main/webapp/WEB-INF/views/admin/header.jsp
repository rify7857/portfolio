<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/f5/resources/favicon.ico" />
<script src="/f5/resources/js/scripts.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<meta charset="UTF-8">
<link href="/f5/resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
/* ::-webkit-scrollbar { */
/* 	display: none; */
/* } */
html > body {
	overflow-y:scroll; 
}
.header-image {
    width: 250px;
    height: 50px;
    object-fit: cover;
    margin-left : 0px !important;
    position: absolute !important;
    top : 0px !important;
}
</style>
</head>
<body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-orange">
            <div class="container">
                <div class = "header-img-box"><a class="navbar-brand" href="http://localhost:9000/f5/admin/admin.do"><img class = "header-image" src = "/f5/resources/images/mainlogo.png"></a></div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                        	<a class="nav-link" href="#">Member</a>
                        	<ul class ="nav-inner">
                        		<li><a href="member_list.do">일반회원</a></li>
                        		<li><a href="ceo_member_list.do">CEO회원</a></li>
                        		<li><a href="black_member_list.do">블랙리스트</a></li>
                        	</ul>
                        </li>
                        <li class="nav-item">
                        	<a class="nav-link" href="#">Board</a>
                        	<ul class ="nav-inner">
	                        	<li><a href="board_list.do">자유게시판</a></li>
	                        	<li><a href="notice_list.do">공지사항</a></li>
                        	</ul>
                        </li>
                        <li class="nav-item">
                        	<a class="nav-link" href="#!">Store</a>
   							<ul class ="nav-inner">
   								<li><a href="store_list.do">매장</a></li>
   							</ul>
   						</li>
                        <li class="nav-item" class = "nav-litem"><a class="nav-link" aria-current="page" href="#">Center</a><div></div>
                    		<ul class ="nav-inner">
                    			<li><a href="faq_list.do">FAQ</a></li>
                    			<li><a href="question_list.do">문의하기</a></li>
                    		</ul>
                    	</li>
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>