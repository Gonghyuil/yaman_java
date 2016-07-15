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
table{
font-family: 'jeju Hallasan';
}
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg .tg-adx7{background-color:#ffcc67;text-align:center;vertical-align:top
}
Button {
	-moz-box-shadow:inset 0px 1px 0px 0px #fbafe3;
	-webkit-box-shadow:inset 0px 1px 0px 0px #fbafe3;
	box-shadow:inset 0px 1px 0px 0px #fbafe3;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ff5bb0), color-stop(1, #ef027d));
	background:-moz-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background:-webkit-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background:-o-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background:-ms-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background:linear-gradient(to bottom, #ff5bb0 5%, #ef027d 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bb0', endColorstr='#ef027d',GradientType=0);
	background-color:#ff5bb0;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #ee1eb5;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #c70067;
}
Button:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ef027d), color-stop(1, #ff5bb0));
	background:-moz-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background:-webkit-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background:-o-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background:-ms-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background:linear-gradient(to bottom, #ef027d 5%, #ff5bb0 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ef027d', endColorstr='#ff5bb0',GradientType=0);
	background-color:#ef027d;
}
Button:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body>
	<form action="/yboardDel" method="post">
		<div class="SelectOne" align="right"
			style="padding-top: 5%; padding-right: 35%;">
			<table border="1" style="border-color: red; width: 600px;text-align: center;" class="tg">
				<tr>
					<th class="tg-adx7">번호</th>
					<th class="tg-adx7">>이메일</th>
					<th class="tg-adx7">>제목</th>
					<th style="width: 100px;" class="tg-adx7">>작성날짜</th>
				</tr>
				<tr>
					<td>${SelectOne.yboard_id }</td>
					<td>${SelectOne.yemail }</td>
					<td>${SelectOne.ysubject }</td>
					<td>${SelectOne.yregdt }</td>
				</tr>
				<tr>
					<th colspan="4"><textarea rows="20"
							style="width: 600px; background-color: transparent; resize: none; wrap:hard;border: 0px;"
							readonly="readonly">${SelectOne.ycontent }</textarea></th>
				</tr>
			</table>
		<input type="hidden" id="yboard_id" name="yboard_id" value="${SelectOne.yboard_id }">
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">메일로 답변보내기</button>
			<button type="submit">삭제</button>
			<button type="button" onclick="location.href='/viewBack'">리스트로</button>
		</div>
	</form>




	<!-- Modal -->


	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">답변보내기</h4>
				</div>

				<div class="modal-body">
					<form action="/email" method="post">
						<div class="" align="right"
							style="padding-top: 5%; padding-right: 20%;">
							<h2>답변보내기</h2>
							<table border="1" style="border-color: red;">
								<tr>
									<td width="100px;" align="center">제목</td>
									<td><input type="text" id="answer_title"
										name="answer_title"
										style="width: 100%; background-color: transparent;border: 0px;"
										value="re: ${SelectOne.ysubject }"></td>
								</tr>
								<tr>
									<th colspan="2"><textarea rows="20"
											style="width: 100%; background-color: transparent;resize: none; wrap:hard;border: 0px;"
											id="answer" name="answer">re: ${SelectOne.ycontent } 
											불편사항에 대한 답변입니다. 
											</textarea></th>
								</tr>
							</table>
						</div>
						<div align="right" style="padding-right: 20%;">
							<input type="submit" value="이메일 보내기" id="send" name="send">

						</div>
						<%-- <input type="hidden" id="answer_yaman_id" name="answer_yaman_id" value="${logindto.yaman_id}"> --%>
						<input type="hidden" id="answer_yaman_id" name="answer_yaman_id" value="4"> 
							<input type="hidden" id="yboard_id" name="yboard_id" value="${SelectOne.yboard_id }">
							 <input type="hidden" id="yemail" name="yemail" value="${SelectOne.yemail }">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="location.href='/writeBack'">취소하기</button>
				</div>
			</div>
		</div>
	</div>




</body>
</html>