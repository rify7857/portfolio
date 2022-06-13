<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 일반회원 상세페이지</title>
<link href="/f5/resources/css/admin/member/member_content.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
		<div class="container">
			<div class="row">
				<div id="content">
					<h4>관리자 | 일반회원 상세페이지</h4>
					<table id="content_table">
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
								<select id="pwHint" name="memberPassHint" disabled="disabled">
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
								<select id="gender" name="memberGender" disabled="disabled">
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
							<td><input type="text" id="tel" name="memberTel" readonly="readonly"
							value="${ vo.memberTel }"></td>
						</tr>
						<tr>
							<td><label>본인확인 이메일</label></td>
						</tr>
						<tr>
							<td><input type="text" id="email" name="memberEmail" readonly="readonly"
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
						<a href="member_update.do?id=${ vo.memberId }"><button type="button" class="update">수정</button></a>
						<a href="member_delete.do?id=${ vo.memberId }"><button type="button" class="delete">삭제</button></a>
						<a href="member_list.do"><button type="button" class="list">목록</button></a>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>