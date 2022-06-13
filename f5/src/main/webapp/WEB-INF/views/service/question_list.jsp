<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly| 문의리스트</title>
<link href="/f5/resources/css/admin/question/question_list.css" rel="stylesheet" />

</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
		<div class="row">
			<section>
				<div id="content">
					<h4>Foodly | 문의리스트</h4>
					<div class="question_btn">
						<a href="question_write.do"><button class="question_write_btn">문의하기</button></a>
					</div>
					<table id="question_table">
					<colgroup>
							<!-- 번호 -->
							<col width="10%">
							<!-- 문의자 -->
							<col width="15%">
							<!-- 문의제목 -->
							<col width="35%">
							<!-- 문의날짜 -->
							<col width="20%">
							<!-- 답변여부 -->
							<col width="20%">
						</colgroup>
						<tr>
							<th>번호</th><th>문의자</th><th>문의제목</th><th>문의날짜</th><th>답변여부</th>
						</tr>
						<c:forEach var="vo" items="${ list }">
							<tr class="question_list">
								<td>${ vo.rno }</td>
								<td>${ vo.memberId }</td>
								<td>${ vo.questionTitle }</td>
								<td>${ vo.questionDate }</td>
								<td>
									<c:if test="${ vo.questionProceed eq '0' }">대기중</c:if>
									<c:if test="${ vo.questionProceed eq '1' }">답변중</c:if>
									<c:if test="${ vo.questionProceed eq '2' }">답변완료</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="search">
						<div class="search_text">
							<select name="search_type" id="search_type">
								<option value="t" <c:if test="${ search_type eq 't' }">selected</c:if>>제목</option>
								<option value="c" <c:if test="${ search_type eq 'c' }">selected</c:if>>내용</option>
								<option value="tc" <c:if test="${ search_type eq 'tc' }">selected</c:if>>제목/내용</option>
								<option value="n" <c:if test="${ search_type eq 'n' }">selected</c:if>>작성자</option>
							</select>
							<input type="text" id="searchbar" value="${ search }"
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
		location.href="/f5/question_list.do?search="+search+"&search_type="+search_type;
	}
}

function modify() {
	
	if ( confirm("선택하신 문의 답변여부를 수정하시겠습니까?") ) {
		
		alert("수정되었습니다.");
	} else {
		
		return;
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
	   
		$(".question_list").remove();
		$.ajax({
			url : "question_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
			contentType: "application/json; charset=utf-8",
			success : function(result) {
				const data = JSON.parse(result);
				
				for ( var i in data.jlist ) {
					
					var str = "<tr class='question_list'>";
					str += "<td>"+data.jlist[i].rno+"</td>";
					str += "<td><a href='member_content.do?id="+data.jlist[i].memberId+"'>"+data.jlist[i].memberId+"</a></td>";
					str += "<td><a href='question_content.do?idx="+data.jlist[i].questionIdx+"&rno="+data.jlist[i].rno+"'>"+data.jlist[i].questionTitle+"</a></td>";
					str += "<td>"+data.jlist[i].questionDate+"</td>";
					str += "<td>";
					
					if ( data.jlist[i].questionProceed == '0' ) {
						
						str += "대기중";
					} else if ( data.jlist[i].questionProceed == '1' ) {
						
						str += "답변중";
					} else if ( data.jlist[i].questionProceed == '2' ) {
						
						str += "답변완료";
					}
					
					str += "</td>";
					str += "</tr>";
					$("#question_table").append(str);
				}
			}
		});
	   } else {
		   $(".question_list").remove();
			$.ajax({
				url : "question_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				contentType: "application/json; charset=utf-8",
				success : function(result) {
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						
						var str = "<tr class='question_list'>";
						str += "<td>"+data.jlist[i].rno+"</td>";
						str += "<td><a href='member_content.do?id="+data.jlist[i].memberId+"'>"+data.jlist[i].memberId+"</a></td>";
						str += "<td><a href='question_content.do?idx="+data.jlist[i].questionIdx+"&rno="+data.jlist[i].rno+"'>"+data.jlist[i].questionTitle+"</a></td>";
						str += "<td>"+data.jlist[i].questionDate+"</td>";
						str += "<td>";
						str += "<select id='questionProceed'>";
						
						if ( data.jlist[i].questionProceed == '0' ) {
							
							str += "<option value='3'>전체보기</option>";
							str += "<option value='0' selected>대기중</option>";
							str += "<option value='1'>답변중</option>";
							str += "<option value='2'>답변완료</option>";
						} else if ( data.jlist[i].questionProceed == '1' ) {
							
							str += "<option value='3'>전체보기</option>";
							str += "<option value='0'>대기중</option>";
							str += "<option value='1' selected>답변중</option>";
							str += "<option value='2'>답변완료</option>";
						} else if ( data.jlist[i].questionProceed == '2' ) {
							
							str += "<option value='3'>전체보기</option>";
							str += "<option value='0'>대기중</option>";
							str += "<option value='1'>답변중</option>";
							str += "<option value='2' selected>답변완료</option>";
						} else {
							
							str += "<option value='3' selected>전체보기</option>";
							str += "<option value='0'>대기중</option>";
							str += "<option value='1'>답변중</option>";
							str += "<option value='2'>답변완료</option>";
						}
						
						str += "</select>";
						str += "</td>";
						str += "</tr>";
						$("#question_table").append(str);
					}
				}
			}); 
	   }
    });
});

</script>
</html>