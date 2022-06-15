<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<span class="profile-h"><h2> ${sessionScope.memberId } 님, 환영합니다!</h2></span>
				<hr>
        
       <!-- comment -->
       <div>
	       	<div class="com_container">
	       		<H2>나의 문의현황</H2>
	       		<div class="com_btn">
	       	
	       		</div>
	       		<table>
	       			<tr>
	       				<th>번호</th>
	       				<th>제목</th>
	       				<th>답변여부</th>
	       			</tr>
	       			<tr>
	       				<c:forEach var="vo" items="${result.list }">
	       					<td>${ vo.rno }</td>
	       					<td><a href="question_content.do?idx=${ vo.questionIdx }">${ vo.questionTitle }</a></td>
	       					<td>
								<c:if test="${ vo.questionProceed eq '0' }">대기중</c:if>
								<c:if test="${ vo.questionProceed eq '1' }">답변중</c:if>
								<c:if test="${ vo.questionProceed eq '2' }">답변완료</c:if>
							</td>
	       				</c:forEach>
	       			</tr>
	       			
	       		</table><br>
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
       </div>
        
        <!-- Footer-->
	<jsp:include page="../../footer.jsp"></jsp:include>
    </body>
</html>
