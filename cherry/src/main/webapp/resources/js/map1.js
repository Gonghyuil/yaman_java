		$("body").mousemove(function(){
			relayout();
		});
	
	function relayout() {    
		// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		map.relayout();
	}
		
	var mapContainer = document.getElementById('map3'), // 지도를 표시할 div 
	mapOption = { 
	    center: new daum.maps.LatLng(37.56772544008007,126.9800329431779), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	var lat = [];
	var lng = [];
	var proname = [];
	var prodate =[];
	var promise_id = [];
	var points = [];
	
	var bounds = new daum.maps.LatLngBounds(); /*범위재설정  */
	$("#getPosition").on("click",function(){
		for(i=0; i< $('tbody tr').length; i++){
			promise_id[i] = $('tbody tr:eq('+i+') td:eq(0)').text();
			proname[i] = $('tbody tr:eq('+i+') td:eq(1)').text();
			prodate[i] = $('tbody tr:eq('+i+') td:eq(2)').text();
			lat[i] = $('tbody tr:eq('+i+') td:eq(3)').text();
			lng[i] = $('tbody tr:eq('+i+') td:eq(4)').text();
			
			if( lat[i] <= 40 && 30 <= lat[i] ){
				if( 126 < lng[i] && lng[i] < 130 ){
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
			    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, proname[i], promise_id[i],prodate[i]));
			    daum.maps.event.addListener(marker, 'click', aaa(promise_id[i]));
			    
			}//마커의 이미지 for
			map.setBounds(bounds);
			
 	});
	
	
	Map = function(){
	      this.map = new Object();
	    };
	    Map.prototype = {
	      put : function(key, value){
	        this.map[key] = value;
	      },
	      get : function(key){
	        return this.map[key];
	      },
	      containsKey : function(key){
	        return key in this.map;
	      },
	      containsValue : function(value){
	        for(var prop in this.map){
	          if(this.map[prop] == value) return true;
	        }
	        return false;
	      },
	      isEmpty : function(key){
	        return (this.size() == 0);
	      },
	      clear : function(){
	        for(var prop in this.map){
	          delete this.map[prop];
	        }
	      },
	      remove : function(key){
	        delete this.map[key];
	      },
	      keys : function(){
	        var keys = new Array();
	        for(var prop in this.map){
	          keys.push(prop);
	        }
	        return keys;
	      },
	      values : function(){
	        var values = new Array();
	        for(var prop in this.map){
	          values.push(this.map[prop]);
	        }
	        return values;
	      },
	      size : function(){
	        var count = 0;
	        for (var prop in this.map) {
	          count++;
	        }
	        return count;
	      }
	    };
    var over1;
    var over2;
    
    var fp = new Map();
	var infowindow;
	var photoid = [];
	var overlay = [];
	var mapOb = new Map();
	function makeOverListener(map, marker, proname, promise_id, prodate) {
	    return function() {
	    $("#carousel-inner").empty();
	    var allimg = [];
	    	$.ajax({
	    		url : 'photosAboutPromise/' +promise_id,
	    		type: 'POST',
	    		contentType: 'application/json',
	    		success : function(data){
	    			for( i=0; i< data.length; i++){
	    				allimg += '<div float:left; style="float: left;">'+'<img src="' +data[i].yphotofile +'"class='+'"img-thumbnail"'
						+'style= "width: 60px; height:60px;"></div>'
						
						var replyFrom = 
							'<img src="' +data[i].yphotofile +'" style="height:35em;">'+
							'<div>'+
								'<label for="rep" style="margin-left:3.5em; margin-top:1em;">'+
						    	'댓글<input style="width:38em; " class="form-control input-sm"' + 'id="'+data[i].yphoto_id+'"'+ 'type="text" onKeyPress="if (event.keyCode==13) {reply(' +data[i].yphoto_id +')}">'+
						    	'</label>'+
						    	'<button class="btn btn-link"' +'onClick="reply('+data[i].yphoto_id +')" >댓글입력</button>'+
								'<input type="hidden"'+ 'id="ypromise_id"' + 'value="'+ data[i].ypromise_id+'">'+
								'<div id="a'+data[i].yphoto_id +'">'+
							'</div>'+
							'<div class="container">'+
		    					'<table class="table table-striped" style="width:40em;">'+
		    						'<thead>'+
		    							'<tr>'+
		    								'<th style="width:5em;">이름</th><th style="width:17em;">내용</th><th style="width:5em;">삭제</th>'+
		    							'</tr>'+
		    						'</thead>'+
		    						'<tbody class="'+ data[i].yphoto_id+'">'+
		    						'</tbody>'+
		    					'<table>'+
		    				'<div>';
						
						if( i == 0){
							var active= '<div class="item active">'+ replyFrom +'<div>';
							photoid[i] = data[i].yphoto_id;
							$("#carousel-inner").append(active);
						}else{
							var item =	'<div class="item">'+ replyFrom +'<div>';
							photoid[i] = data[i].yphoto_id;
							$("#carousel-inner").append(item);
						}
						
						
	    			}
	    			var content1 = '<div class="wrap">' + 
	                '    <div class="info" id="k'+photoid[i]+'">' + 
	                '        <div class="title">' + proname+ "(" + prodate +")"+
	                '            <div class="close" onclick="closeOverlay('+photoid[i] +')" title="닫기"></div>' + 
	                '        </div>' + 
	                '        <div class="body" id="eee">' + allimg+
	                '        </div>' + 
	                '    </div>' +    
	                '</div>';

	    			over1= photoid[i];
	    			over2= photoid[i];
	    			
	    		      if(fp.isEmpty()){
	    		    		  
	    		    	over2 = new daum.maps.CustomOverlay({
	    		    	        content: content1,
	    		    	        map: map,
	    		    	        position: marker.getPosition()       
	    		    	    });
	    		    		over2.setMap(map);
	    		    	  
	    		        fp.put(over1, over2);

	    		      }else{
	    		        for(i=0; i<fp.size(); i++){
	    		          if( !fp.containsKey(over1) ){
	    		        	  over2 = new daum.maps.CustomOverlay({
	  	    		    	        content: content1,
	  	    		    	        map: map,
	  	    		    	        position: marker.getPosition()       
	  	    		    	    });
	  	    		    		over2.setMap(map);
	  	    		    	  
	  	    		        fp.put(over1, over2);
	    		          }
	    		        }
	    		      }
	    			
	    			
	    			$("#eee").on("click",function(){
	    				$("tbody").empty();
	    				detail1(promise_id,photoid);
	    			});
	    			
	    			
	    			/*daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));*/
	    			
	    		}
	    	});
	    	
	    };
	}//markeroverListner

	
	function closeOverlay(over1) {
		fp.get(over1).setMap(null);   
		fp.remove(over1);
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	    	setTimeout("infowindow.close();", 500);
	    };
	}
	//리플 모달 띠우기
	function detail1(promise_id, photoid){
		$("tbody").empty();
		$.ajax({
			url: 'allreply/'+promise_id,
			type: 'POST',
			dataType: 'JSON',
    		contentType: 'application/json',
    		success : function(data){
    			for(i=0; i< data.length; i++){
    				for(j=0; j< photoid.length; j++){
    					if( photoid[j] == data[i].yphoto_id ){
    						var div ='<tr  id="deltr'+data[i].yreply_id+'">';
    			    			div += '<td style="text-align:center;">' +data[i].yname +'</td>';
    			    			div +=	'<td>' +data[i].ytitle+'</td>';
    			    			if( $("#loginId").val() == data[i].yaman_id ){
    			    				div += '<td><span class="glyphicon glyphicon-remove" onclick="delrep('+data[i].yreply_id +')"></span></td>';
    			    			}else{
    			    				div +='<td></td>'
    			    			}
    			    			
    			    			div += '</tr>';
    							
    			    			var div1 = "."+data[i].yphoto_id;
    		    				$(div1).append(div); 
    					}//if
    				}//for j
    			}//for i
		$("#imgdetail").modal();
    		}
		});
	}//detail
	
	//선택한 리플 삭제
	function delrep(yreply_id){
		$.ajax({
			url: 'delrep/'+yreply_id,
			type: 'POST',
			dataType: 'JSON',
    		contentType: 'application/json',
    		success : function(data){
    			alert("삭제 되었습니다.");
    			var deltr = "#deltr"+yreply_id;
    			$(deltr).remove();
    		}
		});
	}
	

	//내가올린 사진 보기
	function aaa(promise_id){
		return function(){
			$("#inputImg").modal();
			$("#imgList").empty();
			$('#images-to-upload').empty();
			$("#input_promiseId").val(promise_id);
			$("#images").val('');
			$.ajax({
				url: 'listMyImg/' +$('#loginId').val(),
				type: 'POST',
				data : JSON.stringify({	
					"ypromise_id" : promise_id
				}),
				dataType:'JSON',
				contentType: "application/json",
				success: function(data){
					for( i=0; i< data.length; i++){
						images = '<div float:left; style="float: left;" id="d'  +data[i].yphoto_id +'"><img src="' +data[i].yphotofile 
						+'" class='+'"img-thumbnail"'
						+' style= " width:18em; height:15em; margin-left: 1.5em;">'
						+'<a href="#"><span class="glyphicon glyphicon-remove"'+ 'onclick="imgDelete('+data[i].yphoto_id+')"></span></a>'
						+'</div>' ;
						$("#imgList").append(images);
					}
					$("#images").val('');
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
				$('#images-to-upload').append('<img src="'+e.target.result+'" width="50" height="50">');
			};
		});
	});

	
	//이미지 업로드
	$('#imgbtn').on('click', function(){
		var form = new FormData(document.getElementById('uploadForm'));
		$.ajax({
			url:'photoupload',
			data: form,
			processData:false,
			contentType:false,
			type:'POST',
			dataType: 'JSON',
			success: function(data){
				$('#images-to-upload').empty();
				$("#imgList").empty();
				alert("성공");
				for( i=0; i< data.length; i++){
					var images = '<div float:left; style="float: left;" id="d' +data[i].yphoto_id +'">'
					+'<img src="' +data[i].yphotofile +'"'
					+'class="img-thumbnail" style= " width:18em; height:15em; margin-left: 1.5em;">'
					+'<a href="#"><span class="glyphicon glyphicon-remove"'+ 'onclick="imgDelete('+data[i].yphoto_id+')"></span></a>'
					+'</div>' ;
					$("#imgList").append(images);
				}
				$("#images").val('');
			} ,
			error: function(data, status, error){
				alert("실패");
				alert(error);
			    }
 
		});
	});
	
	//리플달기
	function reply(yphoto_id){
		yreply= $('input[id="'+yphoto_id+'"]').val();
		ypromise_id =$("#ypromise_id").val();
	 	var div2 = "."+yphoto_id;
		$.ajax({
			url:'reply',
			type:'post',
			dataType:'json',
			contentType: "application/json",
			data: 
				JSON.stringify({
					"yphoto_id"		: yphoto_id,
					"ypromise_id"	: ypromise_id,
					"ytitle"		: yreply,
					"yaman_id"		: $("#loginId").val()
				}),
			success:function(data){
				$(div2).prepend(
						'<tr id="deltr'+data.yreply_id+'">'+
				     	"<td>"+data.yname +"</td>"+
				     	"<td>"+data.ytitle +"</td>"+
				     	'<td><span class="glyphicon glyphicon-remove" onclick="delrep('+data.yreply_id +')"></span></td>'+
					"</tr>"
				);
			}
		});
	}
	
	/*자동 사진 넘김 방지  */
	$('.carousel').carousel({
		  interval: false
	});
	
	//사진삭제
	function imgDelete(yphoto_id){
		$.ajax({
			url:'imgDelete/' +yphoto_id,
			type: 'post',
			dataType: 'JSON',
			success : function(data){
				alert("삭제되었습니다.");
				delId = "#d"+yphoto_id;
				$(delId).remove();
			}
		});
	}
	
