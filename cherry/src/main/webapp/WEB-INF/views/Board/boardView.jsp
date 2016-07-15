<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>야만인 게시판</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);

body {
	background-image: url("/image/dndn852.jpg");
	background: linear-gradient(to right, #FFC7E8, white, #FFC7E8);
	height: 100%;
	margin: 0;
	padding: 0;
}

table {
	font-family: 'jeju Hallasan';
}

td, tr, a, span, p, h1, th, input, textarea {
	font-family: 'Jeju Hallasan';
	outline: none;
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
</style>
</head>
<body>
	<form action="http://192.168.56.115:8890/cherry/yboardDel" method="post">
		<div class="SelectOne" align="right"
			style="padding-top: 5%; padding-right: 35%;">
			<table border="1"
				style="border-color: red; width: 600px; text-align: center;"
				class="tg">
				<tr>
					<th class="tg-adx7">이메일</th>
					<th class="tg-adx7">제목</th>
					<th style="width: 100px;" class="tg-adx7">작성날짜</th>
				</tr>
				<tr>
					<td>${SelectOne.yemail }</td>
					<td>${SelectOne.ysubject }</td>
					<td>${SelectOne.yregdt }</td>
				</tr>
				<tr>
					<th colspan="4"><textarea rows="20"
							style="width: 600px; background-color: transparent; resize: none; wrap: hard; border: 0px;"
							readonly="readonly">${SelectOne.ycontent }</textarea></th>
				</tr>
			</table>
			<input type="hidden" id="yboard_id" name="yboard_id"
				value="${SelectOne.yboard_id }">
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">메일로 답변보내기</button>
			<button type="submit">답변완료</button>
			<button type="button"
				onclick="location.href='http://192.168.56.115:8890/cherry/viewBack'">리스트</button>
		</div>
	</form>




	<!-- Modal -->


	<div class="modal fade" id="myModal" role="dialog" >
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">답변보내기</h4>
				</div>
				<form action="http://192.168.56.115:8890/cherry/email" method="post">
					<div class="" align="center" style="padding-top: 5%;">
						<h2>답변보내기</h2>
						<div align="center"
							style="width: 500px; height: 500px; font-size: 30px; box-shadow: 0px 0px 15px #cecece; border: 1px solid #e0e0e0;">
							<div
								style="box-shadow: 0px 0px 15px #cecece; border: 1px solid #e0e0e0;">
								<p style="display: inline;" align="left">제목:</p>
								<input type="text" id="answer_title" name="answer_title"
									value="re: ${SelectOne.ysubject }"
									style="width: 400px; background-color: transparent; border: 0px; display: inline-block;">
							</div>
							<div>
								<textarea rows="10"
									style="width: 100%; height: 450px; background-color: transparent; border: 0px; resize: none; wrap: hard;"
									id="answer" name="answer">re: ${SelectOne.ycontent } 
											불편사항에 대한 답변입니다. </textarea>
							</div>
						</div>
					</div>

					<div align="right" style="padding-right: 20%;padding-top: 10px;">
						<button type="submit" id="send" name="send">이메일 보내기</button>

						<input type="hidden" id="answer_yaman_id" name="answer_yaman_id"
							value="4">
				<button type="button" data-dismiss="modal">취소하기</button>
					</div>
					<input type="hidden" id="yboard_id" name="yboard_id"
						value="${SelectOne.yboard_id }"> <input type="hidden"
						id="yemail" name="yemail" value="${SelectOne.yemail }">
				</form>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src=<c:url value="/resources/js/board.js"/>></script>

</body>
</html>