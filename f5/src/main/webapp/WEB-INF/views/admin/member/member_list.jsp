<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 일반회원관리</title>
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
		
		location.href="/f5/admin/member_list.do?search="+search + "&search_type=" + search_type;
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
			    var search = $("#searchbar").val();
				var search_type = $(".search_type").val();
			if ( search == "" ) {
			   $(".member_list").remove();
			   
			   $.ajax({
				  url : "member_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				  success : function(result) {
					  
					  const data = JSON.parse(result);
					  
					  for ( var i in data.jlist ) {
						  
						  var str = "<tr class='member_list'>";
						  str += "<td>"+data.jlist[i].rno+"</td>";
						  str += "<td>"+data.jlist[i].memberName+"</td>";
						  str += "<td><a href='member_content.do?id="+data.jlist[i].memberId+"&rno="+data.jlist[i].rno+"'>"+data.jlist[i].memberId+"</a></td>";
						  str += "<td>"+data.jlist[i].memberBirth+"</td>";
						  str += "<td>";
						  str += "<select name='memberAuthority' class='memberAuthority' id='"+data.jlist[i].memberId+"'>"
						  if ( data.jlist[i].memberAuthority == "0" ) {
							  
						  str += "<option value='0' selected>일반회원</option>";
						  str += "<option value='1'>CEO</option>";
						  str += "<option value='2'>블랙리스트</option>";
						  str += "<option value='3'>관리자</option>";
						  } else if ( data.jlist[i].memberAuthority == "1" ) {
							  
							  str += "<option value='0'>일반회원</option>";
							  str += "<option value='1' selected>CEO</option>";
							  str += "<option value='2'>블랙리스트</option>";
							  str += "<option value='3'>관리자</option>";
						  } else if ( data.jlist[i].memberAuthority == "2" ) {
							  
							  str += "<option value='0'>일반회원</option>";
							  str += "<option value='1'>CEO</option>";
							  str += "<option value='2' selected>블랙리스트</option>";
							  str += "<option value='3'>관리자</option>";
						  } else if ( data.jlist[i].memberAuthority == "3" ) {
							  
							  str += "<option value='0'>일반회원</option>";
							  str += "<option value='1'>CEO</option>";
							  str += "<option value='2'>블랙리스트</option>";
							  str += "<option value='3' selected>관리자</option>";
						  } else if ( data.jlist[i].memberAuthority == "4" ) {
							  
							  str += "<option value='0'>일반회원</option>";
							  str += "<option value='1'>CEO</option>";
							  str += "<option value='2'>블랙리스트</option>";
							  str += "<option value='3'>관리자</option>";
							  str += "<option value='4' selected>CEO신청</option>";
						  }
						  str += "</select>";
						  str += "</td>";
						  str += "</tr>";
						  $("#member_table").append(str);
					  }
				  }
			   });
			} else {
				
			   $(".member_list").remove();
			   
			   $.ajax({
				  url : "member_search_list.do?rpage="+e.page+"&search="+search+"&search_type="+search_type,
				  success : function(result) {
					  
					  const data = JSON.parse(result);
					  
					  for ( var i in data.jlist ) {
						  
						  var str = "<tr class='member_list'>";
						  str += "<td>"+data.jlist[i].rno+"</td>";
						  str += "<td>"+data.jlist[i].memberName+"</td>";
						  str += "<td><a href='member_content.do?id="+data.jlist[i].memberId+"&rno="+data.jlist[i].rno+"'>"+data.jlist[i].memberId+"</a></td>";
						  str += "<td>"+data.jlist[i].memberBirth+"</td>";
						  str += "<td>";
						  str += "<select name='memberAuthority' class='memberAuthority' id='"+data.jlist[i].memberId+"'>"
						  if ( data.jlist[i].memberAuthority == "0" ) {
							  
						  str += "<option value='0' selected>일반회원</option>";
						  str += "<option value='1'>CEO</option>";
						  str += "<option value='2'>블랙리스트</option>";
						  str += "<option value='3'>관리자</option>";
						  str += "<option value='4'>CEO신청</option>";
						  } else if ( data.jlist[i].memberAuthority == "1" ) {
							  
							  str += "<option value='0'>일반회원</option>";
							  str += "<option value='1' selected>CEO</option>";
							  str += "<option value='2'>블랙리스트</option>";
							  str += "<option value='3'>관리자</option>";
							  str += "<option value='4'>CEO신청</option>";
						  } else if ( data.jlist[i].memberAuthority == "2" ) {
							  
							  str += "<option value='0'>일반회원</option>";
							  str += "<option value='1'>CEO</option>";
							  str += "<option value='2' selected>블랙리스트</option>";
							  str += "<option value='3'>관리자</option>";
							  str += "<option value='4'>CEO신청</option>";
						  } else if ( data.jlist[i].memberAuthority == "3" ) {
							  
							  str += "<option value='0'>일반회원</option>";
							  str += "<option value='1'>CEO</option>";
							  str += "<option value='2'>블랙리스트</option>";
							  str += "<option value='3' selected>관리자</option>";
							  str += "<option value='4'>CEO신청</option>";
						  } else if ( data.jlist[i].memberAuthority == "4" ) {
							  
							  str += "<option value='0'>일반회원</option>";
							  str += "<option value='1'>CEO</option>";
							  str += "<option value='2'>블랙리스트</option>";
							  str += "<option value='3'>관리자</option>";
							  str += "<option value='4' selected>CEO신청</option>";
						  }
						  str += "</select>";
						  str += "</td>";
						  str += "</tr>";
						  $("#member_table").append(str);
					  }
				  }
			   });
			}
	    });
	
	$(document).on('change', ".memberAuthority", function(){
		console.log("sadfasdfsadfasd");
		var memberAuthority = $(this).val();
		var memberId = $(this).attr("id");
		
		$.ajax({
			url : "chkMberAuthUpdate.do?id=" + memberId + "&auth=" + memberAuthority,
			success : function(msg) {
				
				if ( msg == "success" ) {
					
					alert("수정이 완료되었습니다.");
				} else {
					
					alert("에러");
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
					<h4>일반회원관리</h4>
					<div class="register">
						<a href="member_insert.do"><button type="button" class="register_btn">일반회원 추가</button></a>
					</div>
						<table id="member_table">
							<colgroup>
								<!-- 번호 -->
								<!-- 이름 -->
								<col width="15%">
								<!-- 아이디 -->
								<col width="20%">
								<!-- 생년월일 -->
								<col width="25%">
								<!-- 회원권한 -->
								<col width="20%">
								<!-- 탈퇴 -->
								<col width="15%">
							</colgroup>
							<tr>
								<th>번호</th><th>이름</th><th>아이디</th><th>생년월일</th><th>회원권한</th>
							</tr>
								<c:forEach var="vo" items="${ list }">
								<tr class="member_list">
									<td>${ vo.rno }</td>
									<td>${ vo.memberName }</td>
									<td><a href="member_content.do?id=${ vo.memberId }&rno=${ vo.rno}">${ vo.memberId }</a></td>
									<td>${ vo.memberBirth }</td>
									<td>
										<select name="memberAuthority" class="memberAuthority" id="${ vo.memberId }">
											<option value="0" <c:if test="${ vo.memberAuthority eq '0' }">selected</c:if>>일반회원</option>
											<option value="1" <c:if test="${ vo.memberAuthority eq '1' }">selected</c:if>>CEO</option>
											<option value="2" <c:if test="${ vo.memberAuthority eq '2' }">selected</c:if>>블랙리스트</option>
											<option value="3" <c:if test="${ vo.memberAuthority eq '3' }">selected</c:if>>관리자</option>
											<option value="4" <c:if test="${ vo.memberAuthority eq '4' }">selected</c:if>>CEO신청</option>
										</select>
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
			</div>
		</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>