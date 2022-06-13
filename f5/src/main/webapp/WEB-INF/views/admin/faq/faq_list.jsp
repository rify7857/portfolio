<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 자주찾는질문</title>
<link href="/f5/resources/css/admin/faq/faq_list.css" rel="stylesheet" />
<link rel="stylesheet" href="http://localhost:9000/f5/resources/css/am-pagination.css">
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/f5/resources/js/am-pagination.js"></script>
<script type="text/javascript">

function search() {
	
	var search = $("#searchbar").val(); 
	var search_type = $("#search_type").val();
	
	if ( search == "" ) {
		
		alert("검색어를 입력해주세요.");
	} else {
		
		location.href="faq_list.do?search="+search+"&search_type="+search_type;
	}
}

$(document).ready(function(){
	
	var search = $("#searchbar").val();
	var search_type = $("#search_type").val();
	var comment = $(".faqContent").val();
	comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br>');
	
	var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize: 7,	    		// max page size
	    totals: '${ dbCount }',	// total pages	
	    page: '${ reqPage }',		// initial page		
	    pageSize: '${ pageSize }',	// max number items per page
	
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
		if ( search == "" ) {
			
			$(".faq_list").remove();
			$.ajax({
				url : "faq_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				success : function(result) {
					
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						
						var str = "<details class='faq_list'>";
						str += "<summary>"+data.jlist[i].faqTitle+"</summary>";
						str += "<p><span class='faqContent'>"+data.jlist[i].faqContent+"</span></p>";
						str += "<div class='faq_btn'>";
						str += "<a href='faq_update.do?idx="+data.jlist[i].faqIdx+"&rno="+data.jlist[i].rno+"'><button type='button' class='update'>수정</button></a>";
						str += "<a href='faq_delete.do?idx="+data.jlist[i].faqIdx+"&rno="+data.jlist[i].rno+"'><button type='button' class='delete'>삭제</button></a>";
						str += "</div>";
						$("#faqList").append(str);
					}
				}
			});
		} else {
			
			$(".faq_list").remove();
			$.ajax({
				url : "faq_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				success : function(result) {
					
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						
						var str = "<details class='faq_list'>";
						str += "<summary>"+data.jlist[i].faqTitle+"</summary>";
						str += "<p><span class='faqContent'>"+data.jlist[i].faqContent+"</span></p>";
						str += "<div class='faq_btn'>";
						str += "<a href='faq_update.do?idx="+data.jlist[i].faqIdx+"&rno="+data.jlist[i].rno+"'><button type='button' class='update'>수정</button></a>";
						str += "<a href='faq_delete.do?idx="+data.jlist[i].faqIdx+"&rno="+data.jlist[i].rno+"'><button type='button' class='delete'>삭제</button></a>";
						str += "</div>";
						$("#faqList").append(str);
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
				<div id="content">
				<h4>관리자 | FAQ관리</h4>
					<div class="faq_write">
						<a href="faq_write.do">
							<button type="button" class="faq_write_btn">등록</button>
						</a>
					</div>
					<div id="faqList">
						<c:forEach var="vo" items="${ list }">
							<details class="faq_list">
							<summary>${ vo.faqTitle }</summary>
							<p><span class="faqContent">${ vo.faqContent }</span></p>
							<div class="faq_btn">
								<a href="faq_update.do?idx=${ vo.faqIdx }&rno=${ vo.rno }"><button type="button" class="update">수정</button></a>
								<a href="faq_delete.do?idx=${ vo.faqIdx }&rno=${ vo.rno }"><button type="button" class="delete">삭제</button></a>
							</div>
						</details>
						</c:forEach>
					</div>
					<div class="search">
						<div class="search_text">
							<select id="search_type">
								<option value="t" <c:if test="${ search_type eq 't' }">selected</c:if>>제목</option>
								<option value="c" <c:if test="${ search_type eq 'c' }">selected</c:if>>내용</option>
								<option value="tc" <c:if test="${ search_type eq 'tc' }">selected</c:if>>제목/내용</option>
							</select>
							<input type="text" id="searchbar" name="search" value="${ search }"
							placeholder="  검색어를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  검색어를 입력해주세요.'">
							<button type="button" class="search_btn" onclick="search()">검색</button>
						</div>
					</div>
					<div class="paging">
						<div id="ampaginationsm"></div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>