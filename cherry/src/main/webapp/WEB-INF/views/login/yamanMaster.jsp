<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YamanMaster</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);

body {
	background-image: url("/image/dndn852.jpg");
	background: linear-gradient(to right, #FFC7E8, white, #FFC7E8);
	height: 100%;
	margin: 0;
	padding: 0;
}

#container {
	text-align: center;
}

Button {
	-moz-box-shadow: inset 0px 1px 0px 0px #fbafe3;
	-webkit-box-shadow: inset 0px 1px 0px 0px #fbafe3;
	box-shadow: inset 0px 1px 0px 0px #fbafe3;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ff5bb0
		), color-stop(1, #ef027d));
	background: -moz-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background: -webkit-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background: -o-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background: -ms-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background: linear-gradient(to bottom, #ff5bb0 5%, #ef027d 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bb0',
		endColorstr='#ef027d', GradientType=0);
	background-color: #ff5bb0;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #ee1eb5;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #c70067;
}

Button:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ef027d
		), color-stop(1, #ff5bb0));
	background: -moz-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background: -webkit-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background: -o-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background: -ms-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background: linear-gradient(to bottom, #ef027d 5%, #ff5bb0 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ef027d',
		endColorstr='#ff5bb0', GradientType=0);
	background-color: #ef027d;
}

Button:active {
	position: relative;
	top: 1px;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	font-family: 'jeju Hallasan';
}

.tg td {
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
}

.tg th {
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
}

.tg .tg-adx7 {
	background-color: #ffcc67;
	text-align: center;
	vertical-align: top
}
</style>
</head>
<body>
	<div align="center">
		<h3>관리자페이지</h3>
	</div>
	<div align="left" style="padding-left: 15%;">
		<button onclick="location.href='http://192.168.56.115:8890/cherry/logout'">로그아웃</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="location.href='http://192.168.56.115:8890/cherry/excelDownload'">회원 액셀 다운로드</button>
		&nbsp;&nbsp;
		<button onclick="location.href='http://192.168.56.115:8890/cherry/board'">불만게시판</button>
	</div>

	<div id=container align="left" style="padding-left: 15%;">
		<div style="padding-top: 50px;">
			<table border="2" bordercolor="red" class="tg">
				<tr>
					<th class="tg-adx7">총 가입자</th>
					<th class="tg-adx7">탈퇴자</th>
					<th class="tg-adx7">현재 회원</th>
				</tr>
				<tr>
					<td>${yamanCount.count}</td>
					<td>${yamanExitCount.count }</td>
					<td>${resultCount }</td>
				</tr>
			</table>

		</div>
		<br />
		<div id="list">
			<table border="2" bordercolor="red" width="800px;" class="tg">
				<tr>
					<th class="tg-adx7">야만인 번호</th>
					<th class="tg-adx7">야만인 이름</th>
					<th class="tg-adx7">야만인 이메일</th>
					<th class="tg-adx7">부족퇴출여부</th>
					<th class="tg-adx7">부족가입일</th>
				</tr>
				<c:forEach var="yamanin" items="${MasterList }">
					<tr>
						<td>${yamanin.yaman_id }</td>
						<td>${yamanin.yname }</td>
						<td>${yamanin.yemail }</td>
						<td>${yamanin.yexit }</td>
						<td>${yamanin.yreg }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>


</body>
</html>