<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>

<link href="/f5/resources/css/board/board.css" rel="stylesheet" />
<link href="/f5/resources/css/head_nav.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<!-- <script src="/f5/resources/js/board/board.js"></script> -->

<script>

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
		
		
		// 댓글입력
		$("#reply_insert_btn").click(function() {
			
			if( sessionId == "Guest" ) {
				var result = confirm("로그인 후 이용가능합니다. 로그인하시겠습니까?");
				if( result ) {
					location.href = "login.do";
				} else {
					return;
				}
			} else {
				var reply = $(".reply-content").val();
				
				if(reply == "") {
					alert("댓글을 입력해주세요");
					$(".reply-content").focus();
				} else {
					var result = confirm("댓글을 입력하시겠습니까?");
					if(result) {
						reply_form.submit();
					}
				}
			}
		});

		
		// 댓글 수정 div
		$(".reply_update_btn").click(function() {
			
			var replyIdx = ($(this).attr("id"));
			var replyContent = $(("#comment_area_")+replyIdx).val();

			if($("#reply_update_form_"+replyIdx).css("display") == "none") {
				$("#reply_update_form_"+replyIdx).css("display","block");
				
			} else {

				$("#reply_update_form_"+replyIdx).css("display","none");
			}
			
		});
		
		// 댓글수정처리
		$(".comment_update_btn").click(function(){
			var replyIdx = ($(this).attr("id"));
			var replyContent = $(("#comment_area_")+replyIdx).val();
			
			if(replyContent == "") {
				alert("댓글을 입력해주세요.");
				$(("#comment_area_")+replyIdx).focus();
				return;
			}
			else {
				var reply_update = confirm("정말로 수정하시겠습니까?");
				if(reply_update) {
					$.ajax({
						url : "reply_update.do",
						type : "POST",
						data : {
							"replyIdx" : replyIdx,
							"replyContent" : replyContent
						},
						success : function(data) {
							$(("#reply-content-div-")+replyIdx).text(replyContent);
							$("#reply_update_form_"+replyIdx).css("display","none");
						}
					});
				}
				return;
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
							$("#reco_"+boardIdx).children().first().attr("src","/f5/resources/images/thumbs-up.png");
							$("#reco_"+boardIdx).val('0');
							brecoVal -= 1;
							$("#board_reco_"+boardIdx).text(brecoVal);
						} else {
							brecoVal += 1;
							if( $("#reco_"+boardIdx).val() == '0' && $("#deco_"+boardIdx).val() =='2' ) {							
								bdecoVal -= 1;							
							}
							$("#reco_"+boardIdx).children().first().attr("src","/f5/resources/images/thumbs-up-click.png");
							$("#deco_"+boardIdx).children().first().attr("src","/f5/resources/images/thumbs-down.png");
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
							$("#deco_"+boardIdx).children().first().attr("src","/f5/resources/images/thumbs-down.png");
							$("#deco_"+boardIdx).val('1');
							bdecoVal -= 1;
							$("#board_deco_"+boardIdx).text(bdecoVal);
						} else {
							if( $("#reco_"+boardIdx).val() == '2' && $("#deco_"+boardIdx).val() =='1' ) {
								brecoVal -= 1;
							}
							bdecoVal += 1;
							$("#deco_"+boardIdx).children().first().attr("src","/f5/resources/images/thumbs-down-click.png");
							$("#reco_"+boardIdx).children().first().attr("src","/f5/resources/images/thumbs-up.png");
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
							$("#re_reco_"+replyIdx).children().first().attr("src","/f5/resources/images/thumbs-up.png");
							$("#re_reco_"+replyIdx).val('0');
							recoVal -= 1;
							$("#reply_reco_"+replyIdx).text(recoVal);
							
							
						} else {
							recoVal += 1;
							if( $("#re_reco_"+replyIdx).val() == '0' && $("#de_reco_"+replyIdx).val() =='2' ) {							
								decoVal -= 1;							
							}
							$("#re_reco_"+replyIdx).children().first().attr("src","/f5/resources/images/thumbs-up-click.png");
							$("#de_reco_"+replyIdx).children().first().attr("src","/f5/resources/images/thumbs-down.png");
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
							$("#de_reco_"+replyIdx).children().first().attr("src","/f5/resources/images/thumbs-down.png");
							$("#de_reco_"+replyIdx).val('1');
							decoVal -= 1;
							$("#reply_deco_"+replyIdx).text(decoVal);
							
						} else {
							if( $("#re_reco_"+replyIdx).val() == '2' && $("#de_reco_"+replyIdx).val() =='1' ) {
								recoVal -= 1;
							}
							decoVal += 1;
							$("#de_reco_"+replyIdx).children().first().attr("src","/f5/resources/images/thumbs-down-click.png");
							$("#re_reco_"+replyIdx).children().first().attr("src","/f5/resources/images/thumbs-up.png");
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
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="head-nav-container">
		<label class="head-nav-title">Free Board</label>
		<div class="head-nav-inner">
			<ul class="nav-col-ul">
				<li><a href="board_list.do">자유게시판</a></li>
				<li><a href="promote_list.do">홍보</a></li>
				<li><a href="news_list.do">뉴스</a></li>
				<li><a href="#"></a></li>
				<li><a href="#"></a></li>
			</ul>
		</div>

	</div>
	<!-- Page content-->
	<div class="container">
		<div class="row">

			<div class="board-container">
				<label class="board-caption">Foodly의 대나무 숲</label>
				<div class="board-content-container">

					<div class="board-info">
						<form name="delete_form" action="board_delete.do" method="post" style="display: none">
							<a href="board_update.do?boardIdx=${vo.boardIdx}" class="board_update_link">수정하기</a> 
								<input type="hidden" name="boardIdx" value="${vo.boardIdx}">
							<button id="content_delete" type="button" class="content-delete">삭제하기</button>
						</form>
						<div class="content-title-div">
							<h2 class="content-title">${vo.boardTitle}</h2>
						</div>
						<dl>
							<dt>작성자:</dt>
							<dd>${vo.memberId}</dd>
						</dl>
						<dl>
							<dt>카테고리:</dt>
							<dd>${vo.boardCategory}</dd>
						</dl>
						<dl>
							<dt>작성날짜:</dt>
							<dd>${vo.boardDate}</dd>
						</dl>
						<dl>
						<c:choose>
							<c:when test="${brvo.boardRecommendCheck eq '0'}">
								<button class="recommend_btn" id="reco_${vo.boardIdx }" value='2'>
									<img class="btn-img" src="/f5/resources/images/thumbs-up-click.png">
								</button>
							</c:when>
							<c:otherwise>
								<button class="recommend_btn" id="reco_${vo.boardIdx }" value='0'>
									<img class="btn-img" src="/f5/resources/images/thumbs-up.png">
								</button>
							</c:otherwise>
						</c:choose>
							<dd id="board_reco_${vo.boardIdx }">${reco }</dd>
						</dl>
						<dl>
						<c:choose>
							<c:when test="${brvo.boardRecommendCheck eq '1'}">
								<button class="derecommend_btn" id="deco_${vo.boardIdx }" value='2'>
									<img class="btn-img" src="/f5/resources/images/thumbs-down-click.png">
								</button>
							</c:when>
							<c:otherwise>
								<button class="derecommend_btn" id="deco_${vo.boardIdx }" value='1'>
									<img class="btn-img" src="/f5/resources/images/thumbs-down.png">
								</button>
							</c:otherwise>
						</c:choose>
							<dd id="board_deco_${vo.boardIdx }">${deco }</dd>
						</dl>
					</div>
					<div class="board-content-article">
						<div class="board-content">
							<c:if test="${vo.bFile1 != null}">
							<img alt="" src="/f5/resources/upload/${vo.bsFile1 }"><br><br>
							</c:if>
							<c:if test="${vo.bFile2 != null}">
							<img alt="" src="/f5/resources/upload/${vo.bsFile2 }"><br><br>
							</c:if>
							<c:if test="${vo.bFile3 != null}">
							<img alt="" src="/f5/resources/upload/${vo.bsFile3 }"><br><br>
							</c:if>
							<c:if test="${vo.bFile4 != null}">
							<img alt="" src="/f5/resources/upload/${vo.bsFile4 }"><br><br>
							</c:if>
							<c:if test="${vo.bFile5 != null}">
							<img alt="" src="/f5/resources/upload/${vo.bsFile5 }"><br><br>
							</c:if>
							<p>${vo.boardContent}</p>
						</div>
						<div class="reply-write-area">
						
							<form name="reply_form" action="reply_write.do" method="post">
								<input type="hidden" name="memberId" value="${memberId }">
								<input type="hidden" name="boardIdx" value="${vo.boardIdx}">
								<div class="comment_info">
									<label>등록</label>
									<button type="button" class="comment_enter" id="reply_insert_btn">등록</button>
									<textarea rows="3" id="comment_area" class="reply-content" name="replyContent"></textarea>
								</div>
							</form>
						</div>
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
													<button type="button" class="reply_update_btn" id="${list.replyIdx }">수정</button>
													<button type="button" class="reply_delete_btn" id="${list.replyIdx }">삭제</button>
												</div>
											</c:when>
											<c:otherwise>
												<div style="display: none">
													<button type="button" class="reply_update_btn" id="${list.replyIdx }">수정</button>
													<button type="button" class="reply_delete_btn" id="${list.replyIdx }">삭제</button>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="reply-content-div" id="reply-content-div-${list.replyIdx }">${list.replyContent }</div>
									<!-- 댓글 수정폼 -->
									<div class="reply_update_form" id="reply_update_form_${list.replyIdx }">
										<div class="comment_info">
											<button type="button" class="comment_enter comment_update_btn" id="${list.replyIdx }">수정</button>
											<textarea rows="3" id="comment_area_${list.replyIdx }" class="reply-content" name="replyContent"></textarea>
										</div>
									</div>
									<div class="reply-etc">

										<dl>
											<dt>
											<c:choose>
												<c:when test="${list.replyRecommendCheck eq '0'}">
													<button class="re_recommend_btn" id="re_reco_${list.replyIdx }" value='2'>
														<img class="btn-img" src="/f5/resources/images/thumbs-up-click.png">
													</button>
												</c:when>
												<c:otherwise>
													<button class="re_recommend_btn" id="re_reco_${list.replyIdx }" value='0'>
														<img class="btn-img" src="/f5/resources/images/thumbs-up.png">
													</button>
												</c:otherwise>
											</c:choose>
											</dt>
											<dt class="reply_reco" id="reply_reco_${list.replyIdx }">${list.recoCount }</dt>
										</dl>
										<dl>
											<dt>
												<c:choose>
												<c:when test="${list.replyRecommendCheck eq '1'}">
													<button class="re_derecommend_btn" id="de_reco_${list.replyIdx }" value='2'>
														<img class="btn-img" src="/f5/resources/images/thumbs-down-click.png">
													</button>
												</c:when>
												<c:otherwise>
													<button class="re_derecommend_btn" id="de_reco_${list.replyIdx }" value='1'>
														<img class="btn-img" src="/f5/resources/images/thumbs-down.png">
													</button>
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


					</div>
					<div class="page-container">
						<button>이전글</button>
						<button>다음글</button>
						<a href="board_list.do">
							<button>목록</button>
						</a>
					</div>
				</div>

			</div>

		</div>

	</div>


	<!-- Footer-->
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<!--          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
	<!-- Core theme JS-->


</body>
</html>