<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 문의상세</title>
<link href="/f5/resources/css/admin/question/question_receive.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript" src="/f5/resources/js/admin/question/question.js"></script> -->
<script type="text/javascript">
function list() {
	
	if ( confirm("입력하신 내용은 저장되지 않습니다. 이 페이지에서 나가시겠습니까?") ) {
		
		location.href="/f5/admin/question_list.do";
	} else {
		
		return;
	}
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
		<div class="row">
			<div id="content">
				<h4>문의관리 | 문의답변</h4>
				<form action="question_receive.do" method="post">
				<input type="hidden" name="memberEmail" value="${ vo.memberEmail }">
				<input type="hidden" name="questionIdx" value="${ vo.questionIdx }">
				<table id="question_table">
					<tr>
						<td><label>제목</label></td>
					</tr>
					<tr>
						<td><input type="text" id="question_title" name="questionTitle" value="${ vo.questionTitle }"></td>
					</tr>
					<tr>
						<td><label>받는사람</label></td>
					</tr>
					<tr>
						<td><input type="text" id="receiver" name="memberId" value="${ vo.memberId }"></td>
					</tr>
					<tr>
						<td><label>내용</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="question_content" name="questionContent" readonly="readonly">${ vo.questionContent }</textarea></td>
					</tr>
					<tr>
						<td><label>답변</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="question_answer" name="questionAnswer"></textarea></td>
					</tr>
				</table>
				<div class="question_btn">
					<button type="submit" class="question_receive">보내기</button>
					<button type="button" class="question_list" onclick="list()">목록</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>