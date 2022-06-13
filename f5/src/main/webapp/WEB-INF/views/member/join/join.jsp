<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>
<link href="/f5/resources/css/member/join/join.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>

<!-- datepicker --> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(function() {
  $(".datepicker1").datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    yearRange: 'c-100:c+10',
    minDate: '-100y',
    yearSuffix: '년',
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true
  });
});

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

/* 
//아이디 정규식
var userId = /^[a-zA-z0-9]{4,12}$/;
// 비밀번호 정규식
var userPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
// 전화번호 정규식
var userTel = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
// 이메일 정규식
var userEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
// 숫자만 정규식
var userIdNum = /^[0-9]+$/;
 */
 
function join() {
	
	if ( confirm("가입하시겠습니까?") ) {
		
		check();
	} else {
		
		return;
	}
}

function check(){
	
	if ( $("#id").val() == "" ) {
		
		alert("아이디를 입력해주세요");
		$("#id").focus();
	} else if ( $("#pw").val() == "" ) {
		
		alert("비밀번호를 입력해주세요.")
		$("#pw").focus();
	} else if ( $("#pwChk").val() == "" ) {
		
		alert("비밀번호 확인을 입력해주세요");
		$("#pwChk").focus();
	} else if ( $("#name").val() == "" ) {
		
		alert("이름을 입력해주세요");
		$("#name").focus();
	} else if ( $("#birth").val() == "" ) {
		
		alert("생일을 입력해주세요");
		$("#birth").focus();
	} else if ( $("#gender").val() == "" ) {
		
		alert("성별을 선택해주세요.");
		$("#gender").focus();
	} else if ( $("#email").val() == "" ) {
		
		alert("이메일을 입력해주세요.");
		$("#email").focus();
	} else if ( $("#tel").val() == "" ) {
		
		alert("전화번호를 입력해주세요.");
		$("#tel").focus();
	} else if ( $("#postcode").val() == "" && $("#address").val() == "" && $("#detailAddress").val() == "" ) {
		
		alert("주소를 입력해주세요.");
		$("#address").focus();
	} else {
		
		insertForm.submit();
	}
}

// function idChk(){
	
// 	if ( $("#id").val() != "" ) {
		
// 		// 아이디 중복 확인
// 		if ( $("#id").val() == "admin" ) {
			
// 			alert("중복된 아이디입니다.");
// 			$("#id").focus();
// 		} else {
			
// 			alert("사용이 가능한 아이디입니다.");
// 		}
// 	} else {
		
// 		alert("아이디를 입력해주세요.");
// 		$("#id").focus();
// 	}
// }

$(document).ready(function(){
	//중복체크 처리
	$("#idChk").click(function(){
		var id = $("#id").val();
		
		if(id == ""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
		}else{
			//id값을 서버로 전송하여 중복체크 처리한 후 결과 송신
			//alert(id);
			$.ajax({
				url:"idcheck.do?id="+id,
				success : function(result){
					if(result == 1){
						//alert("중복된 아이디가 존재합니다. 다시 입력해주세요");
						$("#idcheck_msg").text("중복된 아이디가 존재합니다. 다시 입력해주세요");
						$("#idcheck_msg").css("font-size","9px").css("color","red");						
						$("#id").val("").focus();
					}else{
						//alert("사용이 가능한 아이디입니다.");
						$("#idcheck_msg").text("사용이 가능한 아이디입니다.");
						$("#idcheck_msg").css("font-size","9px").css("color","blue");
						$("#pw").focus();
					}
				}
			});
		}			
		
	});
	
	$("#pwChk").blur(function(){
		
		if ( $("#pw").val() != $("#pwChk").val() ) {
			
			$(".pwChk_text").text("비밀번호와 일치하지 않습니다.");
			$(".pwChk_text").css("color", "red").css("font-size", "10px");
			$("#pw").css("border-color", "red");
		} else {
			
			$(".pwChk_text").text("비밀번호와 일치합니다.");
			$(".pwChk_text").css("color", "lightgreen").css("font-size", "10px");
			$("#pw").css("border-color", "lightgreen");
		}
	});
	
// 	$("#chk").click(function() {
		
// 		if($("#chk").is(":checked")){
			
// 			$("input[name=chk]").prop("checked", true);
// 			$("input[name=chk]").val(1);
// 		} else {
			
// 			$("input[name=chk]").prop("checked", false);
// 			$("input[name=chk]").val(0);
// 		}
// 	});
	
// 	$("input[name=chk]").click(function() {
		
// 		var total = $("input[name=chk]").length;
// 		var checked = $("input[name=chk]:checked").length;
		
// 		if(total != checked) {
			
// 			$("#chk").prop("checked", false);
// 		} else {
			
// 			$("#chk").prop("checked", true); 
// 		}
		
// 		if ( $(this).val() == "0" ) {
			
// 			$(this).val(1);
// 		} else {
			
// 			$(this).val(0);
// 		}
// 	});
});
</script>
</head>
<body>
		<div class="container">
			<div class="row">
				<div id="content">
				<div class="headlogo">
				<img class=mainlogo src = "/f5/resources/images/mainlogo2.png">
				</div>
					<form action="join.do" method="post" name="insertForm">
					
					<table id="join_table">
						<tr>
							<td><label>아이디</label></td>
						</tr>
						<tr>
							<td>
								<input type="text" id="id" name="memberId"
								placeholder="  아이디를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  아이디를 입력해주세요.'">
								<button type="button" id="idChk">중복확인</button>
								<div id="idcheck_msg"></div>
							</td>
						</tr>
						<tr>
							<td><label>비밀번호</label></td>
						</tr>
						<tr>
							<td>
								<input type="password" id="pw" name="memberPass"
								placeholder="  비밀번호를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  비밀번호를 입력해주세요.'">
								<div class="pwChk_text"></div>
							</td>
						</tr>
						<tr>
							<td><label>비밀번호 재확인</label></td>
						</tr>
						<tr>
							<td>
								<input type="password" id="pwChk" name="memberPassChk">
							</td>
						</tr>
						<tr>
							<td><label>비밀번호 힌트</label></td>
						</tr>
						<tr>
							<td>
								<select id="pwHint" name="memberPassHint">
									<option value="0" selected="selected">--비밀번호 힌트--</option>
									<option value="1">출신학교</option>
									<option value="2">별명</option>
									<option value="3">기억에 남는 장소</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label>비밀번호 힌트 답변</label></td>
						</tr>
						<tr>
							<td>
								<input type="text" id="pwHintAnswer" name="memberPassHintAnswer">
							</td>
						</tr>
						<tr>
							<td><label>이름</label></td>
						</tr>
						<tr>
							<td>
								<input type="text" id="name" name="memberName">
							</td>
						</tr>
						<tr>
							<td><label>생년월일</label></td>
						</tr>
						<tr>
							<td>
								<input type="text" class="datepicker1" id="birth" name="memberBirth">
							</td>
						</tr>
						<tr>
							<td><label>성별</label></td>
						</tr>
						<tr>
							<td>
								<select id="gender" name="memberGender">
									<option value="0" selected="selected">성별을 선택하세요</option>
									<option value="1">남자</option>
									<option value="2">여자</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label>휴대전화</label></td>
						</tr>
						<tr>
							<td><input type="text" id="tel" name="memberTel"></td>
						</tr>
						<tr>
							<td><label>본인확인 이메일(선택)</label></td>
						</tr>
						<tr>
							<td><input type="text" id="email" name="memberEmail"></td>
						</tr>
						<tr>
							<td><label>주소</label></td>
						</tr>
						<tr>
							<td>
								<input type="text" id="postcode" placeholder="우편번호" readonly="readonly" name="postcode">
								<input type="button" class="addr_btn" onclick="execDaumPostcode()" value="주소찾기"><br>
								<input type="text" id="address" placeholder="주소"readonly="readonly" name="address"><br>
								<input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress">
								<input type="text" id="extraAddress" placeholder="참고항목" readonly="readonly" name="extraAddress">
							</td>
						</tr>
						<tr>
							<td>
								<div class="agree">
									<ul class="join_box">
                						<li class="checkBox check01">
                    						<ul class="clearfix">
						                        <li>이용약관, 개인정보 수집 및 이용,
						                            위치정보 이용약관(선택), 프로모션 안내
						                            메일 수신(선택)에 모두 동의합니다.</li>
						                        <li class="checkAllBtn">
						                            <input type="checkbox" name="chkAll" id="chk" class="chkAll">
						                        </li>
						                    </ul>
						                </li>
						                <li class="checkBox check02">
						                    <ul class="clearfix">
						                        <li>이용약관 동의(필수)</li>
						                        <li class="checkBtn">
						                            <input type="checkbox" name="chk" class="chk" id="agree1" value="0"> 
						                        </li>
						                    </ul>
						                </li>
						                <li class="checkBox check03">
						                    <ul class="clearfix">
						                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
						                        <li class="checkBtn">
						                            <input type="checkbox" name="chk" class="chk" id="agree2" value="0">
						                        </li>
						                    </ul>
						                </li>
						                <li class="checkBox check03">
						                    <ul class="clearfix">
						                        <li>위치정보 이용약관 동의(필수)</li>
						                        <li class="checkBtn">
						                            <input type="checkbox" name="chk" class="chk" id="agree3" value="0">
						                        </li>
						                    </ul>
						                </li>
						                <li class="checkBox check04">
						                    <ul class="clearfix">
						                        <li>이벤트 등 프로모션 알림 메일 수신(선택</li>
						                        <li class="checkBtn">
						                            <input type="checkbox" name="chk" class="chk" id="agree4" value="0">
						                        </li>
						                    </ul>
						                </li>
						            </ul>
								</div>
							</td>
						</tr>
					</table>
					<div class="table_btn">
					
						<button type="button" class="insert" onclick="join()">가입하기</button>
						<a href="index.do"><button type="button" class="list">취소하기</button></a>
					</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>