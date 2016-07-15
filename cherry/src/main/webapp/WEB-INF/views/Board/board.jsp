<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);

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

h2 {
	text-align: center;
}

body {
	background: linear-gradient(to right, #FFC7E8, white, #FFC7E8);
	height: 100%;
	margin: 0;
	padding: 0;
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
<title>사용자 불평 게시판</title>

</head>
<div style="padding-top: 50px;">
	<h2>사용자 불평 게시판</h2>
</div>
	<div align="right" style="padding-top: 5%; padding-right: 35%;">
		<div style="padding-bottom: 50px;">
			<button onclick="location.href='http://192.168.56.115:8890/cherry/Master'">관리자 페이지</button>
			<button onclick="location.href='http://192.168.56.115:8890/cherry/logout'">로그아웃</button>

		</div>
		<table border="1"
			style="border-color: red; width: 600px; text-align: center;"
			class="tg">
			<tr>
				<th class="tg-adx7" width="70px;">번호</th>
				<th class="tg-adx7" scope="row">이메일</th>
				<th class="tg-adx7" scope="row">제목</th>
				<th class="tg-adx7" style="width: 100px;">작성날짜</th>
			</tr>
			<c:forEach var="board" items="${boardList }" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${board.yemail }</td>
					<td><a href="http://192.168.56.115:8890/cherry/boardView/${board.yboard_id}">${board.ysubject }</a></td>
					<td>${board.yregdt }</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
	</div>
</body>
</html>
