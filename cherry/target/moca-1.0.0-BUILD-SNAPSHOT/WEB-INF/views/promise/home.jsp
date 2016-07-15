<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
		<title>Home</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
			<link href=<c:url value="/resources/css/style.css"/> rel="stylesheet">

			<script>
		    //달력 만들기
			function kCalendar(id, date) {
				var kCalendar = document.getElementById(id);
				
				if( typeof( date ) !== 'undefined' ) {
					date = date.split('-');
					date[1] = date[1] - 1;
					date = new Date(date[0], date[1], date[2]);
				} else {
					var date = new Date();
				}
				var currentYear = date.getFullYear();
				//년도를 구함
				
				var currentMonth = date.getMonth() + 1;
				//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
				
				var currentDate = date.getDate();
				//오늘 일자.
				
				date.setDate(1);
				var currentDay = date.getDay();
				//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
				
				var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
				var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
				if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
					lastDate[1] = 29;
				//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
				
				var currentLastDate = lastDate[currentMonth-1];
				var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
				//총 몇 주인지 구함.
				
				if(currentMonth != 1)
					var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
				else
					var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
				//만약 이번달이 1월이라면 1년 전 12월로 출력.
				
				if(currentMonth != 12) 
					var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
				else
					var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
				//만약 이번달이 12월이라면 1년 후 1월로 출력.
		
				
				if( currentMonth < 10 )
					var currentMonth = '0' + currentMonth;
				//10월 이하라면 앞에 0을 붙여준다.
				
				var calendar = '';
				
				calendar += '<div id="header">';
				calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>';
				calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
				calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
				calendar += '		</div>';
				calendar += '		<table border="0" cellspacing="0" cellpadding="0">';
				calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
				calendar += '			<thead>';
				calendar += '				<tr>';
				calendar += '				  <th class="sun" scope="row">일</th>';
				calendar += '				  <th class="mon" scope="row">월</th>';
				calendar += '				  <th class="tue" scope="row">화</th>';
				calendar += '				  <th class="wed" scope="row">수</th>';
				calendar += '				  <th class="thu" scope="row">목</th>';
				calendar += '				  <th class="fri" scope="row">금</th>';
				calendar += '				  <th class="sat" scope="row">토</th>';
				calendar += '				</tr>';
				calendar += '			</thead>';
				calendar += '			<tbody>';
				
				var dateNum = 1 - currentDay;
				
				for(var i = 0; i < week; i++) {
					calendar += '			<tr>';
					for(var j = 0; j < 7; j++, dateNum++) {
						if( dateNum < 1 || dateNum > currentLastDate ) {
							calendar += '				<td class="' + dateString[j] + '"> </td>';
							continue;
						}
								
								if( dateNum < 10 )
									var dateNum = '0' + dateNum;
								//10월 이하라면 앞에 0을 붙여준다.
						calendar += '				<td class="' + dateString[j] + '"><button id = "'+dateNum+'"value="'+dateNum+'" onClick="pdate('+currentYear + currentMonth + dateNum+');">' + dateNum + '</button></td>';
					}
					calendar += '			</tr>';
				}
				
				calendar += '			</tbody>';
				calendar += '		</table>';
				
				kCalendar.innerHTML = calendar;
				
			}
			 

			//날짜별 ajax 통한 약속 리스트
			 function pdate(date){
				 $("#myModal").modal();
						
				$.ajax({
					url : "http://localhost:8888/cherry/yprodate/"+date,
					type : "get",
					dataType : "json",
					contentType : "application/json",
					success : function(data, textStatus, jqXHR){
						
						    $('#listByDate tbody').children().remove();
						
						    $("#myModal").modal();
						
						if( data.promiseListByDate.length < 1 ){
							alert(" 이날의 일정이 없습니다." );
						}else{
							for(var i = 0; i<data.promiseListByDate.length; i++){
								$('#listByDate tbody').append(
									'<tr>' +
									'<td>' +
									data.promiseListByDate[i].ypromise_id +
									'</td>' +
									'<td><input type="text" data-toggle="modal" data-target="#myModal" id="modal" onClick="promiseDetail('+data.promiseListByDate[i].ypromise_id+')" value="'+data.promiseListByDate[i].yproname+'" style="border:0px; color:#2226CA; fontsize:14pt; font-weight:bold"></td>' +
									'<td>' +
									+ data.promiseListByDate[i].yprodate +
									'</td>' +
									'<td>' +
									data.promiseListByDate[i].yprostart +
									'</td>' +
									'<td>' +
									data.promiseListByDate[i].yproend +
									'</td>' +
									'<td>' +
									data.promiseListByDate[i].yproloc +
									'</td>' 
									
								);
							}
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						alert("실패");
					}
				});     //close of ajax
				
				$('#yprodate').val(date);
				$('#yprodate1').val(date);
		
				
			}   // close of pdate()
			
			
		</script>
		
		<script type="text/javascript">
		
			//모달 내 새일정 추가HTML
			$(function(){
				$("#submit").on("click", function(){
					alert("새일정 추가 AJAX");
					$.ajax({
						url : "/cherry/write",
						type : "post",
						dataType : "json",
						contentType : "application/json",
						data : 
							JSON.stringify({
								"yproname" : $("#yproname").val(),
								"yprodate" : $("#yprodate").val(),
								"yprostart" : $("#yprostart").val(),
								"yproend" : $("#yproend").val(),
								"yproloc" : $("#yproloc").val(),
							}),
						success: function(data){
							alert("새일정추가후 약속이름 : " + data.yproname + ", 약속날짜 : " +data.yprodate);
						},
						error: function(jqXHR, textStatus, errorThrown){
							alert("실패");
						}
					});
				});
			});
			
			
		
			 
			// 모달 내 일정 수정 HTML
	         $(function(){
	            $("#submit1").on("click", function(){
	               alert("일정 수정 AJAX");
	               $.ajax({
	                  url : "/cherry/update_promise",
	                  type : "post",
	                  dataType : "json",
	                  contentType : "application/json",
	                  data : 
	                     JSON.stringify({
	                        "ypromise_id" : $("#ypromise_id2").val(),
	                        "yproname" : $("#yproname2").val(),
	                        "yprodate" : $("#yprodate2").val(),
	                        "yprostart" : $("#yprostart2").val(),
	                        "yproend" : $("#yproend2").val(),
	                        "yproloc" : $("#yproloc2").val(),
	                     }),
	                  success: function(data){
	                     alert("일정 수정을 완료하였습니다.");
	                     alert("일정수정 약속이름 : " + data.yproname + ", 약속날짜 : " +data.yprodate);
	                     window.location.reload(true);
	                  },
	                  error: function(jqXHR, textStatus, errorThrown){
	                     alert("실패");
	                  }
	               });
	            });
	         });
			
			
			// 새약속잡기 from 새약속잡기버튼
			function newPromise(){
				alert("새일정 추가 AJAX");
				$.ajax({
					url : "/cherry/write",
					type : "post",
					dataType : "json",
					contentType : "application/json",
					data : 
						JSON.stringify({
							"yproname" : $("#yproname").val(),
							"yprodate" : $("#yprodate").val(),
							"yprostart" : $("#yprostart").val(),
							"yproend" : $("#yproend").val(),
							"yproloc" : $("#yproloc").val(),
						}),
					success: function(data){
						alert(data.yproname);
					},
					error: function(jqXHR, textStatus, errorThrown){
						alert("실패");
					}
				});
			}
			
			//약속 삭제하기
			function deletePromise(ypromise_id){
				alert("약속을 삭제합니다.");
				
				$.ajax({
					url : "/cherry/deletePromise/"+ypromise_id ,
					type : "get",
					contentType : "application/json",
					success : function(data){
						alert(data.yproname+" 약속을 삭제하였습니다.");
						  window.location.reload(true);
					},
					error : function(jqXHR, textStatus, errorThrown){
						alert("약속삭제를 실패하였습니다. "+jqXHR.status+" "+textStatus);
					} 					
				});
			}
			
			   //약속 수정하기
	         function updatePromise(ypromise_id){
	            alert("약속을 수정합니다.");
	            
	             $("#updatePromise").modal();
	            
	            $.ajax({
	               url : "/cherry/ypromise/" + ypromise_id ,
	               type : "get",
	               dataType : "json",
	               contentType : "application/json",
	               
	               success : function(data, textStatus, jqXHR){
	                  alert("약속 이름 (수정) : "+ data.yproname + data.yprodate);
	               
	               
	                  $("#ypromise_id2").val(data.ypromise_id);
	                  $("#yproname2").val(data.yproname);
	                  $("#yprodate2").val(data.yprodate);
	                  $("#yprostart2").val(data.yprostart);
	                  $("#yproend2").val(data.yproend);
	                  $("#yproloc2").val(data.yproloc);
	            },
	            error: function(jqXHR, textStatus, errorThrown){
	               alert("실패");
	            }
	            })
	         }
			
		</script>
	</head>
<body>

<h1>${message }</h1>
<br>
		<div id="kCalendar"></div>
<br>

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
				<td>${item.ypromise_id }</td>
				<td><a href="./ypromise_id/${item.ypromise_id}">${item.yproname }</a></td>
				<td>${item.yprodate }</td>
				<td>${item.yprostart }</td>
				<td>${item.yproend }</td>
				<td>${item.yproloc }</td>
				<td><button type="button" class="btn btn-success"  onClick="updatePromise(${item.ypromise_id})">수정</button></td>
				<td><button type="button" class="btn btn-warning" onClick="deletePromise(${item.ypromise_id})" >삭제</button></td>
			</tr>
		</c:forEach>
	</tbody>
	
</table>
	<script type="text/javascript">
		window.onload=function () {
			kCalendar('kCalendar');
		};
	</script>
	
	
	
	
	 <!-- Modal -->
  <div class="container">
		<div class="modal fade" id="myModal" role="dialog">
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
										  <p>약속 이름 :</p><input type="text" id="yproname" name="yproname" value=""/>						
								          <p>약속 날짜 :</p><input type="text" id="yprodate1" name="yprodate1" value=""/>
								          <p>약속 시작시간 :</p><input type="time" id="yprostart" name="yprostart" value=""/>
								          <p>약속 종료시간 :</p><input type="time" id="yproend" name="yproend" value=""/>
								          <p>약속 장소 :</p><input type="text" id="yproloc" name="yproloc" value=""/>
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
                       <p>약속 번호 :</p><input type="text" id="ypromise_id2" name="ypromise_id2" value="${ypromise_id}"/>                  
                       <p>약속 이름 :</p><input type="text" id="yproname2" name="yproname2" value="${yproname}"/>                  
                         <p>약속 날짜 :</p><input type="text" id="yprodate2" name="yprodate2" value="${yprodate}"/>
                         <p>약속 시작시간 :</p><input type="time" id="yprostart2" name="yprostart2" value="${yprostart}"/>
                         <p>약속 종료시간 :</p><input type="time" id="yproend2" name="yproend2" value="${yproend}"/>
                         <p>약속 장소 :</p><input type="text" id="yproloc2" name="yproloc2" value="${yproend}"/>
                         <button type="submit" class="btn btn-primary" data-dismiss="modal" id="submit1">submit</button>
                   </form>
                     
               </div><!--modal-body  -->
            </div><!--modal-content-->
         </div> <!--modal-dialog  -->
      </div><!-- Modal -->
</div><!--container  -->


<!-- 지도부분  -->
<div class="container">
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
										<input type="text" class="form-control" id="yproname2">
									</div>
									<div class="form-group">
										<label for="yprodate">약속 날짜:</label>
										<input type="text" class="form-control" id="yprodate2">
									</div>
									<div class="form-group">
										<label for="yprostart">약속 시간:</label>
										<input type="text" class="form-control" id="yprostart2">
									</div>
									<div class="form-group">
										<label for="yproloc">약속 장소:</label>
										<input type="text" class="form-control" id="yproloc2">
									</div>
			          			</div>
		          			</div><!--row -->
		          			<button type="button" class="btn btn-success" id="probtn">거리보기</button>
					</div><!--modal-body  -->
				</div><!--modal-content-->
			</div> <!--modal-dialog  -->
		</div><!-- Modal -->
</div><!--container  -->

	
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bd0f27ece147cf043c740a790ba158a3&libraries=services"></script>
<script>
	var lat;
	var lng;
	function promiseDetail(ypromise_id){
	
		$("#promiseMapInfo").modal();
		
		$.ajax({
			url:'/cherry/promiseMapInfoDetail/' +ypromise_id,
			type: 'post',
			dataType:'json',
			success:function(data){
				alert("성공");
				alert(data.yproname);
				$("#yproname3").val(data.yproname);
				$("#yprodata3").val(data.yprodata);
				$("#yprostart3").val(data.yprostart);
				$("#yproloc3").val(data.yproloc);
				lat = data.yprolocx;
				lng = data.yprolocy;
				
				mapview(lat, lng);
			
			}			
		});
	}
	
	//지도에 표시된 마커객체를 가지고 있을 배열
	/* var markers = []; */


	//좌표의 위치(DB에서 가져와 center와 markerposition에 대입)
	//위치 배열
	var positions =[];

	//지도를 표시할 div
	function mapview(lat, lng){
	var mapContainer = document.getElementById('infoMap'),
		mapOption = {
			center : new daum.maps.LatLng(lat, lng), //지도의 중짐섬 (DB에서 위치가져오기)
			relvel:	5
		};
	//지도 생성
	var map = new daum.maps.Map(mapContainer, mapOption);

	var markerPosition = new daum.maps.LatLng(lat,lng); 

	//현재좌표를 위치배열에 추가
	positions.push(markerPosition);

	//마커 하나를 지도에 위에 표시합니다.
	/* addMarker(new daum.maps.LatLng(33.450701, 126.570667)); */
	var marker = new daum.maps.Marker({
		position : markerPosition,//나타낼 위치
		
	});

	marker.setMap(map);

	var infoContent = "<div> 약속 위치가져오기 </div>",
		infoRemovable = true;


	var info = new daum.maps.InfoWindow({
		map : map, //표시할지도
		position : new daum.maps.LatLng(lat, lng),
		content : infoContent,//나타낼 내용
		removalble : infoRemovable
		
	});

	info.open(map,marker); 
	var moveLatLng = new daum.maps.LatLng(lat, lng);   
	map.panTo(moveLatLng);


	}
	 
	//현재 좌표 얻어오기
	function clickMyPostion(){
		
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">여기있음</div>'; // 인포윈도우에 표시될 내용입니다
		       	alert("성공");

		        //현재위치를 위치 배열에 추가
		       	positions.push(locPosition);
		       
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		        
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		     alert("실패");
		    displayMarker(locPosition, message);
		}
	}

	//지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);    
	    
	    
	}    


	var bounds = new daum.maps.LatLngBounds();    


	function setBounds() {
		
		var i, marker;
		for (i = 0; i < positions.length; i++) {
		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		    marker =     new daum.maps.Marker({ position : positions[i] });
		    alert(marker);
		    
		    marker.setMap(map);
		    
		    // LatLngBounds 객체에 좌표를 추가합니다
		    bounds.extend(positions[i]);
		}
		
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}

	function se(){
		alert(positions[0]+"," +positions[1]);
	}

</script>


</body>
</html>