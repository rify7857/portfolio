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

		
	});
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
            		<td colspan="5"><input type="text" name = "storeName" placeholder="${vo.storeName }"></td>
            	</tr>
            	
            	<tr><th colspan="5">주소</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storePlace" placeholder="${vo.storePlace }"></td>
            	</tr>
            	
            	<tr><th colspan="5">전화번호</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeTel" placeholder="${vo.storeTel }"></td>
            	</tr>
            	<tr><th colspan="5">가게소개</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeContent" placeholder="${vo.storeContent }"></td>
            	</tr>
            	<tr><th colspan="5">이벤트</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeEvent" placeholder="${vo.storeEvent }"></td>
            	</tr>
            	<tr><th colspan="5">혜택</th></tr>
            	<tr>
            		<td colspan="5"><input type="text" name = "storeBenefit" placeholder="${vo.storeBenefit }"></td>
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
            		<td colspan="5"><input type="text" placeholder="${vo.storeMaxCount }" name="storeMaxCount"></td>
            	</tr>
            	<tr><th colspan="5">가격대</th></tr>
            	<tr class="store-join-price">
            		<td><input class="min" type="text" placeholder="${vo.storeMinPrice }" name = "storeMinPrice"></td>

					<td>
						~ 
					</td>
					
					<td><input class="max" type="text" placeholder="${vo.storeMaxPrice }" name="storeMaxPrice"></td>

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
            		<td colspan="5"><input type="text" placeholder="${vo.storeWebSite }" name="storeWebSite"></td>
            	</tr>

            	<tr><th colspan="5">파일첨부</th></tr>
            	<tr>
            		<td colspan="5">
            		<input type="hidden" id="file-number" value="1">
            			<div class="file-selector-list">
            			</div>
            			<div class="file-add">
							<input class="file-name-holder" id="file-name-holder-1" disabled="disabled"placeholder="${fileVO.suFile1 }">
							<label for="file-upload-1" class="file-label" id="file-label-1">+</label>
							<input type="file" class="file-upload" id="file-upload-1" name = "sFiles">
						</div>
						<div class="file-add">
							<input class="file-name-holder" id="file-name-holder-2" disabled="disabled" placeholder="${fileVO.suFile2 }">
							<label for="file-upload-2" class="file-label" id="file-label-2">+</label>
							<input type="file" class="file-upload" id="file-upload-2" name = "sFiles">
						</div>
						<div class="file-add">
							<input class="file-name-holder" id="file-name-holder-3" disabled="disabled" placeholder="${fileVO.suFile3 }">
							<label for="file-upload-3" class="file-label" id="file-label-3">+</label>
							<input type="file" class="file-upload" id="file-upload-3" name = "sFiles">
						</div>
						<div class="file-add">
							<input class="file-name-holder" id="file-name-holder-4" disabled="disabled" placeholder="${fileVO.suFile4 }">
							<label for="file-upload-4" class="file-label" id="file-label-4">+</label>
							<input type="file" class="file-upload" id="file-upload-4" name = "sFiles">
						</div>
						<div class="file-add">
							<input class="file-name-holder" id="file-name-holder-5" disabled="disabled" placeholder="${fileVO.suFile5 }">
							<label for="file-upload-5" class="file-label" id="file-label-5">+</label>
							<input type="file" class="file-upload" id="file-upload-5" name = "sFiles">
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