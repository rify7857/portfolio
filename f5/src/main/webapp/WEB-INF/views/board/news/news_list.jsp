<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>

<style type="text/css">

.press {
	text-decoration: none;
	color: black;
	
}

.press img {
	width: 10%;
	height: 10%;
	margin-right: 5px;
}

.content {
	text-decoration: none;
	color: black;
}

.content:hover {
	color: inherit;
}

.main_img > img {
	margin-bottom: 20px;
}

</style>

<link href="/f5/resources/css/head_nav.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
		<div class="head-nav-container">
			<label class="head-nav-title">News</label>
			<div class="head-nav-inner">
				<ul class="nav-col-ul">
					<li><a href="board_list.do">자유게시판</a></li>
					<li><a href="promote_list.do">홍보</a></li>
					<li><a href="news_list.do">뉴스</a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</div>
		</div>
		<div class="container">
			<table>
				<tr class="news_table">
					<th>뉴스</th>
				</tr>
				
				<thead>
				<tbody>
					<c:forEach var="list" items="${list }">
						<tr>
							<td><a class="press" href="${list.pressURL }"><img src="${list.img }">${list.press }</a></td>
						</tr>
						<tr>						
							<td rowspan="2"><a class="main_img" href="${list.contentURL }"><img src="${list.contentImg }"></a></td>
							<td colspan="2"><a class="title" href="${list.contentURL }">${list.title }</a></td>
						
						</tr>
						<tr>
							<td></td>
							<td><a class="content" href="${list.contentURL }">${list.content }</a></td>
						</tr>


						
					</c:forEach>
				</tbody>
				
			</table>
		</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>

</html>