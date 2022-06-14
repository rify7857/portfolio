<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
 $(document).ready(function(){
	$("#gender").val('${vo.memberGender}').prop("selected",true);
 	/* for(var i = 1; i<=31 ; i++){
 		var option = $("<option value='"+i+"'>"+i+"</option>");
        $('#dd').append(option);
 	} */
 	$('#pwHint').val('${vo.memberPassHint}').prop("selected",true);
 	
/*  	 var date = new Date(); 
     
 	for(var i = 1980; i<=date.getFullYear() ; i++){
 		var option = $("<option value='"+i+"'>"+i+"</option>");
        $('#yy').append(option);
 	}
	 */
		$('#store-update').on("click",function(){
			 $(location).attr('href', "http://localhost:9000/f5/store_join_update.do?memberId=${sessionScope.memberId}");
		});
}); 


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
/* $(function() {
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
	}); */
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
			<div>
				<h3 class="join_title">
					<label for="id">아이디</label>
				</h3>
				<span class="box int_id"> <input type="text" id="id"
					class="int" maxlength="20" placeholder="${vo.memberId }" name="memberId" readonly="readonly">
				</span> <span class="error_next_box"></span>
			</div>

			<!-- PW1 -->
			<div>
				<h3 class="join_title">
					<label for="pswd1">비밀번호</label>
				</h3>
				<span class="box int_pass"> <input type="text" id="pswd1"
					class="int" maxlength="20" name="memberPass"> <span id="alertTxt">사용불가</span>
					<img src="/f5/resources/images/m_icon_pass.png" id="pswd1_img1"
					class="pswdImg">
				</span> <span class="error_next_box"></span>
			</div>

			<!-- PW2 -->
			<div>
				<h3 class="join_title">
					<label for="pswd2">비밀번호 재확인</label>
				</h3>
				<span class="box int_pass_check"> <input type="text"
					id="pswd2" class="int" maxlength="20"> <img
					src="/f5/resources/images/m_icon_check_disable.png" id="pswd2_img1"
					class="pswdImg">
				</span> <span class="error_next_box"></span>
			</div>

			<!-- NAME -->
			<div>
				<h3 class="join_title">
					<label for="name">이름</label>
				</h3>
				<span class="box int_name"> <input type="text" id="name"
					class="int" maxlength="20" placeholder="${vo.memberName }" name="memberName">
				</span> <span class="error_next_box"></span>
			</div>
			<table>
				<tr>
					<td><label>생년월일</label></td>
				</tr>
				<tr>
					<td><input type="text" class="datepicker1" id="birth"
						name="memberBirth" readonly value="${vo.memberBirth }" name="memberBirth"></td>
				</tr>
			</table>
			 	<!-- BIRTH -->
<!-- 			<div>
				<h3 class="join_title">
					<label for="yy">생년월일</label>
				</h3>

				<div id="bir_wrap">
					BIRTH_YY
					<div id="bir_yy">
						<span class="box"> <select id="yy" class="sel">
								<option>년도</option>
						</select>
						</span>
					</div>

					BIRTH_MM
					<div id="bir_mm">
						<span class="box"> <select id="mm" class="sel">
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>
						</span>
					</div>

					BIRTH_DD
					<div id="bir_dd">
						<span class="box"> <input type="text" id="dd" class="int"
							maxlength="2" placeholder="일"> <select id="dd"
							class="sel">
								<option>일</option>

						</select>
						</span>
					</div>

				</div>
				<span class="error_next_box"></span>
			</div>
			 -->
			<!-- GENDER -->
			<div>
				<h3 class="join_title">
					<label for="gender">성별</label>
				</h3>
				<span class="box gender_code"> <select id="gender"
					class="sel" name="memberGender">
						<option>성별</option>
						<option value="1">남자</option>
						<option value="2">여자</option>
				</select>
				</span> <span class="error_next_box">필수 정보입니다.</span>
			</div>

			<!-- EMAIL -->
			<div>
				<h3 class="join_title">
					<label for="email">본인확인 이메일<span class="optional">(선택)</span></label>
				</h3>
				<span class="box int_email"> <input type="text" id="email"
					class="int" maxlength="100" placeholder="${vo.memberEmail }" name="memberEmail">
				</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
			</div>

			<!-- MOBILE -->
			<div>
				<h3 class="join_title">
					<label for="phoneNo">휴대전화</label>
				</h3>
				<span class="box int_mobile"> <input type="tel" id="mobile"
					class="int" maxlength="16" placeholder="${vo.memberTel }" name="memberTel">
				</span> <span class="error_next_box"></span>
			</div>
			<table>
				<tr>
					<td><label>주소</label></td>
				</tr>
				<tr>
					<td><input type="text" id="postcode" placeholder="${vo.postcode }"
						readonly="readonly" name="postcode"> <input type="button"
						class="addr_btn" onclick="execDaumPostcode()" value="주소찾기"><br>
						<input type="text" id="address" placeholder="${vo.address}"
						readonly="readonly" name="address"><br> <input
						type="text" id="detailAddress" placeholder="${vo.detailAddress}"
						name="detailAddress"> <input type="text" id="extraAddress"
						placeholder="${vo.extraAddress }" readonly="readonly" name="extraAddress">
					</td>
				</tr>
			</table>
			
			<div>
				<h3 class="join_title">
					<label for="hint">비밀번호힌트</label>
				</h3>
				<span class="box int_mobile">
					<select id="pwHint" name="memberPassHint">
						<option value="0" selected="selected">--비밀번호 힌트--</option>
						<option value="1">출신학교</option>
						<option value="2">별명</option>
						<option value="3">기억에 남는 장소</option>
					</select>
				</span> <span class="error_next_box"></span>
			</div>
			<div>
				<h3 class="join_title">
					<label for="answer">비밀번호답변</label>
				</h3>
				<span class="box int_mobile"> <input type="tel" id="mobile"
					class="int" maxlength="16" placeholder="${vo.memberPassHintAnswer }" name="memberPassHintAnswer">
				</span> <span class="error_next_box"></span>
			</div>
			<!-- JOIN BTN-->
			<div class="btn_area">

				<button type="button" id="btnJoin" onclick="btnYes()">
					<span>변 경 하 기</span>
				</button>

				<a href="mypage.do" id="btnCancel">
					<button type="button" id="btnJoin">

						<span>취 소 하 기</span>
					</button>
				</a>
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
