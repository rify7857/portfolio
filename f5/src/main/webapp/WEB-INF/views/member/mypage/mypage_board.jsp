<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<html lang="en">
<link href="/f5/resources/css/member/mypage/mypage_com.css" rel="stylesheet" />
<link href="/f5/resources/css/member/common.css" rel="stylesheet" />
<link href="/f5/resources/css/main/index.css" rel="stylesheet" />
</head>
    <body>
    	<jsp:include page="../../header.jsp"></jsp:include>
    	<!-- UnderBar -->
    	<jsp:include page="../../member/mypage/mypageNav.jsp"></jsp:include>
    	<!-- UnderBar -->
    	<!-- UnderBar -->
    	 <div class="profile">
					<img class="user-img" src="/f5/resources/images/user.png"><br>
				</div>
				<span class="profile-h"><h2> Username 님, 환영합니다!</h2></span>
				<hr>
        
       <!-- comment -->
       <div>
	       	<div class="com_container">
	       		<H2>나의 게시판현황</H2>
	       		<div class="com_btn">
	       	
	       		</div>
	       		<table>
	       			<tr>
	       				<th>목차</th>
	       				<th>제목</th>
	       				<th>내용</th>
	       				<th>변경사항</th>
	       			</tr>
	       			<tr>
	       				<td>num</td>
	       				<td>title</td>
	       				<td>content</td>
	       				<td><button type="button">변경하기</button></td>
	       			</tr>
	       			
	       		</table><br>
	       				<!-- Search -->
	       		<div class="my-search-bar">
	       			<select>
	       				<option>제목</option>	
	       				<option>내용</option>
	       			</select>
	       			<input class="my-search" type="text" placeholder="제목 또는 내용을 입력해주세요.">
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
       </div>
        
        <!-- Footer-->
	<jsp:include page="../../footer.jsp"></jsp:include>
    </body>
</html>
