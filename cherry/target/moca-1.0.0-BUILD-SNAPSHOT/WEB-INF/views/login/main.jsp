<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Yaman Main Home</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link href=<c:url value="/resources/css/style.css"/> rel="stylesheet">
	<link href=<c:url value="/resources/css/map1.css"/> rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src=<c:url value="/resources/js/friend.js"/>></script>
	<script src=<c:url value="/resources/js/chat.js"/>></script>

	<style>
		.carousel-control.right, .carousel-control.left {
			background-image: none;
			color: #f4511e;
		}
			
		@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
		@import url(https://fonts.googleapis.com/css?family=Pacifico);
		
		p{
			font-size: 40px;
		}
		
		a{
			color: yellow;
		}
		
		h2{
			display: inline-block;
			font-family: 'Pacifico', cursive;
			font-size: 100px;
			color: #AB3C39;
		}
		
  		body {
  			font-family: 'jeju Hallasan';
  			width : 100%;
  			height : 100%;
  			overflow-x : hidden;
  			overflow-y: auto;
  		}
  		
		.affix {
      		top:0;
      		width: 100%;
      		z-index: 9999 !important;
  		}
  		
  		.navbar {
      		margin-bottom: 0px;
  		}
 
  		.affix ~ .container-fluid {
     		position: relative;
     		top: 50px;
  		}
  		
  		#tabs{
  			height: 100%;
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
<script src=<c:url value="/resources/js/calender.js"/>></script>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
<input id = "loginId" type="hidden" value = "${loginUser.yaman_id }">
<input id = "loginNAME" type="hidden" value = "${loginUser.yname }">
<div class="row">
	<div class="col-sm-12" data-spy="scroll"data-offset="50" >
		<div class="container-fluid"style="background-color: #FFD3FF; background-image: url(/resources/images/1.gif); background-size: 100% 200px; width: 60%; height: 200px;">
			<div style="position: absolute; right: 1%;">
				<br/>
				<i class="fa fa-comment-o" aria-hidden="true"></i> 
				<i class="fa fa-commenting" aria-hidden="true"	style="padding-right: 50px;">
					<span data-toggle="modal" data-target="#messageModal"	style="cursor: pointer; font-size: 15px;">메세지</span>
				</i>
				<br/><br/>
				<span style="padding-right: 50px; font-size: 15px">with_${loginUser.yname}</span>
				<br/><br/>
				<a href="#boardSender" data-toggle="modal" style="color: navy;"> 불만 접수</a>
				<br/><br/>
				<a href='http://192.168.56.115:8890/cherry/logout' style="color: navy;">로그아웃</a>
			</div>
			<div align="center">
				<h2>Yaman</h2>
				<div style="position: absolute; right: 1%; color: navy;"></div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-6" data-spy="scroll" data-target=".navbar" data-offset="50">
		<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="197" style="background-color: #D2691E;">
			<div class="container-fluid" >
    			<div class="navbar-header" >
        			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          				<span class="icon-bar"></span>
          				<span class="icon-bar"></span>
          				<span class="icon-bar"></span>                        
      				</button>
				</div>
      			<div class="collapse navbar-collapse" id="myNavbar" >
        			<ul class="nav nav-tabs" >
		  				<li class="active"><a data-toggle="tab" href="#menu1">친구목록</a></li>
		  				<li><a data-toggle="tab" href="#menu2">채팅방</a></li>
		  				<li><a data-toggle="tab" href="#menu3">친구추가</a></li>
					</ul>
      			</div>
  			</div>
		</nav>
		<!--탭-->
		<div id="tabs" class="tab-content">
  			<div id="menu1" class="tab-pane fade in active">
  				<div id="friend_list" class="tab-pane fade in active">
					<hr>
					<!-- 친구 검색 기능 -->
					<div>
						<input type="search" style="border: 1px solid gray;" placeholder="검색할 이름을 입력하세요." name="searchName" id="searchName" />
					</div>
					<div style="overflow-x: hidden; overflow-y:auto;height: 670px">    	
						<table class="table">
							<thead>
								<tr>
									<th>사진</th>
									<th>이름</th>
									<th>상태 메세지</th>
								</tr>
								<tr style="background-color: orange;" class="myInfo">
									<td>
										<c:choose>
                                       		<c:when test="${myInfo.yface == '없음'}">
                                          		사진이 없습니다.
                                       		</c:when>
                                       		<c:otherwise>
                                          		<img src="resources/images/${myInfo.yface}" width="30px;" height="30px;">
                                       		</c:otherwise>
                                 		</c:choose>
                                 	</td>
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
												<td>
													<c:choose>
                                           				<c:when test="${myFriendList.yface == '없음'}">
                                               				사진이 없습니다.
                                           				</c:when>
                                           				<c:otherwise>
                                               				<img src="resources/images/${myFriendList.yface}" width="30px;" height="30px;">
                                    		        	</c:otherwise>
                                          			</c:choose>
                                          		</td>
												<td>${myFriendList.yname}</td>
												<td>${myFriendList.yhello}</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr id="${myFriendList.yaman_two}"  onclick="detail('${myFriendList.yface}','${myFriendList.yname}','${myFriendList.yschool}','${myFriendList.ycompany}','${myFriendList.yphone}','${myFriendList.yemail}','${myFriendList.yhello }','${myFriendList.yok }','${myFriendList.yaman_id}');">
												<td>
													<c:choose>
                                                		<c:when test="${myFriendList.yface == '없음'}">
                                                   			사진이 없습니다.
                                                		</c:when>
                                                		<c:otherwise>
                                                   			<img src="resources/images/${myFriendList.yface}" width="30px;" height="30px;">
                                                		</c:otherwise>
                                          			</c:choose>
                                          		</td>
												<td>${myFriendList.yname}</td>
												<td>${myFriendList.yhello}</td> 
											</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
  			</div>
 			<div id="menu2" class="tab-pane fade">
 				<div style="text-align: center;">
 					<div>
 						<p> 내 채팅방 목록 </p>
 					</div>
    			<div style="text-align: center; overflow-x: hidden; overflow-y:auto;height: 670px">
    				<table id = "myChatRoomList" class="table table-hover table-bordered">
    					<tr class="danger">
    						<th style="text-align: center;">
    							채팅방 이름
    						</th>
    						<th style="text-align: center;">
    							참여자
    						</th>
    						<th style="text-align: center;">
    							삭제
    						</th>
    					</tr>
    					<c:forEach var="myChatRoomList" items="${myChatRoomList}">
    						<tr class="${myChatRoomList.ychatlist_id} warning" style="cursor: pointer;">
    							<td onClick="RoomListOpenWin('${myChatRoomList.roomname}');">
    								${myChatRoomList.roomname}
    							</td>
    							<td>
    								${myChatRoomList.yname }
    							</td>
    							<td>
    								<button type="button" class="btn btn-default btn-lg" onClick="deleteroom(${myChatRoomList.ychatlist_id});">
 										<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span> 
									</button>
    							</td>
    						</tr>
    					</c:forEach>
    				</table>
    			</div>
  			</div>
  		</div>
  		<!-- 친구추가 탭  -->
		<div id="menu3" class="tab-pane fade">
			<div style="overflow-x: hidden; overflow-y:auto;height: 670px">
               	<div class="container" style="padding-top: 20px;" >
                	<div>
                        <input type="text" class="form-control" id="searchYname" value="" placeholder="이름" style="width: 55%; margin-bottom: 20px;">
                    </div>
                    <div>
                        <input type="text" class="form-control" id="searchYschool" value="" placeholder="학교명" style="width: 55%; margin-bottom: 20px;">
                    </div>
                    <div>
                        <input type="text" class="form-control" id="searchYphone" value="" placeholder="전화번호" style="width: 55%; margin-bottom: 20px;">
                    </div>
                    <div>
                        <input type="text" class="form-control" id="searchYemail" value="" placeholder="이메일" style="width: 55%; margin-bottom: 20px;">
                    </div>
                        <button class="btn btn-default" id="searchBtn">검색</button>
            	</div>
            </div>
        </div>   
 	</div>
</div><!--div class="col-sm-6"  -->
	<div class="col-sm-6">
		<nav class="navbar navbar-inverse" data-offset-top="197" style="background-color: #D2691E;" >
			<div class="container-fluid" >
    			<div class="navbar-header">
        					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar2">
          						<span class="icon-bar"></span>
          						<span class="icon-bar"></span>
          						<span class="icon-bar"></span>                        
      						</button>
						</div>
      					<div class="collapse navbar-collapse" id="myNavbar2" >
        					<ul class="nav nav-tabs" >
		  						<li><a data-toggle="tab" href="#schedule">빠른일정</a></li>
		  						<li><a data-toggle="tab" href="#promise">약속</a></li>
		  						<li><a data-toggle="tab" href="#endpromise">종료약속</a></li>
							</ul>
      					</div>
				  	</div>
				</nav>
		
				<div class="tab-content">
  					<div id="schedule" class="tab-pane fade in active">
						<div id="kCalendar">
						</div>
  					</div>
  					<div id="promise" class="tab-pane fade">
                   <!-- 메인 리스트 -->
               <table border="0" class="table table-striped" >
                  <colgroup>
                     <col width="60"><col><col width="115"><col width="85">
                  </colgroup>
                  <thead>
                     <tr>
                        <th scope="col">약속번호</th>
                        <th scope="col">약속이름</th>
                        <th scope="col">약속날짜</th>
                        <th scope="col">약속시작시간</th>
                        <th scope="col">약속종료시간</th>
                        <th scope="col">약속장소</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="item" items="${promiselist }" varStatus="status">
                        <tr>
                           <td>${status.count }</td>
           			          <td id="pname${item.ypromise_id }"><a href="./ypromise_id/${item.ypromise_id}">${item.yproname }</a></td>
						   <td id="pdate${item.ypromise_id }">${item.yprodate }</td>
                           <td id="pstart${item.ypromise_id }">${item.yprostart }</td>
                           <td id="pend${item.ypromise_id }">${item.yproend }</td>
                           <td id="ploc${item.ypromise_id }">${item.yproloc }</td>
                           <td><button type="button" class="btn btn-success"  onClick="updatePromise(${item.ypromise_id})">수정</button></td>
                           <td><button type="button" class="btn btn-warning" onClick="deletePromise(${item.ypromise_id})" >삭제</button></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <h4><a href="./excelDownload" style="color: navy;" class="btn btn-block btn-default">약속리스트 Excel 다운로드</a></h4>
					<script type="text/javascript">
						window.onload=function () {
							kCalendar('kCalendar');
						};
					</script>
  				</div>
  				
 <!-- 내꺼 -->	 				
  			<div id="endpromise" class="tab-pane fade">
  					<button id="getPosition">약속 완료된 약속 보기</button>
					<div class="container">
					  <table class="table">
					    <thead>
					      <tr>
					        <th>약속 번호</th>
					        <th>약속 이름</th>
					        <th>약속 날짜</th>
					      	<th>위도</th>
					      	<th>경도</th>
					      </tr>
					    </thead>
					    <tbody>
					    	<c:forEach var="listAllpromise" items="${listAllpromise}">
					    		<tr>
					    			<td>${listAllpromise.ypromise_id}</td>
					    			<td>${listAllpromise.yproname}</td>
					    			<td>${listAllpromise.yprodate}</td>
					    			<td>${listAllpromise.yprolocx}</td>
					    			<td>${listAllpromise.yprolocy}</td>
					    		</tr>
					    	</c:forEach>
					    </tbody>
					    </table>
						<div id="map3" style="width:500px;height:800px;"></div>
						<button onclick="relayout()" id="asdf">레이아웃</button>
					<!--사진업로드-->
					</div>
						<div class="container" >
							<div class="modal fade" id="inputImg" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
												<div class="row">
													<div text align="center"><p>현재 저장된 사진</p></div>
														<div id="imgList"  float:left;>
															<div float:left;>
																<c:forEach var="photoMyList" items="${photoMyList}">
																	<div class="row text-center">
																      <div class="col-sm-4">
																        <div class="thumbnail">
																          <img src="/cherry/resource/images/${photoMyList.yphotofile }" width="400" height="300"> 
																        </div>
																      </div>
																    </div>
																</c:forEach>
															</div>
														</div>
													<div class="clear" style="clear: both;"></div>											
													<hr>
													<div id="hereToimg"></div>
													<div text align="center">
													<form enctype="multipart/form-data" action="" name="files" id="uploadForm">
														<input type="hidden" name="content" id="content">
														<input type="hidden" name="ypromise_id" id="input_promiseId">
														<input type="file" name="images" id="images" multiple>
													</form>
														<button id="imgbtn">전송</button>
													</div>
													<div id="images-to-upload">
													</div><!-- end #images-to-upload -->
							          			</div><!--row -->
										</div><!--modal-body  -->
									</div><!--modal-content-->
								</div> <!--modal-dialog  -->
							</div><!-- Modal -->
						</div><!--container  -->
					<!--리플 모달  -->
						<div class="container">
							<div class="modal fade" id="imgdetail" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
												<div class="row">
													<div id="myCarousel" class="carousel slide" data-ride="carousel">
														<div class="carousel-inner" role="listbox" id="carousel-inner">
														
														</div><!--carousel-inner-->
															<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
															      	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
															      	<span class="sr-only">Previous</span>
															</a>
															<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
																<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
																<span class="sr-only">Next</span>
															</a>
													</div>
							          			</div><!--row -->
										</div><!--modal-body  -->
									</div><!--modal-content-->
								</div> <!--modal-dialog  -->
							</div><!-- Modal -->
						</div><!--container  -->
				
				 <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bd0f27ece147cf043c740a790ba158a3"></script>
  				 <script src=<c:url value="/resources/js/map1.js"/>></script>
			
			</div>
			</div>
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
		          				<div id="face"></div>
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
					   			<div>
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


		<div class="container">
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<div class="row">
									<div class="col-sm-6 pull-left">
					       				<h3>내정보</h3>
					       				<input type="hidden" id="myFace" value="" readonly="readonly">
                        					<c:choose>
                           						<c:when test="${myInfo.yface == '없음' }">
                             					 사진이 없습니다.
                           						</c:when>
                           					<c:otherwise>
                              					<img src="resources/images/${myInfo.yface}" style="width: 15em; height: 15em;">
                          					 </c:otherwise>
                        				</c:choose>
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
											<form id="myPhotoFrm" name="myPhotoFrm" enctype="multipart/form-data">
                                    			<input type="file" id="UpdateFace" value="" name="updateMyFace">
                                     		</form>				          				
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

		  	<!-- 절교 Modal -->
		  	<div class="container">
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
		   
		   <!-- 친구추가탭에서 검색을 눌렀을 떄 사용되는  Modal -->
		     <div class="modal fade" id="fdAddModal" role="dialog">
		       <div class="modal-dialog modal-sm">
		         <div class="modal-content">
		           <div class="modal-header">
		             <button type="button" class="close" data-dismiss="modal">&times;</button>
		             <h4 class="modal-title">검색 목록</h4>
		           </div>
		           <div class="modal-body">
		              <div class="table-responsive">          
		              <table class="table" id="fdAddTable">
		                <thead>
		                  <tr>
		                    <th>선택</th>
		                    <th>친구이름</th>
		                    <th>생년월일</th>
		                  </tr>
		                </thead>
		                <tbody>
		                  <tr>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                  </tr>
		                </tbody>
		              </table>
		            </div>
		           </div>
		           <div class="modal-footer">
		             <button type="button" class="btn btn-default" data-dismiss="modal" id="reqBtn">요청</button>
		             <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		           </div>
		         </div>
		       </div>
		     </div>
		  	
			<!-- 채팅방 모달  --> 
			<div id="chat-room" title ="채팅방 제목">
				<fieldset>
					<p id="chat-name">채팅 방 이름</p>
					<input type="text" id="room-name" value = '' class="form-control" placeholder="채팅방 이름을 입력하세요">
					<button id="check-room-name" class="btn btn-default" style="float: right;">방 이름 검색</button>
				</fieldset>
				<input type="text" id="room-okay" value = ''style="visibility: hidden;">
			</div>
			
			<!-- 메세지 모달 -->
			<div class="container">
				<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby = "messageModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="messageModalLabel">메세지 창</h4>
							</div>
							<div class="modal-body">
								<div data-spy="scroll" data-target=".navbar" data-offset="50" >
									<nav class="navbar navbar-inverse" data-offset-top="197" style="background-color: white;" >
										<div class="container-fluid" >
							   				<div class="navbar-header">
							   					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#messageModalMenu">
						       						<span class="icon-bar"></span>
					          						<span class="icon-bar"></span>
					          						<span class="icon-bar"></span>                        
					      						</button>
											</div>
					      					<div class="collapse navbar-collapse" id="messageModalMenu" >
					        					<ul class="nav nav-tabs" >
							  						<li class="active"><a data-toggle="tab" href="#request_friend">친구요청</a></li>
							  						<li><a data-toggle="tab" href="#reqeust_chat">채팅요청</a></li>
							  						<li><a data-toggle="tab" href="#breakUp">절교메세지</a></li>
												</ul>
					     					</div>
									  	</div>
									</nav>
									<div class="tab-content" style="text-align: center;">
										<div id="request_friend" class="tab-pane fade in active">
			    							<table class="table" id="fdReqMsg">
											    <thead>
											      <tr>
										        <th>보낸사람</th>
								        <th>메세지</th>
										        <th>확인</th>
										      </tr>
										    </thead>
									 <tbody>
									      <tr>
									        <td></td>
								    <td></td>
									       <td></td>
									      </tr>
									    </tbody>
									 </table>
			  							</div>
			  							<div id="reqeust_chat" class="tab-pane fade">
			    							<div id="invite-chat" style="text-align: center">
												<fieldset>
													<table class="table table-bordered" id="invite-list">
														<tr>
															<th> 번호 </th>
															<th> 채팅 초대자 </th>
															<th> 채팅방 이름 </th>
															<th> 수락 </th>
															<th> 거절 </th>
														</tr>
													</table>
												</fieldset>
											</div>
			  							</div>
										<!-- 메세지 탭 3 절교메세지 -->
		                                <div id="breakUp" class="tab-pane fade">
		                                  <table class="table" id="brkMsgTable">
		                                     <thead>
		                                       <tr>
		                                         <th>보낸사람</th>
		                                         <th>메세지</th>
		                                         <th>확인</th>
		                                       </tr>
		                                     </thead>
		                                     <tbody>
		                                       <tr>
		                                         <td></td>
		                                         <td></td>
		                                         <td></td>
		                                       </tr>
		                                     </tbody>
		                                  </table>
		                                </div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
		  	<div class="container">
				<div class="modal fade" id="myModal1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">약속날짜 </h4>
					          <input type="text" id="yprodate" name="yprodate" value=""/>
					        </div>
					        <div class="modal-body">
					        
							<!-- 약속리스트 by date -->
								<table border="1" class="table table-condensed" id="listByDate">
									<colgroup>
										<col width="40"><col width="80"><col width="50"><col width="50">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">약속번호</th>
											<th scope="col">약속이름</th>
											<th scope="col">약속날짜</th>
											<th scope="col">약속시작시간</th>
											<th scope="col">약속종료시간</th>
											<th scope="col">약속장소</th>
											<!-- <th scope="col">약속이행여부</th>
											<th scope="col">약속삭제여부</th> -->
										</tr>
									</thead>
									<tbody>
										<button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#addPromise">새일정추가</button>
					      	  			<!-- 새일정 템플릿 추가 -->
					      	  			<div id="addPromise" class="collapse">
			                                 <form action="./write"  method = "get">
			                                    <div class="row">
			                                       <div class="col-sm-6">
			                                          <div class="form-group">
			                                             <label for="yproname">약속 이름 :  </label><input type="text" class="form-control" id="yproname">
			                                          </div>
			                                          <div class="form-group">
			                                             <label for="yprodate1">약속 날짜 :  </label><input type="text" class="form-control" id="yprodate1">
			                                          </div>
			                                          <div class="form-group">
			                                             <label for="yprostart">약속 시작시간 :  </label><input type="time" class="form-control" id="yprostart" onblur="getPromise(this.value)">
			                                          </div>
			                                          <div class="form-group">
			                                             <label for="yproend">약속 종료시간 :  </label><input type="time" class="form-control" id="yproend">
			                                          </div>
			                                          <div class="form-group">
			                                             <label for="yproloc">약속 장소 :  </label><input type="text" class="form-control" id="yproloc">
			                                          </div>
			                                       </div>
			                                    </div>
										        <button type="submit" class="btn btn-primary" data-dismiss="modal" id="submit">submit</button>
										        <button type="reset" class="btn btn-info" data-dismiss="modal">Close</button>
										    </form>
										</div>  
									</tbody>
								</table>
					        </div> <!-- close of modal-body -->
					    </div>  <!-- close of modal-content -->
					</div> <!--modal-dialog  -->
				</div><!-- Modal -->
			</div><!--container  -->
		
		
		
		  	<!--약속수정 Modal -->
		 	<div class="container">
		      <div class="modal fade" id="updatePromise" role="dialog">
		         <div class="modal-dialog">
		            <div class="modal-content">
		            	<div class="modal-header">
		              		<button type="button" class="close" data-dismiss="modal">&times;</button>
		                	<h4 class="modal-title">약속 수정 </h4>
		                </div>
		              	<div class="modal-body">
		                        
		                	<form action="./write"  method = "get">
                                  <div class="row">
		                              <div class="col-sm-6">
		                                 <div class="form-group">
		                                    <label for="ypromise_id2">약속 번호 :  </label><input type="text" class="form-control" id="ypromise_id2" name="ypromise_id2" value="${ypromise_id}">
		                                 </div>
		                                 <div class="form-group">
		                                    <label for="yproname2">약속 이름 :  </label><input type="text" class="form-control" id="yproname2" name="yproname2" value="${yproname}">
		                                 </div>
		                                 <div class="form-group">
		                                    <label for="yprodate2">약속 날짜 :  </label><input type="text" class="form-control" id="yprodate2" name="yprodate2" value="${yprodate}">
		                                 </div>
		                                 <div class="form-group">
		                                    <label for="yprostart2">약속 시작시간 :  </label><input type="time" class="form-control" id="yprostart2" name="yprostart2" value="${yprostart}" onblur="getPromise(this.value)">
		                                 </div>
		                                 <div class="form-group">
		                                    <label for="yproend2">약속 종료시간 :  </label><input type="time" class="form-control" id="yproend2" name="yproend2" value="${yproend}">
		                                 </div>
		                                 <div class="form-group">
		                                    <label for="yproloc2">약속 장소 :  </label><input type="text" class="form-control" id="yproloc2" name="yproloc2" value="${yproend}">
		                                 </div>
		                              </div>
		                           </div>
		                       <button type="submit" class="btn btn-primary" data-dismiss="modal" id="submit1">submit</button>
		                   </form>
		                     
		               </div><!--modal-body  -->
		            </div><!--modal-content-->
		         </div> <!--modal-dialog  -->
		      </div><!-- Modal -->
			</div><!--container  -->

<!--이창환-->		
<!-- 지도부분  -->
					<div class="modal fade" id="promiseMapInfo" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<div class="row">
									<div class="col-sm-6">
				 	      				<div id="infoMap" style="width:100%;height:300px;"></div> 
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="uproname">약속 이름:</label>
												<input type="text" class="form-control" id="yproname3">
											</div>
											<div class="form-group">
												<label for="yprodate">약속 날짜:</label>
												<input type="text" class="form-control" id="yprodate3">
											</div>
											<div class="form-group">
												<label for="yprostart">약속 시간:</label>
												<input type="text" class="form-control" id="yprostart3">
											</div>
											<div class="form-group">
												<label for="yproloc">약속 장소:</label>
												<input type="text" class="form-control" id="yproloc3">
											</div>
					          			</div>
				          			</div><!--row -->
				          			<!-- <button type="button" id="moveCenter">중심점 이동</button> -->
				          			<button type="button" onclick="clickMyPostion2()">내위치 표시</button>
									<button onclick="setBounds2()">지도 범위 재설정 하기</button>
									<button onClick="find()">길찾기</button>

								</div><!--modal-body  -->
							</div><!--modal-content-->
						</div> <!--modal-dialog  -->
					</div><!-- Modal -->
				</div><!--container  -->
				
				<!-- 불만모달 -->
				<div class="modal fade" id="boardSender" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">불만 신고</h4>
					</div>
					<div class="modal-body">
						<form action="href='http://192.168.56.115:8890/cherry/write'" method="post">
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
	 <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bd0f27ece147cf043c740a790ba158a3"></script> 
	 <script src=<c:url value="/resources/js/map2.js"/>></script> 
	 <script type="text/javascript" src=<c:url value="/resources/js/board.js"/>></script>
	
	</body>
</html>