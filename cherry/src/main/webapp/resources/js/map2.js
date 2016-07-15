
var lat2;
var lng2;
var promisename2;
		function promiseDetail(ypromise_id){
			
			$("#promiseMapInfo").modal();
			
			$.ajax({
				url:'/cherry/promiseMapInfoDetail/' +ypromise_id,
				type: 'post',
				dataType:'json',
				success:function(data){
					$("#yproname3").val(data.yproname);
					$("#yprodata3").val(data.yprodata);
					$("#yprostart3").val(data.yprostart);
					$("#yproloc3").val(data.yproloc);
					
					lat2 = data.yprolocx;
					lng2 = data.yprolocy;
					promisename2 =data.yproname;
					
					setTimeout("relayout2()", 300);
					setTimeout("panTo2(lat2,lng2)", 500);
					
				}			
			});
		}

		
/*$("body").mousemove(function(){
	relayout2();
});	*/	


//위치 배열
var positions2 =[];

//지도를 표시할 div
var mapContainer2 = document.getElementById('infoMap'),
	mapOption2 = {
		center : new daum.maps.LatLng(37.56772544008007,126.9800329431779), //지도의 중짐섬 (DB에서 위치가져오기)
		relvel:	3
	};
	
//지도 생성
var map2 = new daum.maps.Map(mapContainer2, mapOption2);

//지도의 중심 위치를 이동
function panTo2(lat2,lng2){
	
	var markerPosition2 = new daum.maps.LatLng(lat2,lng2); 
	
	
	var marker2 = new daum.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: markerPosition2
	}); 
	// 지도에 마커를 표시합니다
	marker2.setMap(map2);
	
	
	//현재좌표를 위치배열에 추가
	positions2.push(markerPosition2);

	//마커 하나를 지도에 위에 표시합니다.
	/* addMarker(new daum.maps.LatLng(33.450701, 126.570667)); */
	var marker2= new daum.maps.Marker({
		position : markerPosition2,//나타낼 위치
		
	});
	
	
	
	var infoContent2 = "<div> 약속 위치닙니다.</div>",
	infoRemovable2 = true;


	var info = new daum.maps.InfoWindow({
		map : map2, //표시할지도
		position : new daum.maps.LatLng(lat2, lng2),
		content : infoContent2,//나타낼 내용
		removalble : infoRemovable2
		
	});
	
	info.open(map2,marker2); 
	map2.setCenter(markerPosition2);
	map2.panTo(markerPosition2);
	
}	

//현재좌표를 저장할 변수
var mylat;
var mylon;
//현재 좌표 얻어오기
function clickMyPostion2(){

	if (navigator.geolocation) {
		
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var glat2 = position.coords.latitude, // 위도
	            glon2 = position.coords.longitude; // 경도
	        
	        mylat = glat2;
	        mylon = glon2;
	        
	        var glocPosition2 = new daum.maps.LatLng(glat2, glon2), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message2 = '<div style="padding:5px;">여기있음</div>'; // 인포윈도우에 표시될 내용입니다
	       	alert(mylat +',' +mylon);

	        //현재위치를 위치 배열에 추가
	       	positions2.push(glocPosition2);
	       
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker2(glocPosition2, message2);
	        
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
	        message2 = 'geolocation을 사용할수 없어요..'
	     alert("실패");
	    displayMarker(locPosition, message2);
	}
}

//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker2(glocPosition2, message2) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map2, 
        position: glocPosition2
    }); 
    
    var iwContent = message2, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map2, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map2.setCenter(glocPosition2);    
    
}    

var bounds2 = new daum.maps.LatLngBounds();    

function setBounds2(){
	
	var i, marker;
	for (i = 0; i < positions2.length; i++) {
	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	    marker = new daum.maps.Marker({ position : positions2[i] });
	    marker.setMap(map2);
	    // LatLngBounds 객체에 좌표를 추가합니다
	    bounds2.extend(positions2[i]);
	}
	
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map2.setBounds(bounds2);
}

		
 		function relayout2(){    
		   
		    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		    map2.relayout();
		}  
 		
 		function ppp(){
 		
 			if (navigator.geolocation) {
 			navigator.geolocation.getCurrentPosition(function(position) {
 		        
 		        var glat2 = position.coords.latitude, // 위도
 		            glon2 = position.coords.longitude; // 경도
 		        
 		        mylat = glat2;
 		        mylon = glon2;
 			});
 		}
 		}
 
 		var url ;
 		//
 		function find(){
 			setTimeout("ppp()", 200);
			 /*var url = "http://map.daum.net/link/to/"+promisename2+"," +lat2 +"," +lng2*/
 			setTimeout("windowOpen()", 700);
		}
 		
 		function windowOpen(){
 			
 			url = "http://map.naver.com/index.nhn";
			url += 	"?slng=" +mylon;
		 	url += 	"&slat=" +mylat;
		 	url += 	"&stext= 내 현재 위치";
		 	url += 	"&elng="+lng2;
		 	url += 	"&elat="+lat2 ;
		 	url += 	"&etext="+promisename2;
		 	url += 	"&menu=route";
		 	url += 	"&pathType=1";
			 window.open(url);
		}
