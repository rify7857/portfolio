<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>
<link href="/f5/resources/css/admin/store/store_information.css" rel="stylesheet" />
<link rel="stylesheet" href="http://localhost:9000/f5/resources/css/am-pagination.css">
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/f5/resources/js/am-pagination.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	var storeIdx = '${result.storeList.storeIdx}';
	var pager = jQuery('#ampaginationsm').pagination({
			
		    maxSize: 7,	    		// max page size
		    totals: '${ result.dbCount }',	// total pages	
		    page: '${ result.reqPage }',		// initial page		
		    pageSize: '${ result.pageSize }',	// max number items per page
		    
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		
		jQuery('.showlabelsm').text('The selected page no: '+e.page);
		
		$(".reply-area").remove();
		
		$.ajax({
			url : "store_information_paging.do?rpage="+e.page+"&idx="+storeIdx,
			success : function(result){
				
				const data = JSON.parse(result);
				
				for( var i in data.jlist ) {
					
					var str = "<div class='reply-area' id='reply-area-"+data.jlist[i].reviewIdx+"'>";
					str += "<div class='reply-member'>";
					str += "<a href='member_content.do?id="+data.jlist[i].memberId+"'>"+data.jlist[i].memberId+"</a>";
					str += "<div>";
					str += "<button type='button' class='reply_delete_btn' id='"+data.jlist[i].reviewIdx+"'>삭제</button>"
					str += "</div>";
					str += "</div>";
					str += "<div class='reply-content-div' id='reply-content-div-"+data.jlist[i].reviewIdx+"'>"+data.jlist[i].reviewContent+"</div>";
					str += "</div>";
					$(".store-review").append(str);
				}
			}
		});
	});
	
	$(".reply_delete_btn").click(function() {
		
		var storeIdx = "${result.storeList.storeIdx}";
		var reviewIdx = ($(this).attr("id"));
		var htmls = "";
		var review_delete = confirm("정말로 삭제하시겠습니까?");
		
		if(review_delete) {
			
			$.ajax({
				url : "review_delete.do?ridx="+reviewIdx,
				success : function(msg) {
					
					if ( msg == "succ" ) {
						
						$("#reply-area-"+reviewIdx).remove();
					} else {
						console.log("asdfasdfasdf");
					}
				}
			});
		} 
	});
});//documnet ready
</script>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="store-intro">
				<h2>${vo.storeName }</h2>
				<h2 id="average-score"></h2>
				<h2 id="intro">#대박 #서비스 #Instagram</h2>
				<div class="store-intro-box">
					<div class="store-intro-maintext-box">
						<div class="store-intro-text-box">
							<ul>
								<li>${result.storeList.storeName }</li>
								<li>${result.storeList.storePlace }</li>
								<li>${result.storeList.storeTel }</li>
								<li>${result.storeList.storeCategory }</li>
								<li>가격대 : ${result.storeList.storePrice }</li>
								<li>주차 : ${result.storeList.storeParking }</li>
								<li>웹사이트 : ${result.storeList.storeWebSite }</li>
							</ul>
						</div>
					</div>
				</div>
				<h2 class="font-com" id="review">리뷰</h2>
				<h4>Comment</h4>
				<div class="store-review">
					<c:forEach var="vo" items="${result.reviewList}">
						<div class="reply-area" id="reply-area-${ vo.reviewIdx }">
							<div class="reply-member">
								<a href="member_content.do?id=${ vo.memberId }">${ vo.memberId }</a>
								<div>
									<button type="button" class="reply_delete_btn" id="${ vo.reviewIdx }">삭제</button>
								</div>
							</div>
							<div class="reply-content-div" id="reply-content-div-${ vo.reviewIdx }">${ vo.reviewContent }</div>
						</div>
					</c:forEach>
				</div>
				<div class="paging">
						<div id="ampaginationsm"></div>
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>