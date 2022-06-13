<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 문의상세</title>
<link href="/f5/resources/css/admin/question/question_content.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function list() {
	location.href="question_list.do";
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
		<div class="row">
			<div id="content">
				<h4>문의관리 | 상세페이지</h4>
				<table class="question_table">
					<tr>
						<td><label>제목</label></td>
					</tr>
					<tr>
						<td><input type="text" id="question_title" value="${ vo.questionTitle }" readonly="readonly"></td>
					</tr>
					<tr>
						<td><label>보낸사람</label></td>
					</tr>
					<tr>
						<td><input type="text" id="sender" value="${ vo.memberId }"></td>
					</tr>
					<tr>
						<td><label>내용</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="question_content">${ vo.questionContent }</textarea></td>
					</tr>
				</table>
				<div class="question_btn">
					<a href="question_receive.do?idx=${ vo.questionIdx }&rno=${ rno }"><button type="button" class="question_receiver">답장하기</button></a>
					<a href="question_delete.do?idx=${ vo.questionIdx }&rno=${ rno }"><button class="question_delete" type="button">삭제하기</button></a>
					<button class="question_list" onclick="list()">목록</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>