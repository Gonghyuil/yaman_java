<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
<button id="getPosition">약속 완료된 약속 보기</button>
<div class="container">
  <h2>Contextual Classes</h2>
  <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>            
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
<div id="map" style="width:80%;height:600px;"></div>
</div>

<button type="button" class="btn btn-default btn-lg" id="inputImgbtn">약속정보</button>
	<div class="container">
		<div class="modal fade" id="inputImg" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
							<div class="row">
								<form enctype="multipart/form-data"  name="files" id="uploadForm">
									<h1>dlalwl</h1>
									<input type="text" name="content" id="content">
									<input type="hidden" name="ypromise_id" id="input_promiseId">
									<input type="file" name="images" id="images" multiple>
									<hr>
									<button id="imgbtn">전송</button>
								</form>
								<div id="images-to-upload">
								</div><!-- end #images-to-upload -->
								<div id="imgList">
									<c:forEach var="photoMyList" items="${photoMyList}">
										<div class="row text-center">
									      <div class="col-sm-4">
									        <div class="thumbnail">
									          <img src="/cherry/resource/images/${photoMyList.yphotofile }" width="400" height="300"> 
									        </div>
									      </div>
									    </div>
									</c:forEach>
								<div id="hereToimg">여기에</div>
								</div>
		          			</div><!--row -->
					</div><!--modal-body  -->
				</div><!--modal-content-->
			</div> <!--modal-dialog  -->
		</div><!-- Modal -->
	</div><!--container  -->

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bd0f27ece147cf043c740a790ba158a3&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new daum.maps.LatLng(37.56772544008007,126.9800329431779), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	var lat = [];
	var lng = [];
	var proname = [];
	var promise_id = [];
	var points = [];
	
	var bounds = new daum.maps.LatLngBounds(); /*범위재설정  */
	$("#getPosition").on("click",function(){
		for(i=0; i< $('tbody tr').length; i++){
			 
			promise_id[i] = $('tbody tr:eq('+i+') td:eq(0)').text();
			proname[i] = $('tbody tr:eq('+i+') td:eq(1)').text();
			lat[i] = $('tbody tr:eq('+i+') td:eq(3)').text();
			lng[i] = $('tbody tr:eq('+i+') td:eq(4)').text();
			
			if( lat[i] <= 40 && 30 <= lat[i] ){
				if( 126 < lng[i] && lng[i] < 127 ){
		 		points[i] = new daum.maps.LatLng(lat[i],lng[i]);
		 		bounds.extend(points[i]);
			 	}
		 	}
			
		} //포인트 얻는 for
		 
		 var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			for (var i = 0; i < proname.length; i ++) {
			    /* alert(proname[i]+","+lat[i]+","+lng[i]+","+promise_id[i]); */
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new daum.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new daum.maps.LatLng(lat[i],lng[i]), // 마커를 표시할 위치
			        title : proname[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
				
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, proname[i], promise_id[i]));
			    daum.maps.event.addListener(marker, 'mouseout', makeOutListener());
			    daum.maps.event.addListener(marker, 'click', aaa(promise_id[i]));
			    
			}//마커의 이미지 for
			map.setBounds(bounds);
			
 	});
	
	var infowindow;
	var photoid =[];
	function makeOverListener(map, marker, proname, promise_id) {
	    return function() {
	    $("#carousel-inner").empty();
	    
	    var allimg = [];
	    	$.ajax({
	    		url : 'photosAboutPromise/' +promise_id,
	    		type: 'POST',
	    		contentType: 'application/json',
	    		success : function(data){
	    			for( i=0; i< data.length; i++){
	    				allimg += '<div>'+'<img src="/cherry/resources/images/' +data[i].yphotofile +'"class='+'"img-thumbnail"'
						+'alt="Cinque Terre"'+'width="50"'+'height="50"></div>'
						if( i == 0){
						var active=
								'<div class="item active">'+
									'<img src="/cherry/resources/images/' +data[i].yphotofile +'"'+ 'width="500"'+ 'height="500">'+
								'<div>'
								;
							photoid[i] = data[i].yphoto_id;
							$("#carousel-inner").append(active);
						}else{
							var item =	
								'<div class="item">'+
									'<img src="/cherry/resources/images/' +data[i].yphotofile +'"'+ 'width="500"'+ 'height="500">'+
								'<div>';
							photoid[i] = data[i].yphoto_id;
							$("#carousel-inner").append(item);
						}
						
	    			}
	    			
	    			var idbtn = promise_id;
	    			var content = 
	    				'<div onClick="bbb('+promise_id+','+photoid+')">'+
	    				'	<div>'+proname+
	    				'	</div>'+
	    				'	<div>'+ allimg+
	    				'	</div>'+
	    				'</div>';
	    				
	    			infowindow = new daum.maps.InfoWindow({
	    		        content: content
	    		        // 인포윈도우에 표시할 내용
	    		        
	    	    	});
	    			infowindow.open(map, marker);
					
						    		
	    			
	    		}
	    	});
	    	
	    };
	}//markeroverListner
	
	//리플 모달 띠우기
	function bbb(promise_id, photoid){
		alert(photoid);
		$.ajax({
			url: 'allreply/'+promise_id,
			type: 'POST',
    		contentType: 'application/json',
    		success : function(data){
    			
    			/* <div class='container'>
		 		<div class="form-group">
				    <label for="rep">댓글 입력</label>
				    <input class="form-control input-sm" id="${list.yphoto_id}" type="text">
				    <button type="button" class="btn btn-link" onClick="reply(${list.yphoto_id})">댓글입력</button>
					<input type="hidden" id="ypromise_id" value="${list.ypromise_id }">
				 </div>
				<table class='table table-striped'>
				    <thead>
				      <tr>
				        <th>이름</th>
				        <th>내용</th>
				        <th>id</th>
				      </tr>
				    </thead>
				    <tbody class="${list.yphoto_id}">
				    	<c:forEach var="replyList" items="${yreplyList}">
				    		<c:if test="${list.yphoto_id == replyList.yphoto_id}">
				    		<tr>
				    			<td>${replyList.yname}</td>
				    			<td>${replyList.ytitle}</td>
				    			<td>${replyList.yreply_id}</td>
				    			<td>
					    			<c:if test="${replyList.yaman_id == '1' }">
						    			<span class="glyphicon glyphicon-remove"></span>
						    		</c:if>
					    		</td>
				    		</tr>
				    		</c:if>
				    	</c:forEach>
				    	
				 	</tbody>
			 	</table>
			 </div> */
    			
    		}
		});
		$("#imgdetail").modal();
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener() {
	    return function() {
	      /*   infowindow.close(); */
	    };
	}
	
	function aaa(promise_id){
		return function(){
			$("#inputImg").modal();
			$("#input_promiseId").val(promise_id);
			$.ajax({
				url: "listMyImg/1",
				type: "POST",
				data : JSON.stringify({
					"ypromise_id" : promise_id
				}),
				dataType:'json',
				contentType: "application/json",
				success: function(data){
					for( i=0; i< data.length; i++){
						images = '<div class="container">'+'<img src="/cherry/resources/images/' +data[i].yphotofile +'"class='+'"img-thumbnail"'
						+'alt="Cinque Terre"'+'width="304"'+'height="236"></div>'
						$("#imgList").append(images);
					}
				}
				
			});
		};
	}

/* <!--사진 입력  --> */

	var fileCollection = new Array();
	$('#images').on('change',function(e){
		var files = e.target.files;
		$.each(files, function(i, file){
			fileCollection.push(file);
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e){
				$('#images-to-upload').append('<img src="'+e.target.result+'"> ');
			
			};
		});
	});
	

	$('#imgbtn').on('click', function(){
		var form = new FormData(document.getElementById('uploadForm'));
		$.ajax({
			url:'photoupload/1',
			data: form,
			processData:false,
			contentType:false,
			type:'POST',
			dataType: 'text',
			success: function(data){
				alert("성공");
				for( i=0; i< data.length; i++){
					images =+ '<div class="container"> <img src="/cherry/resources/images' +data[i].yphotofile +'"'+'class="img-thumbnail" alt="Cinque Terre" width="304" height="236"></div>'
				}
				$("#hereToimg").append(images);
			}/* ,
		error: function(data, status, error){
			alert("실패"+request);
			alert(error);
			    }
 */
		});
	});
</script>

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


</body>
</html>