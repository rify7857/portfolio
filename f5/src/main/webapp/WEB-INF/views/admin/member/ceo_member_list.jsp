<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | CEO회원관리</title>
<link href="/f5/resources/css/admin/member/member_list.css" rel="stylesheet" />
<link rel="stylesheet" href="http://localhost:9000/f5/resources/css/am-pagination.css">
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/f5/resources/js/am-pagination.js"></script>
<script type="text/javascript">
function search() {
	
	var search = $("#searchbar").val();
	var search_type = $(".search_type").val();
	
	if ( search == "" ) {
		console.log("${vo.memberId}");
		alert("검색할 사용자를 입력해주세요.");
		$("#searchbar").focus();
	} else {
		
		location.href="/f5/admin/ceo_member_list.do?search="+search + "&search_type=" + search_type;
	}
}

$(document).ready(function(){
	
	var search = $("#searchbar").val();
	var search_type = $(".search_type").val();
	
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
		
		if ( search == "" ) {
			$(".member_list").remove();
			
			$.ajax({
				url : "ceo_member_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				success : function(result) {
					
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						
						var str = "<tr class='member_list'>";
						str += "<td>"+data.jlist[i].rno+"</td>";
						str += "<td>"+data.jlist[i].memberName+"</td>";
						str += "<td>"+data.jlist[i].memberId+"</td>";
						str += "<td>"+data.jlist[i].storeName+"</td>";
						str += "<td>"+data.jlist[i].storeName+"</td>";
						if ( data.jlist[i].memberAuthority != '4' ) {
							
							str += "<td><button value='0' class='black_list' id='"+data.jlist[i].memberId+"'>추가</button>";
						} else {
							
							str += "<td><button value='1' class='black_list' id='"+data.jlist[i].memberId+"'>석방</button>";
						}
						str += "<td><button value='0' class='closing' id='"+data.jlist[i].storeIdx+"'>승인</button></td>";
						str += "</tr>";
						$("#member_table").append(str);
					}
				}
			});
		} else {
			
			$(".member_list").remove();
			
			$.ajax({
				url : "ceo_member_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				success : function(result) {
					
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						
						var str = "<tr class='member_list'>";
						str += "<td>"+data.jlist[i].rno+"</td>";
						str += "<td>"+data.jlist[i].memberName+"</td>";
						str += "<td>"+data.jlist[i].memberId+"</td>";
						str += "<td>"+data.jlist[i].storeName+"</td>";
						str += "<td>"+data.jlist[i].storeName+"</td>";
						if ( data.jlist[i].memberAuthority != '4' ) {
							
							str += "<td><button value='0' class='black_list' id='"+data.jlist[i].memberId+"'>추가</button>";
						} else {
							
							str += "<td><button value='1' class='black_list' id='"+data.jlist[i].memberId+"'>석방</button>";
						}
						str += "<td><button value='0' class='closing' id='"+data.jlist[i].storeIdx+"'>승인</button></td>";
						str += "</tr>";
						$("#member_table").append(str);
					}
				}
			});
		}
	});
	
	$(document).on('click', ".black_list", function(){
		var memberId = $(this).attr("id");
		if ( $(this).val() == "0" ) {
			$.ajax({
				url : "member_black_insert.do?id="+memberId,
				success : function(msg) {
					
					if ( msg == "success" ) {
						$("#"+memberId).css("background-color", "orange").text("석방");
						$("#"+memberId).val(1);
					} else {
						
						alert("fail");
					}
				}
			});
		} else {
			
			$.ajax({
				url : "member_black_out.do?id=" + memberId,
				success : function(msg) {
					
					if ( msg == "success" ) {
						
						$("#"+memberId).css("background-color", "brown").text("추가");
						$("#"+memberId).val(0);
					} else {
						
						alert("fail");
					}
				}
			});
		}
	});
	
	$(".closing").click(function(){
		var storeIdx = $(this).attr("id");
		$.ajax({
			url : "store_close.do?idx="+storeIdx,
			success : function(msg) {

				if ( msg == "succ" ) {
					$(this).remove();
				} else {
					
					alert("error");
				}
			}
		});
	});
});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
		<div class="container">
			<div class="row">
				<div id="content">
					<h4>CEO회원관리</h4>
					<table id="member_table">
						<colgroup>
								<!-- 번호 -->
								<col width="10%">
								<!-- 이름 -->
								<col width="15%">
								<!-- 아이디 -->
								<col width="15%">
								<!-- 회원권한 -->
								<col width="15%">
								<!-- 블랙리스트 -->
								<col width="17%">
								<!-- 탈퇴 -->
								<col width="13%">
							</colgroup>
							<tr>
								<th>번호</th><th>이름</th><th>아이디</th><th>매장이름</th><th>블랙리스트</th><th>폐점신청</th>
							</tr>
							<c:forEach var="vo" items="${ list }">
								<tr class="member_list">
									<td>${ vo.rno }</td>
									<td>${ vo.memberName }</td>
									<td><a href="ceo_member_content.do?id=${ vo.memberId }&rno=${ vo.rno }">${ vo.memberId }</a></td>
									<td>
									<label><a href="store_information.do?idx=${ vo.storeIdx }">${ vo.storeName }</a></label>
									</td>
									<td>
										<button value="0" class="black_list" id="${ vo.memberId }">추가</button>
									</td>
									<td>
										<button value="0" class="closing" id="${ vo.storeIdx }">승인</button>
									</td>
								</tr>
							</c:forEach>
					</table>
					<div class="search">
						<div class="search_text">
							<select class="search_type">
								<option value="n" <c:if test="${ search_type eq 'n' }">selected</c:if>>이름</option>
								<option value="i" <c:if test="${ search_type eq 'i' }">selected</c:if>>아이디</option>
								<option value="ni" <c:if test="${ search_type eq 'ni' }">selected</c:if>>이름/아이디</option>
								<option value="s" <c:if test="${ search_type eq 's' }">selected</c:if>>가게명</option>
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
			</div>
		</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>