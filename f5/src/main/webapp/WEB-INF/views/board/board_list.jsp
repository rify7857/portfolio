<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>

<link href="/f5/resources/css/head_nav.css" rel="stylesheet" />
<link href="/f5/resources/css/board/board.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var memberId = "${sessionScope.memberId}";
		
		$(".btn-board-write").click(function(){
			
			if( memberId == "" ) {
				var result = confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?");
				if(result) {
					location.href = "login.do";
				} else {				
					return;
				}
			} else {
				location.href = "board_write.do";
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
            	<div class="board_container">
            	<label class="board-caption">Foodly의 대나무 숲</label>
            	<div class="table-top-container">
	            	<select name="selectBox">
						<option value="3" <c:if test="${boardCategory eq '3' }">selected</c:if>>전체</option>
						<option value="0" <c:if test="${boardCategory eq '0' }">selected</c:if>>일반</option>
						<option value="1" <c:if test="${boardCategory eq '1' }">selected</c:if>>홍보</option>
						<option value="2" <c:if test="${boardCategory eq '2' }">selected</c:if>>공지</option>
					</select> 
					
					<button class="cusbtn btn-board-write" type="button">글쓰기</button>

				</div>
				<table class="table list-table">
            			<tr class="tr-sec1">
            				<th class="board-table-col1">순번</th>
            				<th class="board-table-col2">제목</th>
            				<th class="board-table-col3">작성자</th>
            				<th class="board-table-col4">조회수</th>
            				<th class="board-table-col5">작성일</th>
            			</tr>
            			
            			<c:forEach var="vo" items="${list}">
            			<tr class="tr-sec">
            				<td class="board-table-col1">${vo.rno}</td>
            				<td class="board-table-col2"><a href="board_content.do?boardIdx=${vo.boardIdx}">
            				<c:if test="${vo.boardCategory eq '일반' }">[일반] ${vo.boardTitle}</c:if>
            				<c:if test="${vo.boardCategory eq '홍보' }">[홍보] ${vo.boardTitle}</c:if>
            				<c:if test="${vo.boardCategory eq '공지' }">[공지] ${vo.boardTitle}</c:if></a></td>            				
            				<td class="board-table-col3">${vo.memberId}</td>
            				<td class="board-table-col4">${vo.boardHits}</td>
            				<td class="board-table-col5">${vo.boardDate}</td>
            			</tr>
            			</c:forEach>
            			
            			<tr>
            				<td colspan=5>
            					<select name="search_type" id="search_type">
									<option value="t" <c:if test="${ search_type eq 't' }">selected</c:if>>제목</option>
									<option value="c" <c:if test="${ search_type eq 'c' }">selected</c:if>>내용</option>
									<option value="tc" <c:if test="${ search_type eq 'tc' }">selected</c:if>>제목/내용</option>
									<option value="n" <c:if test="${ search_type eq 'n' }">selected</c:if>>작성자</option>
								</select>
            					<c:choose>
									<c:when test="${ boardCategory eq '3' }">
									<input type="text" id="searchbar"
									placeholder="  검색어를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  검색어를 입력해주세요.'">
									<button type="button" class="search_btn cusbtn1" onclick="search()">검색</button>
									</c:when>
									<c:otherwise>
									<input type="text" id="searchbar" value="${ search }"
									placeholder="  검색어를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  검색어를 입력해주세요.'">
									<button type="button" class="search_btn cusbtn1" onclick="search()">검색</button>
									</c:otherwise>
								</c:choose>
            				</td>
            			</tr>
            			<tr>
            				<td colspan=5><div id="ampaginationsm"></div></td>
            			<tr>
            		</table>
            	</div>
            </div>
        </div>
        
        <!-- Footer-->
	<jsp:include page="../footer.jsp"></jsp:include>
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
	var boardCategory = $("select[name=selectBox]").val();
	
	if ( search == "" ) {
		
		alert("검색어를 입력해주세요.");
	} else {
		
		location.href="/f5/board_list.do?search="+search+"&search_type="+search_type+"&boardCategory="+boardCategory;
	}
}
$(document).ready(function() {
		
	
		var pager = $('#ampaginationsm').pagination({

			maxSize : 5, // max page size
			totals : '${ dbCount }', // total pages	
			page : '${ reqPage }', // initial page		
			pageSize : '${ pageSize }', // max number items per page
			
			search : '${search}',
			search_type : '${search_type}',
			boardCategory : '${boardCategory}',
			
			// custom labels		
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',

			btnSize : 'sm' // 'sm'  or 'lg'		
		});

		jQuery('#ampaginationsm').on('am.pagination.change', function(e) {
			
			var boardCategory = $("select[name=selectBox]").val();
			var search = "${search}";
			var search_type = "${search_type}";
			
			jQuery('.showlabelsm').text('The selected page no: ' + e.page);
			
			var uurl;
			
			if( search == "" ) {
				uurl = "board_rlist.do?rpage="+ e.page+"&boardCategory="+boardCategory;
			} else {
				uurl = "board_rlist.do?rpage="+ e.page+"&boardCategory="+boardCategory+"&search="+search+"&search_type="+search_type;
			}
			$.ajax({
				url : uurl,
				//location.href="/f5/board_list.do?rpage="+ e.page+"&boardCategory="+boardCategory;
				success : function(result) {
					var jdata = JSON.parse(result);
					var table = "";
					$(".tr-sec").remove();
					
					for(var i in jdata.jlist) {
						table += "<tr class='tr-sec'>";
						table += "<td class='board-table-col1'>"+jdata.jlist[i].rno+"</td>";
						table += "<td class='board-table-col2'><a href='board_content.do?boardIdx="+jdata.jlist[i].boardIdx+"'>";
						if(jdata.jlist[i].boardCategory == '일반') {
							table += "[일반] " + jdata.jlist[i].boardTitle;
						} else if( jdata.jlist[i].boardCategory == '홍보' ) {
							table += "[홍보] " + jdata.jlist[i].boardTitle;
						} else {
							table += "[공지] " + jdata.jlist[i].boardTitle;
						}
						
						table += "</a></td>";
						table += "<td class='board-table-col3'>"+jdata.jlist[i].memberId+"</td>";
						table += "<td class='board-table-col4'>"+jdata.jlist[i].boardHits+"</td>";
						table += "<td class='board-table-col5'>"+jdata.jlist[i].boardDate+"</td>";
						table += "</tr>";
					}
					
					$(".tr-sec1").after(table);
					
				}
				
			});

		});
		
		
		// select 박스 선택
		$("select[name=selectBox]").change(function() {
			var boardCategory = $(this).val();			
			var search = "${search}";
			var search_type = "${search_type}";
			
			$.ajax({
				url: "board_change.do",
				type: "POST",
				data: {
					"boardCategory" : boardCategory,
					"search" : search,
					"search_type" : search_type
				},
				success: function(result){
					var jdata = JSON.parse(result);
					
					
					var pager = $('#ampaginationsm').pagination({

						maxSize : 5, // max page size
						totals : jdata.plist[0].dbCount, // total pages	
						page : jdata.plist[0].reqPage, // initial page		
						pageSize : jdata.plist[0].pageSize, // max number items per page
						
						
						boardCategory : '${boardCategory}',
						
						// custom labels		
						lastText : '&raquo;&raquo;',
						firstText : '&laquo;&laquo;',
						prevText : '&laquo;',
						nextText : '&raquo;',

						btnSize : 'sm' // 'sm'  or 'lg'		
					});
					
					var table = "";
					$(".tr-sec").remove();
					
					for(var i in jdata.jlist) {
						table += "<tr class='tr-sec'>";
						table += "<td class='board-table-col1'>"+jdata.jlist[i].rno+"</td>";
						table += "<td class='board-table-col2'><a href='board_content.do?boardIdx="+jdata.jlist[i].boardIdx+"'>"+jdata.jlist[i].boardTitle+"</a></td>";
						table += "<td class='board-table-col3'>"+jdata.jlist[i].memberId+"</td>";
						table += "<td class='board-table-col4'>"+jdata.jlist[i].boardHits+"</td>";
						table += "<td class='board-table-col5'>"+jdata.jlist[i].boardDate+"</td>";
						table += "</tr>";
					}
					
					$(".tr-sec1").after(table);
					
					
				},
				error: function(result) {
					alert("실패"+result);
				}
			});
			
		});
			
		
	});
	
</script>
</html>