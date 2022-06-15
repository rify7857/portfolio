<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Gangnam Foodly | 관리자</title>
<link href="/f5/resources/css/admin/dashboard.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".black_list").click(function(){
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
	
	$(".member_more_btn").hover(function(){
		
		$(this).text("더 보기");
	}, function(){
		
		$(this).text("전체");
	});
	
	$(".ceo_member_more_btn").hover(function(){
		
		$(this).text("더 보기");
	}, function(){
		
		$(this).text("CEO");
	});
	
	$(".black_member_more_btn").hover(function(){
		
		$(this).text("더 보기");
	}, function(){
		
		$(this).text("블랙리스트");
	});
	
	member_graph();
	question_graph();
	ceo_graph();
	PV_graph();
});

function member_graph(){
	
	var today = [];
	var total = [];
	
	$.ajax({
		url : "member_chart.do",
		success : function(result){
			
			const data = JSON.parse(result);
			
			for ( var i in data.jlist ) {
				
				total.push(data.jlist[i].totalCnt);
				today.push(data.jlist[i].todayCnt);
			}
			new Chart(document.getElementById("memberChart"), {
				type : 'doughnut',
				data : {
					labels : ['오늘 가입 회원', '총 회원'],
					datasets : [{
						label : "first dataset",
						data : [today, total],
						borderColor : ['orange','oldlace'],
						backgroundColor : ['orange','oldlace'],
						fill : true
					}],
				},
				options : {
					title : {
						display : true,
						text : "사용자 통계"
					}
				}
			});
		}, error : function(){
			alert("실패");
		}
	});
}
function question_graph(){
	
	var waiting = [];
	var answering = [];
	var answerComplete = [];
	
	$.ajax({
		url : "question_chart.do",
		success : function(result){
			
			const data = JSON.parse(result);
			
			for ( var i in data.jlist ) {
				waiting.push(data.jlist[i].waiting);
				answering.push(data.jlist[i].answering);
				answerComplete.push(data.jlist[i].answerComplete);
			}
			new Chart(document.getElementById("questionChart"), {
				type : 'doughnut',
				data : {
					labels : ['답변완료', '답변중', '대기중'],
					datasets : [{
						label : "first dataset",
						data : [answerComplete, answering, waiting],
						borderColor : ['brown', 'orange','oldlace'],
						backgroundColor : ['brown', 'orange','oldlace'],
						fill : true
					}],
				},
				options : {
					title : {
						display : true,
						text : "문의 통계"
					}
				}
			});
		}, error : function(){
			alert("실패");
		}
	});
}

function ceo_graph(){
	
	var today = [];
	var total = [];
	
	$.ajax({
		url : "CEOreq_chart.do",
		success : function(result){
			
			const data = JSON.parse(result);
			
			for ( var i in data.jlist ) {
				
				total.push(data.jlist[i].totalCnt);
				today.push(data.jlist[i].reqCnt);
			}
			new Chart(document.getElementById("CEOreqChart"), {
				type : 'doughnut',
				data : {
					labels : ['등록된 CEO', '신청 CEO'],
					datasets : [{
						label : "first dataset",
						data : [total, today],
						borderColor : ['orange','oldlace'],
						backgroundColor : ['orange','oldlace'],
						fill : true
					}],
				},
				options : {
					title : {
						display : true,
						text : "CEO 통계"
					}
				}
			});
		}, error : function(){
			alert("실패");
		}
	});
}

function PV_graph(){
	
	var today = [];
	var total = [];
	
	$.ajax({
		url : "pageview_chart.do",
		success : function(result){
			
			const data = JSON.parse(result);
			
			for ( var i in data.jlist ) {
				
				total.push(data.jlist[i].totalPV);
				today.push(data.jlist[i].todayPV);
			}
			new Chart(document.getElementById("pvChart"), {
				type : 'doughnut',
				data : {
					labels : ['전체 PageVIew', '오늘 PageView'],
					datasets : [{
						label : "first dataset",
						data : [total, today],
						borderColor : ['orange','oldlace'],
						backgroundColor : ['orange','oldlace'],
						fill : true
					}],
				},
				options : {
					title : {
						display : true,
						text : "PV 통계"
					}
				}
			});
		}, error : function(){
			alert("실패");
		}
	});
}
</script>
</head>
<body>
    	<jsp:include page="header.jsp" />
        <!-- Page content-->
        <div class="container">
            <div class="row">
				<section>
					<div id="content1">
						<h3>통계</h3>
						<ul>
							<li class="statistics_list">
								<div class="statistics">
									<h5>PageView</h5>
									<div style="width: 100%">
										<canvas id="pvChart"></canvas>
									</div>
								</div>
							</li>
							<li class="statistics_list">
								<div class="statistics">
									<h5>사용자 통계</h5>
									<div style="width: 100%">
										<canvas id="memberChart"></canvas>
									</div>
								</div>
							</li>
							<li class="statistics_list">
								<div class="statistics">
									<h5>문의 통계</h5>
									<div style="width: 100%">
										<canvas id="questionChart"></canvas>
									</div>
								</div>
							</li>
							<li class="statistics_list">
								<div class="statistics">
									<h5>CEO</h5>
									<div style="width: 100%">
										<canvas id="CEOreqChart"></canvas>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</section>
				<section>
					<div id="content2">
						<h3>회원관리</h3>
						<div class="member_btn">
							<a href="member_list.do"><button type="button" class="member_more_btn">전체</button></a>
							<a href="ceo_member_list.do"><button type="button" class="ceo_member_more_btn">CEO</button></a>
							<a href="black_member_list.do"><button type="button" class="black_member_more_btn">블랙리스트</button></a>
						</div>
						<div>
							<table id="member_table">
							<colgroup>
								<!-- 번호 -->
								<col width="10%">
								<!-- 이름 -->
								<col width="15%">
								<!-- 아이디 -->
								<col width="15%">
								<!-- 생년월일 -->
								<col width="20%">
								<!-- 회원권한 -->
								<col width="15%">
								<!-- 탈퇴 -->
								<col width="20%">
							</colgroup>
								<tr>
									<th>번호</th><th>이름</th><th>아이디</th><th>생년월일</th><th>회원권한</th><th>블랙리스트</th>
								</tr>
								<c:forEach var="vo" items="${ result.memberList }">
									<tr>
										<td>${ vo.rno }</td>
										<td>${ vo.memberName }</td>
										<td>${ vo.memberId }</td>
										<td>${ vo.memberBirth }</td>
										<td>
											<c:if test="${ vo.memberAuthority eq '0' }">일반회원</c:if>
											<c:if test="${ vo.memberAuthority eq '1' }">CEO</c:if>
											<c:if test="${ vo.memberAuthority eq '2' }">블랙회원</c:if>
											<c:if test="${ vo.memberAuthority eq '3' }">관리자</c:if>
											<c:if test="${ vo.memberAuthority eq '4' }">CEO신청</c:if>
										</td>
										<td>
										<c:choose>
											<c:when test="${ vo.memberAuthority eq '2' }">
												<button type="button" id="${ vo.memberId }" class="black_list" value="1"
												style="background-color : orange">석방</button>
											</c:when>
											<c:otherwise>
												<button type="button" id="${ vo.memberId }" class="black_list" value="0"
												style="background-color : brown">추가</button>
											</c:otherwise>
										</c:choose>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</section>
				<section>
					<div id="content3">
						<h3>문의내역</h3>
						<div class="question_btn">
							<a href="question_list.do"><button type="button" class="question_more_btn">더 보기</button></a>
						</div>
						<table id="question_table">
						<colgroup>
								<!-- 번호 -->
								<col width="10%">
								<!-- 문의자 id -->
								<col width="15%">
								<!-- 문의제목 -->
								<col width="25%">
								<!-- 문의내용 -->
								<col width="35%">
								<!-- 답변여부 -->
								<col width="15%">
							</colgroup>
							<tr>
								<th>번호</th><th>문의자 id</th><th>문의제목</th><th>문의내용</th><th>답변여부</th>
							</tr>
							<c:forEach var="vo" items="${ result.questionList }">
								<tr>
									<td>${ vo.rno }</td>
									<td>${ vo.memberId }</td>
									<td>${ vo.questionTitle }</td>
									<td>${ vo.questionContent }</td>
									<td>
										<c:if test="${ vo.questionProceed eq '0' }">대기중</c:if>
										<c:if test="${ vo.questionProceed eq '1' }">답변중</c:if>
										<c:if test="${ vo.questionProceed eq '2' }">답변완료</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</section>
            </div>
            <!-- row -->
        </div>
        <!-- container -->
        
        <!-- Footer-->
	<jsp:include page="footer.jsp" />
    </body>
</html>
