<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/f5/resources/css/member/mypage/mypage_info.css"rel="stylesheet" />
<link href="/f5/resources/css/member/common.css" rel="stylesheet" />
<link href="/f5/resources/css/main/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet"href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javaScript"  defer="defer">

function btnYes() {
	
	
	if($('#pswd1').val() ==""){
		alert("비밀번호를 입력해주세요");
	}else if($('#pswd1').val()!=$('#pswd2').val()){
		alert('비번다름');
		return;
	}else{
	if(confirm("정말로 변경하시겠습니까?")){
		if($('#id').val()== ""){
			$('#id').val('${vo.memberId}');
		}
		if($('#name').val()== ""){
			$('#name').val('${vo.memberName}');
		}
		if($('#gender').val()== ""){
			$('#gender').val('${vo.memberGender}');
		}
		if($('#email').val()== ""){
			$('#email').val('${vo.memberEmail}');
		}
		if($('#mobile').val()== ""){
			$('#mobile').val('${vo.memberTel}');
		}
		if($('#postcode').val()== ""){
			$('#postcode').val('${vo.postcode}');
		}
		if($('#address').val()== ""){
			$('#address').val('${vo.address}');
		}
		if($('#detailAddress').val()== ""){
			$('#detailAddress').val('${vo.detailAddress}');
		}
		if($('#extraAddress').val()== ""){
			$('#extraAddress').val('${vo.extraAddress}');
		}
		if($('#memberPassHintAnswer').val()== ""){
			$('#memberPassHintAnswer').val('${vo.memberPassHintAnswer}');
		}
		memberUpdate.submit();
		alert("회원정보가 수정되었습니다.");
	}
	}
}
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
$(document).ready(function(){
	
	$(".CEOreq").click(function(){
		var id = $("#id").val();
		$.ajax({
			url : "CEOrequest.do?id="+id,
			success : function(msg) {
				
				if ( msg == "succ" ) {
					console.log("asdf");
					alert("CEO신청이 완료되었습니다.");
					location.reload();
				} else {
					
					alert("error");
				}
			}
		});
	});
	
	$(".CEOcancel").click(function(){
		var id = $("#id").val();
		$.ajax({
			url : "CEOcancel.do?id="+id,
			success : function(msg){
				
				if(msg == "succ") {
					alert("CEO신청이 취소되었습니다.");
					location.reload();
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
	<jsp:include page="../../header.jsp"></jsp:include>
	<!-- UnderBar -->
	<jsp:include page="../../member/mypage/mypageNav.jsp"></jsp:include>
	<!-- UnderBar -->

	<!-- User Information -->
	<div>
		<div>
			<div class="profile">
				<img class="user-img" src="/f5/resources/images/user.png"><br>
				<button id="store-update">내 매장정보 변경</button>
			</div>
			<span class="profile-h"><h2>${vo.memberId }님,환영합니다!</h2></span>
			<hr>

		</div>
	</div>

	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">

			<!-- ID -->
			<form name="memberUpdate" action="memberUpdate.do" method="post">
				<table id="member_update_table">
					<tr>
						<td><label>아이디</label></td>
					</tr>
					<tr>
						<td>
							<input type="text" id="id" name="memberId" value="${ vo.memberId }" readonly="readonly"
							placeholder="  아이디를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='  아이디를 입력해주세요.'">
						</td>
					</tr>
					<tr>
						<td><label>비밀번호 힌트</label></td>
					</tr>
					<tr>
						<td>
							<select id="pwHint" name="memberPassHint">
								<option value="0" <c:if test="${ vo.memberPassHint eq '0' }">selected</c:if>>--비밀번호 힌트--</option>
								<option value="1" <c:if test="${ vo.memberPassHint eq '1' }">selected</c:if>>출신학교</option>
								<option value="2" <c:if test="${ vo.memberPassHint eq '2' }">selected</c:if>>별명</option>
								<option value="3" <c:if test="${ vo.memberPassHint eq '3' }">selected</c:if>>기억에 남는 장소</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label>비밀번호 힌트 답변</label></td>
					</tr>
					<tr>
						<td>
							<input type="text" id="pwHintAnswer" name="memberPassHintAnswer"
							value="${ vo.memberPassHintAnswer }">
						</td>
					</tr>
					<tr>
						<td><label>이름</label></td>
					</tr>
					<tr>
						<td>
							<input type="text" id="name" name="memberName" readonly="readonly"
							value="${ vo.memberName }">
						</td>
					</tr>
					<tr>
						<td><label>생년월일</label></td>
					</tr>
					<tr>
						<td>
							<input type="text" class="datepicker1" id="birth" name="memberBirth" readonly="readonly"
							value="${ vo.memberBirth }">
						</td>
					</tr>
					<tr>
						<td><label>성별</label></td>
					</tr>
					<tr>
						<td>
							<select id="gender" name="memberGender">
								<option value="0" <c:if test="${ vo.memberGender eq '0' }">selected</c:if>>성별을 선택하세요</option>
								<option value="1" <c:if test="${ vo.memberGender eq '1' }">selected</c:if>>남자</option>
								<option value="2" <c:if test="${ vo.memberGender eq '2' }">selected</c:if>>여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label>휴대전화</label></td>
					</tr>
					<tr>
						<td><input type="text" id="tel" name="memberTel"
						value="${ vo.memberTel }"></td>
					</tr>
					<tr>
						<td><label>본인확인 이메일</label></td>
					</tr>
					<tr>
						<td><input type="text" id="email" name="memberEmail"
						value="${ vo.memberEmail }"></td>
					</tr>
					<tr>
						<td><label>주소</label></td>
					</tr>
					<tr>
						<td>
							<input type="text" id="postcode" placeholder="우편번호" readonly="readonly" name="postcode"
							value="${ vo.postcode }">
							<input type="button" class="addr_btn" onclick="execDaumPostcode()" value="우편번호 찾기" disabled="disabled"><br>
							<input type="text" id="address" placeholder="주소"readonly="readonly" name="address"
							value="${ vo.address }"><br>
							<input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress"
							value="${ vo.detailAddress }">
							<input type="text" id="extraAddress" placeholder="참고항목" readonly="readonly" name="extraAddress"
							value="${ vo.extraAddress }">
						</td>
					</tr>
				</table>
				<div class="table_btn">
					<button type="submit" class="update">수정</button>
					<a href="mypage.do"><button type="button" class="list">취소하기</button></a>
					<c:if test="${ vo.memberAuthority eq '0' }">
					<button type="button" class="CEOreq">CEO신청</button>
					</c:if>
					<c:if test="${ vo.memberAuthority eq '4' }">
					<button type="button" class="CEOcancel">CEO취소</button>
					</c:if>
				</div>
			</form>
		</div>
		<!-- content-->
	</div>
	<!-- wrapper -->

<script src="//code.jquery.com/jquery.min.js"></script>
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Footer-->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
