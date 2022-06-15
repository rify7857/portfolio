<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 공지사항 수정</title>
<link href="/f5/resources/css/admin/notice/notice_update.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function update() {
	
	if ( $("#notice_title").val() == "" ) {
		
		alert("제목을 입력해주세요.");
		$("#notice_title").focus();
	} else if ( $("#notice_content").val() == "" ) {
		
		alert("내용을 입력해주세요.");
		$("#notice_content").focus();
	} else {
		
		if ( confirm("공지글을 수정하시겠습니까?") ) {
			
			noticeUpdate.submit();
		} else {
			
			return;
		}
	}
}

function list() {
	
	if ( confirm("작성하신 내용은 저장되지 않습니다. 이 페이지를 나가시겠습니까?") ) {
		
		location.href="notice_list.do";
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
				<h4>공지사항 관리 | 공지사항 수정페이지</h4>
				<form action="notice_update.do" method="post" name="noticeUpdate">
				<input type="hidden" value="${ vo.boardIdx }" name="boardIdx">
				<input type="hidden" value="${ vo.memberId }" name="memberId">
				<input type="hidden" value="${ vo.boardCategory }" name="boardCategory">
				<table class="notice_table">
					<tr>
						<td><label>제목</label></td>
					</tr>
					<tr>
						<td><input type="text" id="notice_title" name="boardTitle" value="${ vo.boardTitle }"></td>
					</tr>
					<tr>
						<td><label>내용</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="notice_content" name="boardContent">${ vo.boardContent }</textarea></td>
					</tr>
				</table>
				</form>
				<div class="notice_btn">
					<button class="notice_update" onclick="update()">수정하기</button>
					<button class="notice_list" onclick="list()">목록</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>