<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>
<link href="/f5/resources/css/store/store_join.css" rel="stylesheet" />
<link href="/f5/resources/css/head_nav.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var memberId = '${sessionScope.memberId}';
		if(memberId == ""){
			var confirmResult = confirm("로그인이 필요한 페이지입니다. 로그인페이지로 이동하시겠습니까?");
			if(confirmResult){
				 $(location).attr('href', "http://localhost:9000/f5/login.do");
			}else{
				alert("접근할 수 없습니다.")
				$(location).attr('href', "http://localhost:9000/f5/index.do");
			}
		} 
		
		$('#btnJoin').on('click',function(){
			var filenumber = $('#file-number').val();
			if(filenumber != 6){
				for(var i=parseInt(filenumber); i<6; i++){
					var str = "<input type='file' name = 'sFiles' value='' class = 'file-upload'>";
					$('.file-selector-list').append(str);
				}
			}
			store_join_form.submit();
		});
		drawFileSelector(1);
		$(document).on('change','.file-upload',function(){
			var fileName = $(this)[0].files[0].name;
			$(this).siblings('.file-name-holder').val(fileName);
			if(fileName != ""){
				var filenumber = $('#file-number').val()
				drawFileSelector(filenumber);
			}
		});
	});
	function drawFileSelector(filenumber){
		var filename = $('#file-name-holder-'+(String)(filenumber-1)).val();
		if(filenumber != 1 && (filename == "" || filenumber == 6)){
			
		}else{
			var str = "";
			str =str +'<div class="file-add">';
			str =str +'<input class="file-name-holder" id="file-name-holder-'+filenumber+'" disabled="disabled">';
			str =str +'<label for="file-upload-'+filenumber+'" class="file-label" id=file-label-"'+filenumber+'">+</label>';
			str =str +'<input type="file" class="file-upload" id="file-upload-'+filenumber+'" name = "sFiles"></div>';
			if(filenumber != 6){
				$('#file-number').val(parseInt(filenumber)+1);
				$('.file-selector-list').append(str);
			}
		}
	}
</script>
<style type="text/css">
	.store-table tr th {
		 background-color: rgb(255,225,140);
		 text-align: left;
		 padding-left:20px;
	}
	.store-join-price td{
		width : 30%;
	}
	.file-upload{
		display: none;
	}
	.file-name-holder{
		-webkit-appearance: none;
  		-moz-appearance: none;
  		appearance: none;
  		
	}
	.file-label{
		margin-left:10px;
	}
	
</style>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div class="head-nav-container">
		<label class="head-nav-title">Store Registor</label>
		<div class="head-nav-inner">
			<ul class="nav-col-ul">
				<li><a href="store.do">매장검색</a></li>
				<li><a href="store_join.do">매장등록</a></li>
				<li><a href="#">-</a></li>
				<li><a href="#">-</a></li>

			</ul>
		</div>
	</div>
	<div class="container">
	<div class="con">
        <!-- header -->
        <!-- wrapper -->
        
        
        <table class="store-info">
        <colgroup>
        	<col width="20%">
        	<col width="80%">
        </colgroup>
        	<tr>
        		<td><img src="resources/images/user.png"></td>
        		<td rowspan="2"><h1>${sessionScope.memberId } 님 환영합니다~</h1></td>
        	</tr>
        	<tr>
        		<td style="text-align: center">
        			<button class="profile-change-btn">프로필 사진변경</button>
        		</td>
        	</tr>
        </table>
        
        
        <div id="table-wrap">
            <!-- content-->
             <form name = "store_join_form" action="store_join.do" method="post" enctype="multipart/form-data">
            <table class="store-table">
            <colgroup>
            	<col width="30%">
            	<col width="15%">
            	<col width="5%">            	
            	<col width="30%">
            	<col width="15%">
            	
            </colgroup>
           
            	<tr><th colspan="5">가게상호명</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeName" placeholder="가게이름을 입력해주세요"></td>
            	</tr>
            	
            	<tr><th colspan="5">주소</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storePlace" placeholder="가게 주소를 입력해주세요"></td>
            	</tr>
            	
            	<tr><th colspan="5">전화번호</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeTel" placeholder="가게 전화번호를 입력해주세요"></td>
            	</tr>
            	<tr><th colspan="5">가게소개</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeContent" placeholder="소개글을 입력해주세요"></td>
            	</tr>
            	<tr><th colspan="5">이벤트</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeEvent" placeholder="이벤트를 입력해주세요"></td>
            	</tr>
            	<tr><th colspan="5">혜택</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeBenefit" placeholder="혜택을 입력해주세요"></td>
            	</tr>
            	
            	<tr><th colspan="5">메뉴 유형</th></tr>
            	<tr>
            		<td>
            			<select name = "storeCategory">
            				<option>한식</option>
            				<option>양식</option>
            				<option>중식</option>
            				<option>일식</option>
            			</select>
					</td>
            	</tr>
            	<tr><th colspan="5">가용인원</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" placeholder="가용인원수를 입력해주세요(숫자만입력)" name="storeMaxCount"></td>
            	</tr>
            	<tr><th colspan="5">가격대</th></tr>
            	<tr class="store-join-price">
            		<td><input class="min" type="text" placeholder="최소가격을 입력해주세요(숫자만입력)" name = "storeMinPrice"></td>

					<td>
						~ 
					</td>
					
					<td><input class="max" type="text" placeholder="최대가격을 입력해주세요(숫자만입력)" name="storeMaxPrice"></td>

            	</tr>
            	
            	<tr><th colspan="5">주차</th></tr>
            	<tr>
            		<td colspan="5">
            			<select name ="storeParking">
            				<option>유</option>
            				<option>무</option>
            			</select>
            		</td>
            	</tr>
            	
            	<tr><th colspan="5">웹사이트</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" placeholder="웹사이트 주소를 입력해주세요" name="storeWebSite"></td>
            	</tr>

            	<tr><th colspan="5">파일첨부</th></tr>
            	<tr>
            		<td colspan="5">
            		<input type="hidden" id="file-number" value="1">
            			<div class="file-selector-list">
            			</div>
            			<div>파일업로드는 최대 5개까지 가능합니다.</div>
            		</td>
            	</tr>
            
            </table>
			

	       <!-- JOIN BTN-->
	       <div class="btn_area">
	           <button type="button" id="btnJoin">
	               <span>변경하기</span>
	           </button>
	       </div>
		</form>
                

            

        </div> 
        <!-- wrapper -->
      </div>
 	</div>
   <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>