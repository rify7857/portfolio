<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly | 문의작성</title>
<link href="/f5/resources/css/service/question_write.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/f5/resources/js/admin/question/question.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
		<div class="row">
			<div id="content">
				<h4>문의관리 | 문의작성</h4>
				<form action="question_write.do" name="questionWrite" method="post" class="questionWrite">
				<table id="question_table">
					<tr>
						<td><label>제목</label></td>
					</tr>
					<tr>
						<td><input type="text" id="question_title" name="questionTitle"></td>
					</tr>
					<tr>
						<td><label>내용</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="question_content" name="questionContent"></textarea></td>
					</tr>
				</table>
				<div class="question_btn">
					<button type="submit" class="question_receive">보내기</button>
					<button class="question_list" onclick="list()">목록</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>