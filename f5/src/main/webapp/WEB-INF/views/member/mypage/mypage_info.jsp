<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<html lang="en">
<link href="/f5/resources/css/member/mypage/mypage_info.css" rel="stylesheet" />
<link href="/f5/resources/css/member/common.css" rel="stylesheet" />
<link href="/f5/resources/css/main/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>


<script>
$(document).ready(function(){

 	for(var i = 1; i<=31 ; i++){
 		var option = $("<option value='"+i+"'>"+i+"</option>");
        $('#dd').append(option);
 	}
 	
 	
 	 var date = new Date(); 
     
 	for(var i = 1980; i<=date.getFullYear() ; i++){
 		var option = $("<option value='"+i+"'>"+i+"</option>");
        $('#yy').append(option);
 	}
	
	$('#pswd2').blur(function(){
		if($('#pswd1').val()!=null && $('#pswd2').val()!=null&&
			$('#pswd1').val()!='' && $('#pswd2').val()!=''){
			if($('#pswd1').val()!=$('#pswd2').val()){
				alert('비번이 다릅니다2');
			}
		}
	});
})

function btnYes() {
	
	
	
	
	if($('#pswd1').val()!=$('#pswd2').val()){
		alert('비번다름');
		return;
	}

	window.confirm("정말로 변경하시겠습니까?");
	
}

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
					<input class = "user-fix"type="button" value="회원정보변경"> 
				</div>
				<span class="profile-h"><h2>Username 님, 환영합니다!</h2></span>
				<hr>
		
        	</div>
        </div>
        
         <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pswd1" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="/f5/resources/images/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="int" maxlength="20">
                        <img src="/f5/resources/images/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">생년월일</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                            	<select id="yy" class="sel">
                                    <option>년도</option>
                                 </select>
                            </span>
                        </div>

                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select id="mm" class="sel">
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

                        <!-- BIRTH_DD -->
                        <div id="bir_dd">
                            <span class="box">
                               <!-- <input type="text" id="dd" class="int" maxlength="2" placeholder="일"> -->
                                 <select id="dd" class="sel">
                                    <option>일</option>
                                    
                                </select>
                            </span>
                        </div>

                    </div>
                    <span class="error_next_box"></span>    
                </div>

                <!-- GENDER -->
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" class="sel">
                            <option>성별</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>                            
                    </span>
                    <span class="error_next_box">필수 정보입니다.</span>
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" placeholder="선택입력">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box"></span>    
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

                

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
      
        
        <!-- Footer-->
	<jsp:include page="../../footer.jsp"></jsp:include>
    </body>
</html>
