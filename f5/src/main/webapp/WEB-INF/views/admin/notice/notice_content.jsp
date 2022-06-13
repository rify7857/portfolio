<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 공지사항 상세페이지</title>
<link href="/f5/resources/css/admin/notice/notice_content.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function del() {
	
	if ( confirm("공시글을 삭제하시겠습니까?") ) {
		
		alert("삭제되었습니다.");
		location.href="notice_list.do";
	} else {
		
		return;
	}
}

function list() {
	location.href="notice_list.do";
}

$(document).ready(function() {
	
	var memberId = "${vo.memberId}";
	var sessionId = "${memberId}";
	
	// 수정/삭제 링크
	if( memberId != sessionId ) {
		$("form[name='delete_form']").remove();
	} else {
		$("form[name='delete_form']").css("display","block");
	}
	
	// 게시판 삭제
	$("#content_delete").click(function(){
		var result = confirm("정말로 삭제하시겠습니까?");
		if(result) {
			delete_form.submit();
		} 
		
	});
	
	// 댓글 삭제 버튼
	$(".reply_delete_btn").click(function() {
		
		var boardIdx = "${vo.boardIdx}";
		var replyIdx = ($(this).attr("id"));
		var htmls = "";
		var reply_delete = confirm("정말로 삭제하시겠습니까?");
		
		if(reply_delete) {
			$.ajax({
				url : "reply_delete.do?boardIdx="+boardIdx+
						"&replyIdx="+replyIdx,
				success : function(data) {
					$("#reply-area-"+replyIdx).remove();
				}
				
			});
		} 
	});
	
	// 게시글 추천 비추천 버튼
	var brecoVal;
	var bdecoVal;
	
	$(".recommend_btn").click(function() {
		
		if( sessionId == "Guest" ) {
			var result = confirm("로그인 후 이용가능합니다. 로그인하시겠습니까?");
			if( result ) {
				location.href = "login.do";
			} else {
				return;
			}
		} else {
		
			var boardIdx = ($(this).attr("id").substr(5,));
			var reco = ($(this).val());
			var brecoVal = parseInt($("#board_reco_"+boardIdx).text());
			var bdecoVal = parseInt($("#board_deco_"+boardIdx).text());
			
			$.ajax({
				url : "board_recommend.do",
				type : "POST",
				data : {
					"boardIdx" : boardIdx,
					"boardRecommendCheck" : reco,
					"memberId" : "${sessionScope.memberId}"
				},
				success : function(data) {
					if($("#reco_"+boardIdx).val() == '2') {
						$("#reco_"+boardIdx).css("background-color","white");
						$("#reco_"+boardIdx).val('0');
						brecoVal -= 1;
						$("#board_reco_"+boardIdx).text(brecoVal);
					} else {
						brecoVal += 1;
						if( $("#reco_"+boardIdx).val() == '0' && $("#deco_"+boardIdx).val() =='2' ) {							
							bdecoVal -= 1;							
						}
						$("#reco_"+boardIdx).css("background-color","red");
						$("#deco_"+boardIdx).css("background-color","white");
						$("#deco_"+boardIdx).val('1');
						$("#reco_"+boardIdx).val('2');
						$("#board_reco_"+boardIdx).text(brecoVal);
						$("#board_deco_"+boardIdx).text(bdecoVal);
					}
				},
				error : function(data) {
					
				}
			});
		}
	});
	
	$(".derecommend_btn").click(function() {
		
		if ( sessionId == "Guest" ) {
			var result = confirm("로그인 후 이용가능합니다. 로그인하시겠습니까?");
			if( result ) {
				location.href = "login.do";
			} else {
				return;
			}
		} else {
		
			var boardIdx = ($(this).attr("id")).substr(5,);
			var reco = ($(this).val());
			
			var brecoVal = parseInt($("#board_reco_"+boardIdx).text());
			var bdecoVal = parseInt($("#board_deco_"+boardIdx).text());
			
			$.ajax({
				url : "board_recommend.do",
				type : "POST",
				data : {
					"boardIdx" : boardIdx,
					"boardRecommendCheck" : reco,
					"memberId" : "${sessionScope.memberId}"
				},
				success : function(data) {
					if($("#deco_"+boardIdx).val() =='2') {
						$("#deco_"+boardIdx).css("background-color","white");
						$("#deco_"+boardIdx).val('1');
						bdecoVal -= 1;
						$("#board_deco_"+boardIdx).text(bdecoVal);
					} else {
						if( $("#reco_"+boardIdx).val() == '2' && $("#deco_"+boardIdx).val() =='1' ) {
							brecoVal -= 1;
						}
						bdecoVal += 1;
						$("#deco_"+boardIdx).css("background-color","red");
						$("#reco_"+boardIdx).css("background-color","white");
						$("#reco_"+boardIdx).val('0');
						$("#deco_"+boardIdx).val('2');
						$("#board_reco_"+boardIdx).text(brecoVal);
						$("#board_deco_"+boardIdx).text(bdecoVal);
					}
				},
				error : function(data) {
					
				}
			});
		}
	});
	
	
	
	// 댓글 추천 비추천 버튼
	
	var recoVal;
	var decoVal;
	
	$(".re_recommend_btn").click(function() {
		
		if( sessionId == "Guest" ) {
			var result = confirm("로그인 후 이용가능합니다. 로그인하시겠습니까?");
			if( result ) {
				location.href = "login.do";
			} else {
				return;
			}
		} else {
			
			var replyIdx = ($(this).attr("id")).substr(8,);
			var reco = ($(this).val());
			var recoVal = parseInt($("#reply_reco_"+replyIdx).text());
			var decoVal = parseInt($("#reply_deco_"+replyIdx).text());
			
			
			$.ajax({
				url : "reply_recommend.do",
				type : "POST",
				data : {
					"replyIdx" : replyIdx,
					"replyRecommendCheck" : reco,
					"memberId" : "${sessionScope.memberId}"
				},
				success : function(data) {
					
					if($("#re_reco_"+replyIdx).val() == '2') {
						$("#re_reco_"+replyIdx).css("background-color","white");
						$("#re_reco_"+replyIdx).val('0');
						recoVal -= 1;
						$("#reply_reco_"+replyIdx).text(recoVal);
						
						
					} else {
						recoVal += 1;
						if( $("#re_reco_"+replyIdx).val() == '0' && $("#de_reco_"+replyIdx).val() =='2' ) {							
							decoVal -= 1;							
						}
						$("#re_reco_"+replyIdx).css("background-color","red");
						$("#de_reco_"+replyIdx).css("background-color","white");
						$("#de_reco_"+replyIdx).val('1');
						$("#re_reco_"+replyIdx).val('2');
						$("#reply_reco_"+replyIdx).text(recoVal);
						$("#reply_deco_"+replyIdx).text(decoVal);
					}
				},
				error : function(data) {
					
				}
			});
		}
	});
	
	$(".re_derecommend_btn").click(function() {
		
		if( sessionId == "Guest" ) {
			var result = confirm("로그인 후 이용가능합니다. 로그인하시겠습니까?");
			if( result ) {
				location.href = "login.do";
			} else {
				return;
			}
		} else {
			
			var replyIdx = ($(this).attr("id")).substr(8,);
			var reco = ($(this).val());
			
			var recoVal = parseInt($("#reply_reco_"+replyIdx).text());
			var decoVal = parseInt($("#reply_deco_"+replyIdx).text());
		
			$.ajax({
				url : "reply_recommend.do",
				type : "POST",
				data : {
					"replyIdx" : replyIdx,
					"replyRecommendCheck" : reco,
					"memberId" : "${sessionScope.memberId}"
				},
				success : function(data) {
					if($("#de_reco_"+replyIdx).val() =='2') {
						$("#de_reco_"+replyIdx).css("background-color","white");
						$("#de_reco_"+replyIdx).val('1');
						decoVal -= 1;
						$("#reply_deco_"+replyIdx).text(decoVal);
						
					} else {
						if( $("#re_reco_"+replyIdx).val() == '2' && $("#de_reco_"+replyIdx).val() =='1' ) {
							recoVal -= 1;
						}
						decoVal += 1;
						$("#de_reco_"+replyIdx).css("background-color","red");
						$("#re_reco_"+replyIdx).css("background-color","white");
						$("#re_reco_"+replyIdx).val('0');
						$("#de_reco_"+replyIdx).val('2');
						$("#reply_reco_"+replyIdx).text(recoVal);
						$("#reply_deco_"+replyIdx).text(decoVal);
					}
				},
				error : function(data) {
					
				}
			});
		}
		
	});
});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
		<div class="row">
			<div id="content">
				<h4>공지사항 관리 | 공지사항 상세페이지</h4>
				<table class="notice_table">
					<tr>
						<td><label>제목</label></td>
					</tr>
					<tr>
						<td><input type="text" id="notice_title" value="${ vo.boardTitle }" readonly="readonly"></td>
					</tr>
					<tr>
						<td><label>게시자</label></td>
					</tr>
					<tr>
						<td><input type="text" id="writer" value="${ vo.memberId }" readonly="readonly"></td>
					</tr>
					<tr>
						<td><label>내용</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="notice_content" readonly="readonly">${ vo.boardContent }</textarea></td>
					</tr>
				</table>
				
				<div class="board-reply-container">
							<div class="board-reply-head">

								<dl>
									<dt style="margin: 5px;">댓글</dt>
									<dt>
										<select>
											<option value="등록순">등록순
											<option value="추천순">추천순
										</select>
									</dt>
								</dl>
							</div>
							
							<!-- 댓글리스트 -->
							<c:forEach var="list" items="${rlist}">
							<div class="reply-area" id="reply-area-${list.replyIdx }">
								<input type="hidden" name="boardIdx" value="${vo.boardIdx }">
									<div class="reply-member">
										<a>${list.memberId }</a>
										<c:choose>
											<c:when test="${sessionScope.memberId eq list.memberId }">											
												<div>
													<button type="button" class="reply_delete_btn" id="${list.replyIdx }">삭제</button>
												</div>
											</c:when>
											<c:otherwise>
												<div style="display: none">
													<button type="button" class="reply_delete_btn" id="${list.replyIdx }">삭제</button>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="reply-content-div" id="reply-content-div-${list.replyIdx }">${list.replyContent }</div>
									<div class="reply-etc">

										<dl>
											<dt>
											<c:choose>
												<c:when test="${list.replyRecommendCheck eq '0'}">
													<button style="background-color: red" class="re_recommend_btn" id="re_reco_${list.replyIdx }" value='2'>추천</button>
												</c:when>
												<c:otherwise>
													<button style="background-color: white" class="re_recommend_btn" id="re_reco_${list.replyIdx }" value='0'>추천</button>
												</c:otherwise>
											</c:choose>
											</dt>
											<dt class="reply_reco" id="reply_reco_${list.replyIdx }">${list.recoCount }</dt>
										</dl>
										<dl>
											<dt>
												<c:choose>
												<c:when test="${list.replyRecommendCheck eq '1'}">
													<button style="background-color: red" class="re_derecommend_btn" id="de_reco_${list.replyIdx }" value='2'>비추천</button>
												</c:when>
												<c:otherwise>
													<button style="background-color: white" class="re_derecommend_btn" id="de_reco_${list.replyIdx }" value='1'>비추천</button>
												</c:otherwise>
											</c:choose>
											</dt>
											<dt class="reply_deco" id="reply_deco_${list.replyIdx }">${list.derecoCount }</dt>
										</dl>
										<dl>
											<dt>${list.replyDate }</dt>
										</dl>
									</div>
								</div>
								<div>
								
							</div>
							</c:forEach>
							
						</div>
				
				<div class="notice_btn">
					<a href="notice_update.do?idx=${ vo.boardIdx }&rno=${ rno }"><button class="notice_update">수정하기</button></a>
					<a href="notice_delete.do?idx=${ vo.boardIdx }"><button class="notice_delete">삭제하기</button></a>
					<button class="notice_list" onclick="list()">목록</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>