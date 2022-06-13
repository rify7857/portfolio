function send() {
	
	var title = $("#question_title").val();
	var receiver = $("#receiver").val();
	var content = $("#question_content").val();
	
	if ( title == "" ) {
		
		alert("제목을 입력해주세요.");
		$("#question_title").focus();
	} else if ( receiver == "" ) {
		
		alert("받는사람 정보를 입력해주세요.");
		$("#receiver").focus();
	} else if ( content == "" ) {
		
		alert("답변 내용을 입력해주세요.");
		$("#question_content").focus();
	} else {
		
		if ( confirm("전송하시겠습니까?") ) {
			
			alert("전송되었습니다.");
			location.href="question_list.do";
		} else {
		
			return;
		}
//		submit();
	}
}

function list() {

	if ( confirm("입력하신 내용은 저장되지 않습니다. 이 페이지에서 나가시겠습니까?") ) {
	
		location.href="question_list.do";
	} else {
		
		return;
	}
}