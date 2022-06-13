<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>

<link href="/f5/resources/css/board/promote.css" rel="stylesheet" />
<link href="/f5/resources/css/head_nav.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>

<script>

	$(document).ready(function() {

		
		$(".btn-promote-write").click(function() {
			
			$.ajax({
				
				url : "ceo_check.do",
				success : function(result) {
					
					if( result == "0" ) {
						alert("ceo회원만 이용할 수 있습니다.");
						return;
					} else {
						location.href = "promote_write.do";
					}
					
				}
				
			});
			
			
		});
		
	});

</script>

</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div class="head-nav-container">
		<label class="head-nav-title">Promote</label>
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
            
            	<div class="board_container">
            	<label class="board-caption">Foodly의 자랑거리</label>
				<div class="promote-top" style="text-align: right; margin-bottom: 50px;">
					<button class="cusbtn btn-promote-write" type="button">글쓰기</button>
				</div>
				<div class="promote-list-container">
					<ul>
						<c:forEach var="vo" items="${list}">
							<li>
								<div class="promote-list">
									<div class="promote-top-inner">
										<div class="centered">
											<img class="promote-img" src="/f5/resources/upload/${vo.bsFile1 }">
										</div>
										<p>${vo.boardTitle }</p>
									</div>
									<div class="promote-bottom">
										<p>${vo.boardContent }</p>
									</div>
									<div class="promote-link">
									<c:choose>
										<c:when test="${sessionScope.memberId eq vo.memberId }">										
											<a href="promote_update.do?boardIdx=${vo.boardIdx }">수정하기</a>
										</c:when>
									</c:choose>
										<a></a>
										<a href="store.do"> 놀러가기 </a>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<br>
				
			<!-- Pagination-->
			<nav style="text-align: center">
				<hr class="my-0" />
				<br><br>
				<div>
				<select name="search_type" id="search_type">
					<option value="t"
						<c:if test="${ search_type eq 't' }">selected</c:if>>제목</option>
					<option value="c"
						<c:if test="${ search_type eq 'c' }">selected</c:if>>내용</option>
					<option value="tc"
						<c:if test="${ search_type eq 'tc' }">selected</c:if>>제목/내용</option>
					<option value="n"
						<c:if test="${ search_type eq 'n' }">selected</c:if>>작성자</option>
				</select>
				<c:choose>
					<c:when test="${ boardCategory eq '3' }">
					<input type="text" id="searchbar"
					placeholder="  검색어를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  검색어를 입력해주세요.'">
					<button type="button" class="search_btn cusbtn2" onclick="search()">검색</button>
					</c:when>
					<c:otherwise>
					<input type="text" id="searchbar" value="${ search }"
					placeholder="  검색어를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  검색어를 입력해주세요.'">
					<button type="button" class="search_btn cusbtn2" onclick="search()">검색</button>
					</c:otherwise>
				</c:choose>
   				</div>
				<div id="ampaginationsm"></div>
			</nav>
				<br>
			</div>
        </div>
    </div>
        <!-- Footer-->
	<jsp:include page="../../footer.jsp"></jsp:include><br>
        <!-- Bootstrap core JS-->
<!--          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
        <!-- Core theme JS-->

</body>
<link href="/f5/resources/css/am-pagination.css" rel="stylesheet" />
<script src="http://localhost:9000/f5/resources/js/am-pagination.js"></script>
<script>
function search() {
	
	var search = $("#searchbar").val(); 
	var search_type = $("#search_type").val();
	var boardCategory = "1";
	
	if ( search == "" ) {
		
		alert("검색어를 입력해주세요.");
	} else {
		
		location.href="/f5/promote_list.do?search="+search+"&search_type="+search_type+"&boardCategory="+boardCategory;
	}
}
$(document).ready(function() {
		
		var memberId = "${sessionScope.memberId}";
		if( memberId == "") {
			memberId = "none";
		}
		
	
		var pager = $('#ampaginationsm').pagination({

			maxSize : 5, // max page size
			totals : '${ dbCount }', // total pages	
			page : '${ reqPage }', // initial page		
			pageSize : '${ pageSize }', // max number items per page
			
			search : '${search}',
			search_type : '${search_type}',
			boardCategory : "1",
			
			// custom labels		
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',

			btnSize : 'sm' // 'sm'  or 'lg'		
		});

		jQuery('#ampaginationsm').on('am.pagination.change', function(e) {
			
			var boardCategory = "1";
			var search = "${search}";
			var search_type = "${search_type}";
			
			jQuery('.showlabelsm').text('The selected page no: ' + e.page);
			
			var uurl;
			
			if( search == "" ) {
				uurl = "promote_rlist.do?rpage="+ e.page+"&boardCategory="+boardCategory;
			} else {
				uurl = "promote_rlist.do?rpage="+ e.page+"&boardCategory="+boardCategory+"&search="+search+"&search_type="+search_type;
			}
			$.ajax({
				url : uurl,
				//location.href="/f5/board_list.do?rpage="+ e.page+"&boardCategory="+boardCategory;
				success : function(result) {
					var jdata = JSON.parse(result);
					var ul = "";
					$(".promote-list-container").remove();
					
					ul += "<div class='promote-list-container'>";
					ul += "<ul>";
					
					for(var i in jdata.jlist) {
						ul += "<li>";
						ul += "<div class='promote-list'>";
						ul += 	"<div class='promote-top'>";
						ul += 		"<div class='centered'>";
						ul += 			"<img class='promote-img' src='/f5/resources/upload/" + jdata.jlist[i].bsFile1 + "'>";
						
						ul += 		"</div>";
						ul += 		"<p>"+jdata.jlist[i].boardTitle+"</p>";
						ul += 	"</div>";
						ul += 	"<div class='promote-bottom'>";
						ul += 		"<p>"+jdata.jlist[i].boardContent+"</p>";
						ul += 	"</div>";
						ul += 		"<div class='promote-link'>";
						if ( jdata.jlist[i].memberId == memberId ) {
						ul += 			"<a href='promote_update.do?boardIdx="+jdata.jlist[i].boardIdx+"'>수정하기</a>";
						}
						ul += 			"<a></a><a href='store.do'> 놀러가기 </a>";
						ul += 		"</div>";
						ul += "</div>";
						ul += "</li>";
						
					}
					
					
					$(".promote-top").after(ul);
					
				}
				
			});

		});
			
		
	});
	
</script>
</html>