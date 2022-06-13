

// 홍보등록
//@returns
$(document).ready(function() {
	$("#promote_insert_btn").click(function() {
		var title = $("#promote_title").val();
		var content = $("#promote_content").val();
		
		if(title == "") {
			alert("홍보 제목을 입력해주세요");
			$("#promote_title").focus();
			return;
		}
		
		if(content == "") {
			alert("홍보 상세내용을 입력해주세요");
			$("#promote_content").focus();
			return;
		}
	});
});