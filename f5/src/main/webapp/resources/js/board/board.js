

//@ returns
$(document).ready(function() {
	
	
	
	// 댓글입력
	$("#reply-insert-btn").click(function() {
		var reply = $(".reply-content").val();

		if(reply == "") {
			alert("댓글을 입력해주세요");
			$(".reply-content").focus();
		} else {
			alert(reply);
		}
		
	});
	
	$("#reply-re-btn").click(function() {
		if($("#reply-re-write-area").css("display") == "none") {
			$("#reply-re-write-area").css("display","block");
		} else {
			$("#reply-re-write-area").css("display","none");
		}
		
	});
	
	
	// 댓글 수정 삭제 버튼
	var reco = 0;
	var deco = 0;
	
	$("#reply_update_btn").click(function() {
		confirm("정말로 수정하시겠습니까?");
	});
	
	$("#reply_delete_btn").click(function() {
		confirm("정말로 삭제하시겠습니까?");
	});
	
	
	// 댓글 추천 비추천 버튼
	$("#reply_recommend_btn").click(function() {
		reco += 1;
		$("#reply_reco").text(reco);
	});
	
	$("#reply_derecommend_btn").click(function() {
		deco += 1;
		$("#reply_deco").text(deco);
	});
	
	
});
 
 