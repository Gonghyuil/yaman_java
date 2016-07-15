<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="srping" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Pacifico);
html {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	background-image: url("../image/dndn852.jpg"); 
	background: linear-gradient(to right, #FFC7E8, white, #FFC7E8);
	height: 100%;
	margin: 0;
	padding: 0;
}

h2 {
font-family: 'Pacifico', cursive;
	font-size: 100px;
	color: #AB3C39;
}

.loginform {
	padding-top: 10%;
}

.imgsrc {
	float: left;
	width: 30%;
	padding-right: 10px;
}

.right-box {
	float: right;
	width: 70%;
}

.modal-header, h4, .close {
	background-color: #FFC7E8;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

.modal-body {
	text-align: left;
}

.form-group {
	size: width=100px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	if($("#login_ok").val() == "no"){
		alert("로그인실패");
		alert("이메일과 비밀번호를 확인하세요");
	}
});

</script>
</head>
<body>
	<!-- 로그인 홈 -->
	<div id="home" class="container" align="center">
		<div class="loginform" style="width: 450px;">
			<form action="/cherry/login" id="loginForm" method="post">
				<h2>Yaman</h2>
				<div class="form-group col-xd-4" style="padding-top: 15%;">
					<label for="usrname"> <span
						class="glyphicon glyphicon-envelope"></span> Email
					</label><input type="text" class="form-control" id="yemail" name="yemail"
						placeholder="Enter email">
				</div>
				<div class="form-group col-xd-4" style="padding-top: 5%;">
					<label for="psw"><span class="glyphicon glyphicon-eye-open"></span>
						Password</label> <input type="password" class="form-control" id="ypass" name="ypass"
						placeholder="Enter password" maxlength="16" required>
				</div>
				<div class="checkbox">
					<label><input type="checkbox" id="checkbox" value=""
						checked>Remember Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">Find Password</a>
				</div>
				
			
				<button type="submit" class="btn btn-info">로그인</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-info" id="myBtn">회원가입</button>
			</form>
		</div>
		<input type="text" value="${message}" id="login_ok" style="visibility: hidden;">

	<!-- 회원가입 모달창 -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog" style="width: 750px;">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 0px 50px;">
						<h4>회원가입</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="insertform" name="insertform" >
							<div class="imgsrc">
								<label for="hiddenInput">profile photo<br /> 
									<img class="img-thumbnail" alt="Select Image" style="width: 220px; height: 260px;" id="yimage">
								</label> <br>
								<br>
							</div>
							<div class="right-box">
								<div class="form-group">
									<label for="signUp_yemail">
										<span class="glyphicon glyphicon-envelope"></span> Email
									</label> 
									<input type="text" class="form-control" name="signUp_yemail" id="signUp_yemail" placeholder="Enter email">
								</div>
								<button type="button" class="btn btn-info" id="numbtn">인증하기</button>
								<div class="form-group">
									<label for="ypass">
										<span class="glyphicon glyphicon-eye-open"></span> Password
									</label> 
									<input type="password" class="form-control" name="ypass" id="signUpypass" placeholder="Enter password" maxlength="16" required>
								</div>
								<div class="form-group">
									<label for="ypass2">
										<span class="glyphicon glyphicon-eye-open"></span> confirmPass
									</label> 
									<input type="password" class="form-control" name="confirmPass" id="confirmPass" placeholder="Enter password" maxlength="16" required>
								</div>
								<div class="form-group">
									<label for="yname">NAME</label> 
									<input type="text" class="form-control" name="yname" id="yname" placeholder="Enter name">
								</div>
								<div class="form-group">
									<label for="ybirth">BirthDay</label><br /> 
									<input type="date" name="ybirth" id="ybirth">
								</div>
								</div>
								<div class="form-group">
									<label for="yphone">Phone</label>
									<p>'-' 제외하고 입력하시오.</p>
									<input type="text" class="form-control" name="yphone" id="yphone" placeholder="Enter phone">
								</div>
								<div class="form-group">
									<label for="ycompany">Company</label>
									<input type="text" class="form-control" name="ycompany" id="ycompany" placeholder="Enter company">
								</div>
								<div class="form-group">
									<label for="yschool">School</label>
									<input type="text" class="form-control" name="yschool" id="yschool" placeholder="Enter school">
								</div>
								<div class="form-group">
									<label for="yhello">hello!</label>
									<textarea class="form-control" rows="5" name="yhello" id="yhello" placeholder="Enter hello"> </textarea>
								</div>
								<input type="hidden" id="imgsrc">
								<input type="hidden" id="ycheck_check">
						</form><!--form  -->
					</div>
					<div class="modal-footer" style="padding: 0px 50px;">
						<button class="btn btn-success btn-block" style="color: #FFC7E8; width: 200px;" id="sign_up">
								<span class="glyphicon glyphicon-off"></span> 회원가입 완료
						</button>
						<button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>취소
						</button> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--사진 전송  -->
	<form id="hiddenform" name="hiddenform" method="post"
		enctype="multipart/form-data" style="display: none;">
		<input type="hidden" id="imgEmail" name="imgEmail">
		<input type="file" name="hiddenInput" id="hiddenInput">
		
	</form>

	<!--인증을 위한 모달-->
 <div class="modal fade" id="signup" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">이메일 인증</h4>
        </div>
        <div class="modal-body">
      		<div class="form-group">
		      <label for="ycheck_id">인증 받을 이메일을 입력하여 주십시오.</label>
		      <input type="text" class="form-control" id="ycheck_id">
    		</div>
    		<div class="form-group">
		      <label for="ynum">인증 번호를 입력해 주세요</label>
		      <input type="text" class="form-control" id="ynum">
    		</div>
    		<button type="button" class="btn btn-danger" id="reqCheckNum">인증번호발송</button>
        </div>
        <div class="modal-footer">
        	<button type="button" class="btn btn-danger" id="numCheck">인증 완료</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
 <!--이메일 인증부분  -->
<script>
$(document).ready(function(){
    $("#numbtn").click(function(){
        $("#signup").modal();
    });
});
/*인증 메일 보내기*/
		$("#reqCheckNum").on("click",function(){
			$.ajax({
				url: "http://localhost:8890/cherry/singupemail",
				type: "post",
				data: "ycheck_id="+$("#ycheck_id").val(),
				success: function(data){
					alert("인증메일이 발송되었습니다.");
					alert(data);
					
				},
				error : function(data){
					alert("이메일 발송에 실패하였습니다. 이메일 형식에 맞게 작성하여 주십시오.");
				}
			});
		});
	 $("#numCheck").on("click",function(){
		$.ajax({
			url: "http://192.168.56.115:8890/cherry/emailCheck",
			type: "post",
			dataType:'json',
			contentType: "application/json",
			data: JSON.stringify({
				"ycheck_id" : $("#ycheck_id").val(),
				"ynum" : $("#ynum").val()
			}),
			success: function(data){
				alert("인증에 성공");
				$("#numbtn").text("인증완료");
				$("#ycheck_check").val(data);
			}
		});
	}); 
</script>
<!--이메일 인증 끝  -->

<!--회원가입  -->
<script>

	 $("#sign_up").on("click", function(){

		$.ajax({
			url: "http://192.168.56.115:8890/cherry/sign_up",
			contentType: "application/json",
			data : JSON.stringify({
					"ybirth"	: $("#ybirth").val(),							
					"ycompany"	: $("#ycompany").val(),		
					"yemail"	: $("#signUp_yemail").val(),
					"yhello"	: $("#yhello").val(),
					"yname" 	: $("#yname").val(),
					"yphone"	: $("#yphone").val(),
					"yreg"		: $("#yreg").val(),
					"yschool"	: $("#yschool").val(),
					"ypass"		: $("#signUpypass").val(),
					"ycheck_check" :$("ycheck_check").val()
			}),
			dataType : 'json',	
			type: 'POST',
			success: function(data){
				$("#imgEmail").val(data.yemail);
				var form = new FormData(document.getElementById('hiddenform'));
				alert(form);
				alert($("#imgEmail").val());
				//회원가입에 성공할때 사진 저장
				$.ajax({
					url : "signUpImg",
					type : "post",
					datatype : "text",
					data : form,
					cache : true,
					processData : false,
					contentType : false,
					success : function(data) {
						alert("성공");
					},
					error : function(date) {
						alert(data);
					}
				}); 
			}
		});
	});
</script>



<script type="text/javascript">
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal({
				backdrop : "static"
			});
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#yimage').attr('src', e.target.result);
				$('#yimage').show();
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$("#hiddenInput")
			.change(
					function() {
						/* 파일 확장자 검증 */
						var fileName = $("#hiddenInput").val();
						var fileExt = fileName.substring(fileName
								.lastIndexOf('.') + 1);
						var reg = /gif|jpg|png/i;
						if (reg.test(fileExt) == false) {
							swal("Error", "jpg, gif, png 파일만 가능합니다.");
							return;
						}
						/* 파일 크기 검증 */
						var maxSize = 5 * 1024 * 1024;
						var fileSize = document.getElementById('hiddenInput').files[0].size;
						if (fileSize >= maxSize) {
							swal("Error", "5Mb 까지 업로드가 가능합니다.");
							return;
						}
						/* 정보입력 폼에 파일명을 입력한다. */
						document.insertform.imgsrc.value = fileName
								.substring(fileName.lastIndexOf('\\') + 1);
						readURL(this);
					});
</script>
</body>
</html>
