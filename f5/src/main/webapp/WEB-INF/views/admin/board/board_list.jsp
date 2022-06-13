<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 자유게시판 관리</title>
<link href="/f5/resources/css/admin/board/board_list.css" rel="stylesheet" />
<link rel="stylesheet" href="http://localhost:9000/f5/resources/css/am-pagination.css">
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/f5/resources/js/am-pagination.js"></script>

<script type="text/javascript">
function search() {
	
	var search = $("#searchbar").val();
	var search_type = $("#search_type").val();
	if ( search == "" ) {
		
		alert("검색어를 입력해주세요.");
		$("#searchbar").focus();
	} else {
		
		location.href="/f5/admin/board_list.do?search="+search+"&search_type="+search_type;
	}
}

$(document).ready(function(){
	
	var search = $("#searchbar").val();
	var search_type = $("#search_type").val();
	var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize: 7,	    		// max page size
	    totals: '${ dbCount }',	// total pages	
	    page: '${ reqPage }',		// initial page		
	    pageSize: '${ pageSize }',	// max number items per page
	
	    search : '${search}',
	    search_type : '${search_type}',
	    
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		jQuery('.showlabelsm').text('The selected page no: '+e.page);
		var search = $("#searchbar").val();
		var search_type = $("#search_type").val();
		if ( search != "" ) {
			
			$(".board_list").remove();
			$.ajax({
				url : "board_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				success : function(result) {
					
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						
						var str = "<tr class='board_list'>";
						str += "<td>"+data.jlist[i].rno+"</td>";
						str += "<td>"+data.jlist[i].memberId+"</td>";
						str += "<td><a href='board_content.do?idx="+data.jlist[i].boardIdx+"&rno="+data.jlist[i].rno+"'>"+data.jlist[i].boardTitle+"</a></td>";
						str += "<td>"+data.jlist[i].boardDate+"</td>";
						str += "<td>"+data.jlist[i].boardHits+"</td>";
						str += "</tr>";
						$("#board_table").append(str);
					}
				}
			});
		} else {
			
			$(".board_list").remove();
			$.ajax({
				url : "board_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				success : function(result) {
					
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						
						var str = "<tr class='board_list'>";
						str += "<td>"+data.jlist[i].rno+"</td>";
						str += "<td>"+data.jlist[i].memberId+"</td>";
						str += "<td><a href='board_content.do?idx="+data.jlist[i].boardIdx+"&rno="+data.jlist[i].rno+"'>"+data.jlist[i].boardTitle+"</a></td>";
						str += "<td>"+data.jlist[i].boardDate+"</td>";
						str += "<td>"+data.jlist[i].boardHits+"</td>";
						str += "</tr>";
						$("#board_table").append(str);
					}
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
			<section>
				<div id="content">
					<h4>관리자 | 자유게시판 관리</h4>
					<div class="board_btn">
					</div>
					<table id="board_table">
					<colgroup>
							<!-- 번호 -->
							<col width="10%">
							<!-- 게시자 id -->
							<col width="15%">
							<!-- 게시글제목 -->
							<col width="25%">
							<!-- 게시 날짜 -->
							<col width="35%">
							<!-- 조회수 -->
							<col width="15%">
						</colgroup>
						<tr>
							<th>번호</th><th>게시자</th><th>제목</th><th>날짜</th><th>조회수</th>
						</tr>
						<c:forEach var="vo" items="${ list }">
							<tr class="board_list">
								<td>${ vo.rno }</td>
								<td>${ vo.memberId }</td>
								<td><a href="board_content.do?idx=${ vo.boardIdx }&rno=${ vo.rno }">${ vo.boardTitle }</a></td>
								<td>${ vo.boardDate }</td>
								<td>${ vo.boardHits }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="search">
						<div class="search_text">
							<select id="search_type">
								<option value="t" <c:if test="${ search_type eq 't' }">selected</c:if>>제목</option>
								<option value="c" <c:if test="${ search_type eq 'c' }">selected</c:if>>내용</option>
								<option value="tc" <c:if test="${ search_type eq 'tc' }">selected</c:if>>제목/내용</option>
								<option value="n" <c:if test="${ search_type eq 'n' }">selected</c:if>>작성자</option>
							</select>
							<input type="text" id="searchbar" 
							placeholder="  검색어를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  검색어를 입력해주세요.'">
							<button type="button" class="search_btn" onclick="search()">검색</button>
						</div>
					</div>
					<div class="paging">
						<div id="ampaginationsm"></div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>