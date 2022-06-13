<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | FAQ등록</title>
<link href="/f5/resources/css/admin/faq/faq_write.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function register(){
	
	var comment = $(".faq_answer").val();
	console.log(comment);
	if ( $(".faq_title").val() == "" ) {
		
		alert("제목을 입력해주세요.");
		$(".faq_title").focus();
	} else if ( $(".faq_answer").val() == "" ) {
		
		alert("답변 내용을 입력해주세요.");
		$(".faq_answer").focus();
	} else {
		
		if ( confirm("등록하시겠습니까?") ) {
			comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br>');
			faqWrite.submit();
		} else {
			
			return;
		}
	}
}

function list() {
	
	if ( confirm("작성하신 내용은 저장되지 않습니다. 이 페이지를 나가시겠습니까?") ) {
		
		location.href = "faq_list.do";
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
				<h4>FAQ관리 | 등록</h4>
				<form action="faq_write.do" name="faqWrite" method="post">
				<table class="faq_table">
					<tr>
						<td><label>제목</label></td>
					</tr>
					<tr>
						<td>
							<input type="text" class="faq_title" name="faqTitle"
							 placeholder="  제목을 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  제목을 입력해주세요.'">
						</td>
					</tr>
					<tr>
						<td><label>답변</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" class="faq_answer" name="faqContent"
						 placeholder="  내용을 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  내용을 입력해주세요.'"></textarea>
					</tr>
				</table>
				<div class="faq_btn">
					<button class="faq_register" onclick="register()">등록</button>
					<button class="faq_list" onclick="list()">목록</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>