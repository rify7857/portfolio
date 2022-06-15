<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>

<link href="/f5/resources/css/board/board_write.css" rel="stylesheet" />
<link href="/f5/resources/css/head_nav.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<script src="/f5/resources/js/board/board.js"></script>
<script>
	
	$(document).ready(function() {
		
		
		$(".board_write").click(function() {
			var title = $("#board_title").val();
			var content = $("#board_content").val();
			
			if(title == "") {
				alert("제목을 입력해주세요");
				$("#board_title").focus();
				return;
			} else if(content == "") {
				alert("내용을 입력해주세요");
				$("#board_content").focus();
				return;
			} else {
				content = content.replace(/(?:\r\n|\r|\n)/g, '<br>');
				boardWrite.submit();
			}
		});
		
		$(".board_list").click(function(){
			location.href=("board_list.do");
		});
		
		$("#file").on('change',function(){
		  	
			$(".upload-name").val("");
			
			var files = $("input[name='files']")[0].files;
			
			if(files.length > 5) {
				alert("파일은 5개까지 등록할 수 있습니다.");
				return;
			} else {
				if( files.length != 5 ) {
					var inputFile = "";
					for(var i = 0; i<5-files.length; i++) {
						inputFile += "<input type='file' name='files'>";
						
					}
					$(".filebox").append(inputFile);
					
				}
				for(var i = 0; i<files.length; i++) {
					
					$("#file"+i).val(files[i].name);
					
				}			
			}
			
		});
		
		
		
		
	});

</script>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="head-nav-container">
		<label class="head-nav-title">Free Board</label>
		<div class="head-nav-inner">
			<ul class="nav-col-ul">
				<li><a href="board_list.do">자유게시판</a></li>
				<li><a href="promote_list.do">홍보</a></li>
				<li><a href="news_list.do">뉴스</a></li>
				<li><a href="#"></a></li>
				<li><a href="#"></a></li>
			</ul>
		</div>

	</div>
	<div class="container">
		<div class="row">
		<label class="board-caption">Foodly의 대나무 숲</label>
			<div id="content">
				<h4 id = "text1">게시글 등록</h4>
				<form action="board_write.do" method="post" name="boardWrite" enctype="multipart/form-data">
				<input type="hidden" name="memberId" value="${sessionScope.memberId }">
				<table class="board_table">
					<tr>
						<td><label id = "text2">제 목</label></td>
					</tr>
					<tr>
						<td><input type="text" id="board_title" name="boardTitle" placeholder="제목을 입력해주세요."></td>
					</tr>
					<tr>
						<td><label id = "text2">내 용</label></td>
					</tr>
					<tr>
						<td><textarea rows="10" id="board_content" name="boardContent" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td><label id = "text2">파일첨부</label></td>
					</tr>
					<tr>
						<td>
							<div class="filebox">
							    <input id="file0" class="upload-name" type="text" placeholder="첨부파일">
							    <label for="file">파일찾기</label> 
							    <input type="file" id="file" name="files" multiple="multiple">
							    <input id="file1" class="upload-name" type="text" placeholder="첨부파일">						    
							    <input id="file2" class="upload-name" type="text" placeholder="첨부파일">						    
							    <input id="file3" class="upload-name" type="text" placeholder="첨부파일">						    
							    <input id="file4" class="upload-name" type="text" placeholder="첨부파일">						    
							</div>
							<div>파일업로드는 최대 5개까지 가능합니다.</div>
						</td>
					</tr>
				</table>
				<div class="board_btn">
					<button type="button" class="board_write" >작성완료</button>
					<button type="button" class="board_list">되돌아가기</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<br>
        
        <!-- Footer-->
	<jsp:include page="../footer.jsp"></jsp:include><br>
        <!-- Bootstrap core JS-->
<!--          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
        <!-- Core theme JS-->

</body>
</html>