<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function send(){
		alert("이메일로 답변드리겠습니다.");		
	}
	function sure_content() {
		if (('#sendOk').val = '완료') {
			alert("이 내용이 맞습니까?");
			$('#sendOk').val('수정');
			$('#ysubject').attr("readonly", true);
			$('#ycontent').attr("readonly", true);
			$('#sendOk').attr("onClick", "no_content();");
			$('#send').show();
		}
	}
	function no_content() {
		if (('#sendOk').val = '수정') {
			alert("수정하십시오");
			$('#sendOk').val('완료');
			$('#ysubject').attr("readonly", false);
			$('#ycontent').attr("readonly", false);
			$('#sendOk').attr("onClick", "sure_content();");
			$('#send').hide();
		}
	}
</script>
<style type="text/css">
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

	<div class="container">
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info" data-toggle="modal"
			data-target="#boardSender">불만 신고</button>

		<!-- Modal -->
		<div class="modal fade" id="boardSender" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">불만 신고</h4>
					</div>
					<div class="modal-body">
						<form action="/write" method="post">
							<div class="" align="right"
								style="padding-top: 5%; padding-right: 20%;">
								<h2>불편사항을 적어주세요</h2>
								<table border="1" style="border-color: red;">
									<tr>
										<td width="100px;" align="center">제목</td>
										<td><input type="text" id="ysubject" name="ysubject"
											style="width: 100%; background-color: transparent;border: 0px;"></td>
									</tr>
									<tr>
										<th colspan="2"><textarea rows="20"
												style="width: 100%; background-color: transparent;border: 0px;resize: none; wrap:hard;"
												id="ycontent" name="ycontent"></textarea></th>
									</tr>
								</table>
							</div>
							<div align="right" style="padding-right: 20%;">
								<button type="submit" id="send" name="send" onclick="send();" style="display: none;">보내기</button>
								<button type="button" id="sendOk" name="sendOk"
									onClick="sure_content();">완료</button>

							</div>
							<%-- <input type="hidden" id="yaman_id" name="yaman_id" value="${logindto.yaman_id}"> --%>
							<input type="hidden" id="yaman_id" name="yaman_id" value="4">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="location.href='/writeBack'">취소하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>