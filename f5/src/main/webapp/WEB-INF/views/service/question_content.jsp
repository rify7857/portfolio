<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 상세페이지</title>
<link href="/f5/resources/css/admin/question/question_receive.css" rel="stylesheet" />
<link href="/f5/resources/css/member/common.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript" src="/f5/resources/js/admin/question/question.js"></script> -->
<script type="text/javascript">
function list() {
	
	location.href="mypage.do";
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<jsp:include page="../member/mypage/mypageNav.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div id="content">
				<h4>문의 상세페이지</h4>
				<input type="hidden" name="memberEmail" value="${ vo.memberEmail }">
				<input type="hidden" name="questionIdx" value="${ vo.questionIdx }">
				<table id="question_table">
					<tr>
						<td><label>제목</label></td>
					</tr>
					<tr>
						<td><input type="text" id="question_title" name="questionTitle" value="${ vo.questionTitle }" readonly="readonly"></td>
					</tr>
					<tr>
						<td><label>받는사람</label></td>
					</tr>
					<tr>
						<td><input type="text" id="receiver" name="memberId" value="${ vo.memberId }" readonly="readonly"></td>
					</tr>
					<tr>
						<td><label>내용</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="question_content" name="questionContent" readonly="readonly">${ vo.questionContent }</textarea></td>
					</tr>
					<c:if test="${ vo.questionAnswer != null }">
					<tr>
						<td><label>답변</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="question_answer" name="questionAnswer">${ vo.questionAnswer }</textarea></td>
					</tr>
					</c:if>
				</table>
				<div class="question_btn">
					<button type="button" class="question_list" onclick="list()">목록</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>