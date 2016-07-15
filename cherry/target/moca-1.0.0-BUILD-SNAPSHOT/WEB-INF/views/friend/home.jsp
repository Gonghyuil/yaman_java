<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>친구</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<script>
    /* 친구모달 function  */
	function detail(yface, yname, yschool, ycompany, yphone, yemail, yhello, yok, yaman_id){
		$("#myFriendModal").modal();
		
		$("#face").val(yface);
		$("#name").val(yname);
		$("#school").val(yschool);
		$("#company").val(ycompany);
		$("#phone").val(yphone);
		$("#email").val(yemail);
		$("#hello").val(yhello);
		$("#ok").val(yok);
		$("#id").val(yaman_id);
		/* 상대방이 로그인 상태일때만 채팅 이용 가능 */
		if(yok == 1){
			$("#chat_btn").css("display", "inline-block");
		}else if(yok == 0){
			$("#chat_btn").css("display", "none");
		} 
    } 
		
    /* 절교하기 버튼 */
    $(document).ready(function(){
    	$("#breakFriend").on("click", function(){
    		$("#breakFriendModal").modal();
	    		$("#byeFd").on("click", function(){
	    			var msg = $("#brkFd").val();
	    			//var yface = $("#face").val();
	    			//var yname = $("#name").val();
	    			//var yschool = $("#school").val();
	     			//var ycompany = $("#company").val();
	    			//var yphone = $("#phone").val();
	    			//var yemail = $("#email").val();
	    			//var yhello = $("#hello").val();
	    			//var yok = $("#ok").val();
	    			var yaman_me = $(".myId").text();//내 아이디
	    			var yaman_friend = $("#id").val();//친구의 아이디
	    			
	    			$.ajax({
	    				url : "breakFriend",
	    				type : "post",
	    				dataType : 'json',
	    				contentType : "application/json",
	    				data : JSON.stringify({
				 			"msg"   : $("#brkFd").val() ,
				 			"yaman_one" : $(".myId").text() ,
				 			"yaman_two" : $("#id").val()
	    				}) ,
	    				success : function(data){
		 					window.location.reload();
	    				}
	    			});
	    		});
    	});
    });
	
	/* 절교메세지가 있을때 버튼의 색을 변경 */    
    $(document).ready(function(){
    	var msg = $(".brk_msg").text();
    	if(msg != ""){
	    	$("#brkMsgBtn").on("click", function(){
	    		$("#brkMsgModal").modal();
	    		$("#brkMsgText").val(msg);
	    	});
    	}else{
    		$("#brkMsgBtn").css("display", "none");
    	}
    	
    	$("#chk_msg").on("click", function(){
    		$.ajax({
    			url : "chk_msg",
    			type : "post",
	   			dataType : 'json',
	   			contentType : "application/json",
	   			data :JSON.stringify({
	   		 		"readmsg"   : $(".brk_read_msg").text() 
	   		 		}) ,
	   		 	success : function(searchFriendAddList){
	   				
	   		 	}
    		});
    	});
    	
    });
	
	
   $(function(){
		$("body").on("click","tr.detail_data",function(){
			
			var yface = $(this).find(".yface").text();
			var yname = $(this).find(".yname").text();
			var yschool = $(this).find(".yschool").text();
			var ycompany = $(this).find(".ycompany").text();
			var yphone = $(this).find(".yphone").text();
			var yemail = $(this).find(".yemail").text();
			var yhello = $(this).find(".yhello").text();
			var yok = $(this).find(".yok").text();
			var yaman_id = $(this).find(".yaman_id").text();
			detail(yface,yname, yschool, ycompany, yphone, yemail, yhello, yok, yaman_id);
			
		}); 
   });
   
 
   
   $(document).ready(function(){
   /* 내 정보 모달 */
	   $(".myInfo").on("click", function(){
		  $("#myModal").modal();
		  
		  var yaman_id = $(this).find(".myId").text();
		  var yface = $(this).find(".myFace").text();
		  var yname = $(this).find(".myName").text();
		  var yschool = $(this).find(".mySchool").text();
		  var ycompany = $(this).find(".myCompany").text();
		  var yphone = $(this).find(".myPhone").text();
		  var yemail = $(this).find(".myEmail").text();
		  var yhello = $(this).find(".myHello").text();
		  
		  $("#myId").val(yaman_id);
		  $("#myFace").val(yface);
		  $("#myName").val(yname);
		  $("#mySchool").val(yschool);
		  $("#myCompany").val(ycompany);
		  $("#myPhone").val(yphone);
		  $("#myEmail").val(yemail);
		  $("#myHello").val(yhello);
	   }); 
   		/* 내정보를 수정할 수 있는 모달 */
	   $("#myInfoUpdate").on("click", function(){
		   	$("#myUpdateModal").modal();
		   	var yface = $(".myInfo").find(".myFace").text();
		   	var yname = $(".myInfo").find(".myName").text();
		   	var yschool = $(".myInfo").find(".mySchool").text();
		   	var ycompany = $(".myInfo").find(".myCompany").text();
		   	var yphone = $(".myInfo").find(".myPhone").text();
		   	var yemail = $(".myInfo").find(".myEmail").text();
		   	var yhello = $(".myInfo").find(".myHello").text();
		   	
		    $("#UpdateFace").val(yface);
			$("#UpdateName").val(yname);
			$("#UpdateSchool").val(yschool);
			$("#UpdateCompany").val(ycompany);
			$("#UpdatePhone").val(yphone);
			$("#UpdateEmail").val(yemail);
			$("#UpdateHello").val(yhello);
			
			$("#myUpdateModal input").css("border" , "2px solid orange");
	   	
			 /* 내 정보를 수정 후 버튼을 누르면 값을 update하는 ajax */
			$("#updateYaman").on("click", function(){
				$.ajax({
					url : "myInfo/update",
				 	type : "post",
				 	dataType : 'json',
				 	contentType : "application/json",
				 	data : JSON.stringify({
				 			"yface"   : $("#UpdateFace").val() ,
				 			"yname"   : $("#UpdateName").val() ,
				 			"yschool" : $("#UpdateSchool").val() ,
				 			"ycompany": $("#UpdateCompany").val() ,
				 			"yphone"  : $("#UpdatePhone").val() ,
				 			"yemail"  : $("#UpdateEmail").val() ,
				 			"yhello"  : $("#UpdateHello").val() 
				 			}) ,
				 	success : function(myUpdateInfo){
				 	
				 	}
				});
				window.location.reload();
			}); 
	   });
   });
   
  
   /* 친구추가 탭에 검색시 모달창으로 검색된 값을 넘겨주는 함수=============================================== */
   $(document).ready(function(){
	   
	   $("#searchNameBtn").on("click", function(){
		   var param = $("#searchYname").val();
		  search(param); 
	   });
	   
	   $("#searchSchoolBtn").on("click", function(){
		   var param = $("#searchYschool").val();
		   search(param); 
	   });
      
	   
   	   
	   function search(param){
		   $.ajax({
			 url : "add",
			 type : "post",
			 dataType : 'json',
			 contentType : "application/json",
			 data :JSON.stringify({
		 			"yname"   : $("#searchYname").val() ,
		 			"yschool" : $("#searchYschool").val() ,
		 			"ycompany": $("#searchYcompany").val() ,
		 			"yphone"  : $("#searchYphone").val() ,
		 			"yemail"  : $("#searchYemail").val() 
		 			}) ,
		 	success : function(searchFriendAddList){
			  $("#add_friend").tab("show");
			  
		 	}, fail : function() {
				alert("FAIL");
			}, error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		  });
	   }
  
   });
   
	/* tab창 - css */
	$(document).ready(function(){
	    $(".nav-tabs a").click(function(){
	        $(this).tab('show');
	    });
	});
	
	/* 친구 검색 */
	/*/cherry/myFriend/search/1*/
	$(document).ready(function(){
		$("#searchName").keyup(function(){
			/* console.log("start"); */
			$.ajax({
				url : "search/1",
				type : "post",
		
				data : {"searchName" : $("#searchName").val()},
				success : function(data){
				
					var content = "<table class='table'>";
					for(var i = 0 ; i < data.length ; i++){
						
						if(data[i].yok == '1'){
							content += '<tbody class="table">';
							content += '<tr id='+data[i].yaman_id+' style="background-color: skyblue;" class="detail_data">';  
							
							content += '<td>'+data[i].yface 
							content += '<span class="yface" style="display:none">'+data[i].yface+'</span>'; 
							content += '<span class="yname" style="display:none">'+data[i].yname+'</span>';
							content += '<span class="yschool" style="display:none">'+data[i].yschool+'</span>';
							content += '<span class="ycompany" style="display:none">'+data[i].ycompany+'</span>';
							content += '<span class="yphone" style="display:none">'+data[i].yphone+'</span>';
							content += '<span class="yemail" style="display:none">'+data[i].yemail+'</span>';
							content += '<span class="yok" style="display:none">'+data[i].yok+'</span>';
							content += '<span class="yhello" style="display:none">'+data[i].yhello+'</span>';
							content += '<span class="yaman_id style="display:none">'+data[i].yaman_id+'</span>';
							
							content += '</td>';
							content += '<td>'+data[i].yname+'</td>';
							content += '<td>'+data[i].yhello+'</td>';
							content += '</tr>';
							content += '</tbody>';
						}else if(data[i].yok == '0'){
							content += '<tbody>';
							content += '<tr id='+data[i].yaman_id+' class="detail_data">';  
							
							content += '<td>'+data[i].yface
							content += '<span class="yface" style="display:none">'+data[i].yface+'</span>';
							content += '<span class="yname" style="display:none">'+data[i].yname+'</span>';
							content += '<span class="yschool" style="display:none">'+data[i].yschool+'</span>';
							content += '<span class="ycompany" style="display:none">'+data[i].ycompany+'</span>';
							content += '<span class="yphone" style="display:none">'+data[i].yphone+'</span>';
							content += '<span class="yemail" style="display:none">'+data[i].yemail+'</span>';
							content += '<span class="yhello" style="display:none">'+data[i].yhello+'</span>';
							content += '<span class="yok" style="display:none">'+data[i].yok+'</span>';
							content += '<span class="yaman_id style="display:none">'+data[i].yaman_id+'</span>';
							
							content += '</td>';
							content += '<td>'+data[i].yname+'</td>';
							content += '<td>'+data[i].yhello+'</td>';
							content += '</tr>';
							content += '</tbody>';
						}
						content += "</table>";
					}
					
					$("#friendInfo").html(content);
					
					
					
				}, fail : function() {
					alert("FAIL");
				}, error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			 });
		});
	}); 

	</script>
</head>

<body>
	<div class="container">
	  <ul class="nav nav-tabs">
	    <li class="active"><a href="#friend_list">친구목록</a></li>
	    <li><a href="#chat_room">채팅방</a></li>
	    <li><a href="#add_friend">친구추가</a></li>
	  </ul>
  <div class="tab-content">
    <div id="friend_list" class="tab-pane fade in active">
		<hr>
		<!-- 친구 검색 기능 -->
		<div>
			<input type="search" style="border: 1px solid gray;" placeholder="검색할 이름을 입력하세요." name="searchName" id="searchName" />
			<!-- 절교메세지 알림 버튼 -->
			<button type="button" class="btn btn-danger" id="brkMsgBtn" style="margin-left: 300px;  ">메세지</button>
			<!-- 절교 메세지  -->
			<span class="brk_msg" style="display: none;">${brkMsgInfo.msg }</span>
			<span class="brk_read_msg" style="display: none;">${brkMsgInfo.readmsg }</span>
		</div>    	
		<table class="table">
			<thead>
				<tr>
					<th>사진</th>
					<th>이름</th>
					<th>상태 메세지</th>
				</tr>
				<tr style="background-color: orange;" class="myInfo">
					<td>${myInfo.yface }</td>
					<td>${myInfo.yname }</td>
					<td>${myInfo.yhello }</td>
					<td style="display: none">
						<span class="myId">${myInfo.yaman_id}</span>
						<span class="myFace">${myInfo.yface }</span>
						<span class="myName">${myInfo.yname }</span>
						<span class="mySchool">${myInfo.yschool }</span>
						<span class="myCompany">${myInfo.ycompany }</span>
						<span class="myPhone">${myInfo.yphone }</span>
						<span class="myEmail">${myInfo.yemail }</span>
						<span class="myHello">${myInfo.yhello }</span>
					</td>
				</tr>
			</thead> 
			<tbody id="friendInfo">
				<c:forEach var="myFriendList" items="${myFriendList}">
					<c:choose>	
						<c:when test="${myFriendList.yok == 1 }">
							<tr id="${myFriendList.yaman_two}" style="background-color: skyblue;" onclick="detail('${myFriendList.yface}','${myFriendList.yname}','${myFriendList.yschool}','${myFriendList.ycompany}','${myFriendList.yphone}','${myFriendList.yemail}','${myFriendList.yhello }','${myFriendList.yok }','${myFriendList.yaman_id}');">
								<td>${myFriendList.yface}</td>
								<td>${myFriendList.yname}</td>
								<td>${myFriendList.yhello}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr id="${myFriendList.yaman_two}"  onclick="detail('${myFriendList.yface}','${myFriendList.yname}','${myFriendList.yschool}','${myFriendList.ycompany}','${myFriendList.yphone}','${myFriendList.yemail}','${myFriendList.yhello }','${myFriendList.yok }','${myFriendList.yaman_id}');">
								<td>${myFriendList.yface}</td>
								<td>${myFriendList.yname}</td>
								<td>${myFriendList.yhello}</td> 
							</tr>
						</c:otherwise>
					</c:choose>
					
				</c:forEach>
			</tbody>
		</table>
    </div>
    <div id="chat_room" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <!-- 친구추가 탭 -->
    <div id="add_friend" class="tab-pane fade">

		<div class="container" style="padding-top: 20px;">
		    <div class="well">
		      <input type="text" class="form-control" id="searchYname" value="" placeholder="이름">
		      <button class="btn btn-default" id="searchNameBtn">검색</button>
		    </div>
		    <div class="well">
		      <input type="text" class="form-control" id="searchYschool" value="" placeholder="학교명">
		      <button class="btn btn-default" id="searchSchoolBtn" >검색</button>
		    </div>
		    <div class="well">
		      <input type="text" class="form-control" id="searchYphone" value="" placeholder="전화번호">
		      <button class="btn btn-default" id="searchPhoneBtn" >검색</button>
		    </div>
		    <div class="well">
		      <input type="text" class="form-control" id="searchYemail" value="" placeholder="이메일">
		      <button class="btn btn-default" id="searchEmailBtn">검색</button>
		    </div>
		</div>
		
    </div>
  </div>
    <hr>
</div>


<!-- 친구 모달 --> 
<div class="container">
	<div class="modal fade" id="myFriendModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
						<div class="row">
							<div class="col-sm-6 pull-left">
		          				<h3>상세정보</h3>
		          				사진
								<input type="text" id="face" value="" readonly="readonly">
							</div>
							<div class="col-sm-6 pull-right"  style="margin-top: 50px;">
								<table>
									<tr>
									<th>이름</th>
									<td><input type="text" readonly="readonly" value="" id="name"></td>
									</tr>
									<tr>
									<th>학교</th>
									<td><input type="text" readonly="readonly" value="" id="school"></td>
									</tr>
									<tr>
									<th>회사</th>
									<td><input type="text" readonly="readonly" value="" id="company"></td>
									</tr>
									<tr>
									<th>전화번호</th>
									<td><input type="text" readonly="readonly" value="" id="phone"></td>
									</tr>
									<tr>
									<th>이메일</th>
									<td><input type="text" readonly="readonly" value="" id="email"></td>
									</tr>
									<tr>
									<th>상태 메세지</th>
									<td><input type="text" readonly="readonly" value="" id="hello"></td>
									</tr>
									<tr>
									<td><input type="hidden" readonly="readonly" value="" id="ok"></td>
									</tr>
									<tr>
									<td><input type="hidden" readonly="readonly" value="" id="id"></td>
									</tr>
								</table>
								<br>
			          			 <div >
									 <button type="button" class="btn btn-success" data-dismiss="modal" id="chat_btn">채팅</button>								
			          				 <button type="button" class="btn btn-success" data-dismiss="modal" id="breakFriend">절교하기</button>
			          				 <button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
								 </div>
						     </div>
	          			</div><!--row -->
				</div><!--modal-body  -->
			</div><!--modal-content-->
		</div> <!--modal-dialog  -->
	</div><!-- Modal -->
</div>

<div class="container">
<!-- 절교 Modal -->
  <div class="modal fade" id="breakFriendModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">절교 메세지</h4>
        </div>
        <div class="modal-body">
          <input type="text" id="brkFd" value="" class="form-control" placeholder="절교 메세지를 입력하세요">            
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="byeFd">잘가</button>
        </div>
      </div>
    </div>
  </div>
</div>


<!--내모달 --> 
<div class="container">
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
						<div class="row">
							<div class="col-sm-6 pull-left">
		          				<h3>내정보</h3>
		          				사진
								<input type="text" id="myFace" value="" readonly="readonly">
							</div>
							<div class="col-sm-6 pull-right"  style="margin-top: 50px;">
								<table>
									<tr>
									<th>이름</th>
									<td><input type="text" readonly="readonly" value="" id="myName"></td>
									</tr>
									<tr>
									<th>학교</th>
									<td><input type="text" readonly="readonly" value="" id="mySchool"></td>
									</tr>
									<tr>
									<th>회사</th>
									<td><input type="text" readonly="readonly" value="" id="myCompany"></td>
									</tr>
									<tr>
									<th>전화번호</th>
									<td><input type="text" readonly="readonly" value="" id="myPhone"></td>
									</tr>
									<tr>
									<th>이메일</th>
									<td><input type="text" readonly="readonly" value="" id="myEmail"></td>
									</tr>
									<tr>
									<th>상테 메세지</th>
									<td><input type="text" value="" readonly="readonly" id="myHello"></td>
									</tr>
								</table>
								<br>
			          			 <div style="text-align: left;" >
			          				 <button type="button" class="btn btn-success" data-dismiss="modal" id="myInfoUpdate">내정보수정</button>
			          				 <button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
								 </div>
						     </div>
	          			</div><!--row -->
				</div><!--modal-body  -->
			</div><!--modal-content-->
		</div> <!--modal-dialog  -->
	</div><!-- Modal -->
</div>


<!--상세정보 업데이트 --> 
<div class="container">
	<div class="modal fade" id="myUpdateModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
						<div class="row">
							<div class="col-sm-6 pull-left">
		          				<h3>수정</h3>
		          				사진
								<input type="text" id="UpdateFace" value="">
							</div>
							<div class="col-sm-6 pull-right"  style="margin-top: 50px;">
								<table>
									<tr>
									<th>이름</th>
									<td><input type="text"  value="" id="UpdateName"></td>
									</tr>
									<tr>
									<th>학교</th>
									<td><input type="text" value="" id="UpdateSchool"></td>
									</tr>
									<tr>
									<th>회사</th>
									<td><input type="text" value="" id="UpdateCompany"></td>
									</tr>
									<tr>
									<th>전화번호</th>
									<td><input type="text" value="" id="UpdatePhone"></td>
									</tr>
									<tr>
									<th>이메일</th>
									<td><input type="text" value="" readonly="readonly" id="UpdateEmail"></td>
									</tr>
									<tr>
									<th>상테 메세지</th>
									<td><input type="text" value="" id="UpdateHello"></td>
									</tr>
								</table>
								<br>
			          			 <div style="text-align: left;" >
			          				 <button type="button" class="btn btn-success" data-dismiss="modal" id="updateYaman">수정</button>
			          				 <button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
								 </div>
						     </div>
	          			</div><!--row -->
				</div><!--modal-body  -->
			</div><!--modal-content-->
		</div> <!--modal-dialog  -->
	</div><!-- Modal -->
</div>


<!-- 절교 메세지 Modal -->
  <div class="modal fade" id="brkMsgModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">절교 메세지</h4>
        </div>
        <div class="modal-body">
          <input type="text" value="" class="form-control" id="brkMsgText" readonly="readonly">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="chk_msg">확인</button>
        </div>
      </div>
    </div>
  </div>


</body>
</html>