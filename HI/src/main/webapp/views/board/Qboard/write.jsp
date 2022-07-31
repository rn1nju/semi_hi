<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />


<link rel="stylesheet" href="${ path }/resources/css/Qcss/Qcss.css">

<nav class="navbar navbar-light bg-light">

	<a class="navbar-brand" href="#"> <img
		src="C:\Users\kh\Desktop\semi\logo.png" alt="" width="130" height="70">
	</a>
	<div class="main1">
		<button class="main2">회원가입</button>
		<button class="main3">로그인</button>
	</div>
</nav>
<div class="board_wrap">
	<div class="board_title">
		<strong>건의하기</strong>
	</div>
	<div class="board_write_wrap">
		<div class="board_write">

			<div class="reason">
				<dl>
					<dt>사유</dt>
					<dd>
						<select name="" id="">
							<option selected>사유를 선택해 주세요.</option>
							<option value="">버그/오류</option>
							<option value="">불량유저</option>
							<option value="">기타</option>
						</select>
					</dd>
				</dl>
			</div>

			<div class="title">
				<dl>
					<dt>제목</dt>
					<dd>
						<input type="text" placeholder="제목 입력">
					</dd>
				</dl>
			</div>

			<div class="email">
				<dl>
					<dt>이메일</dt>
					<dd>
						<input type="text" placeholder="이메일 입력">
					</dd>
				</dl>
			</div>

			<div class="cont">
				<textarea placeholder="내용 입력"></textarea>
			</div>

			<div class="addfile">
				<dl>
					<dt>첨부파일</dt>
					<dd>
						<input type="file">
					</dd>
				</dl>
			</div>

		</div>

		<div class="bt_wrap">
			<a href="#" class="on">전송</a> <a href="#">취소</a>
		</div>
	</div>
</div>

