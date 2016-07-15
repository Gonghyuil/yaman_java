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
				calendar += '				<td class="' + dateString[j] + '"><button id = "'+dateNum+'" class="btn btn-default btn-lg" value="'+dateNum+'" onClick="pdate('+currentYear + currentMonth + dateNum+');">' + dateNum + '</button></td>';
			}
			calendar += '			</tr>';
		}
		
		calendar += '			</tbody>';
		calendar += '		</table>';
		
		kCalendar.innerHTML = calendar;
	}
	 
	//날짜별 ajax 통한 약속 리스트
	 function pdate(date){
		 $("#myModal1").modal();
				
		$.ajax({
			url : "http://192.168.56.115:8890/cherry/yprodate/"+date,
			type : "get",
			dataType : "json",
			contentType : "application/json",
			success : function(data, textStatus, jqXHR){
				
				    $('#listByDate tbody').children().remove();
				
				    $("#myModal1").modal();
				
				if( data.promiseListByDate.length < 1 ){
					alert(" 이날의 일정이 없습니다." );
				}else{
					for(var i = 0 ; i < data.promiseListByDate.length ; i++){
						$('#listByDate tbody').append(
							'<tr>' +
							'<td>' +
							(parseInt(i)+1) +
							'</td>' +
							'<td><input type="text" data-toggle="modal" data-target="#myModal1" id="modal" onClick="promiseDetail('+data.promiseListByDate[i].ypromise_id+')" value="'+data.promiseListByDate[i].yproname+'" style="border:0px; color:#2226CA; fontsize:14pt; font-weight:bold"></td>' +
							'<td>' + data.promiseListByDate[i].yprodate +'</td>' +
							'<td>' +data.promiseListByDate[i].yprostart +'</td>' +
							'<td>' +data.promiseListByDate[i].yproend +'</td>' +
							'<td>' +data.promiseListByDate[i].yproloc +'</td></tr>' 
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

//모달 내 새일정 추가HTML
	$(function(){
		$("#addPromise1").on("click", function(){
			alert("새일정 추가 AJAX");
			var url = "http://192.168.56.115:8890/cherry/write/";
			$.ajax({
				url : url ,
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
					//alert("url : " + url );
					alert("새일정추가후 약속이름 : " + data.yproname + ", 약속날짜 : " +data.yprodate);
					for(var i = 0; i < data.promiseListByDate.length; i++){
					$('#listByDate tbody').append(
							'<tr>'+
							'<td>' +(parseInt(i)+1)+'</td>' +
							'<td><input type="text" data-toggle="modal" data-target="#myModal1" id="modal" onClick="promiseDetail('+data.promiseListByDate[i].ypromise_id+')" value="'+data.promiseListByDate[i].yproname+'" style="border:0px; color:#2226CA; fontsize:14pt; font-weight:bold"></td>' +
							'<td>' + data.promiseListByDate[i].yprodate +'</td>' +
							'<td>' + data.promiseListByDate[i].yprostart +'</td>' +
							'<td>' + data.promiseListByDate[i].yproend +'</td>' +
							'<td>' + data.promiseListByDate[i].yproloc +'</td>'+
							'</tr>' 
				);
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert("실패");
				}
			});
		});
	});

	//일정 추가시 기존 일정 중복 알림
	function getPromise(){
		alert("일정 추가시 기존 일정 중복 알림");
		yprodate = $("#yprodate1").val();
		if ( yprodate == null ){ 
			yprodate = $("#yprodate2").val();
			alert("yprodate2 : " +yprodate); 
		}
		alert("일자별 일정 중복체크 ajax");
		document.getElementById("yprodate1").onmouseover=function(){
			this.style.backgroundColor = 'yellow';
		};
		document.getElementById("yprodate1").onmouseout=function(){
			this.style.backgroundColor = 'pink';
		};
		$.ajax({
			url : "http://192.168.56.115:8890/cherry/checkPromise/" + yprodate +"/" + $('#yprostart').val() ,
			type : "get",
			contentType : "application/json",
			success : function(data, textStatus, jqXHR){
				if(data.length > 0){
					q = confirm(" 동일한 날에 일정이 존재합니다. 일정을 추가하시겠습니까? ");
					if( q == true){
						alert("일정 추가를 계속합니다.");
					}else{
						alert("일정 등록을 취소합니다.");
					}
				}	
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("일정 중복 체크 실패 : yprodate1 - "+ yprodate);
			}
		});
	};
	

	//일정 수정시 기존 일정 중복 알림
	function getPromise2(yprostart){
		alert("일정 추가시 기존 일정 중복 알림");
		yprodate = $("#yprodate2").val();
			alert("yprodate2 : " +yprodate); 
		alert("일자별 일정 중복체크 ajax");
		document.getElementById("yprodate1").onmouseover=function(){
			this.style.backgroundColor = 'yellow';
		};
		document.getElementById("yprodate1").onmouseout=function(){
			this.style.backgroundColor = 'pink';
		};
		$.ajax({
			url : "http://192.168.56.115:8890/cherry/checkPromise/" + yprodate +"/" + yprostart ,
			type : "get",
			contentType : "application/json",
			success : function(data, textStatus, jqXHR){
				if(data.length > 0){
					q = confirm(" 동일한 날에 일정이 존재합니다. 일정을 추가하시겠습니까? ");
					if( q == true){
						alert("일정 추가를 계속합니다.");
					}else{
						alert("일정 등록을 취소합니다.");
					}
				}	
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("일정 중복 체크 실패 : yprodate2 - "+ yprodate);
			}
		});
	};
 
// 모달 내 일정 수정 HTML
	$(function(){
  		$("#submit1").on("click", function(){
     	 alert("일정 수정 AJAX");
	      $.ajax({
  	       url : "http://192.168.56.115:8890/cherry/update_promise",
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
  	          
  	          var ypromise_id = data.ypromise_id;
  	          var pname = "#pname"+ypromise_id;
  	          $(pname).text(data.yproname);
  	          var pdate = "#pdate"+ypromise_id;
  	          $(pdate).text(data.yprodate);
  	          var pstart = "#pstart"+ypromise_id;
  	          $(pstart).text(data.yprostart);
  	          var pend = "#pend"+ypromise_id;
  	          $(pend).text(data.yproend);
  	          var ploc = "#ploc"+ypromise_id;
  	          $(ploc).text(data.yproloc);
  	          
  	       },
  	       error: function(jqXHR, textStatus, errorThrown){
  	          alert("모달 내 일정 수정 실패");
  	       }
  	    });
  	 });
});

//약속 삭제하기
function deletePromise(ypromise_id){
	alert("약속을 삭제합니다.");
	id= "#promise" +ypromise_id ;
	alert(id);
	$.ajax({
		url : "http://192.168.56.115:8890/cherry/deletePromise/"+ypromise_id ,
		type : "get",
		contentType : "application/json",
		success : function(){
			alert('삭제되었습니다.');
			$(id).remove();
			
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
      url : "http://192.168.56.115:8890/cherry/ypromise/" + ypromise_id ,
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

function earlyPromise(){
	var yaman_id = $('#loginId').val();
	
	$.ajax({
		url : "http://192.168.56.115:8890/cherry/earlyProm/" + yaman_id,
		type : "get",
		dataType : "json",
		success : function(data, textStatus, jqXHR){
			$('#fastPromise tbody').children().remove();
			if(data.promiselist.length == 0){
				$('#fastPromise tbody').append(
					'<tr>' + 
					'<td>' +
					'일정이 없습니다.' +
					'</td>' +
					'</tr>'
				);
			}else{
				for(var i = 0; i < data.promiselist.length; i++){
					
					$('#fastPromise tbody').append(
						'<tr id="promise' +
						data.promiselist[i].ypromise_id +
						'">' +
						'<td>' + (i+1) + '</td>' +
						'<td id="pname' + data.promiselist[i].ypromise_id + '">' + data.promiselist[i].yproname + '</td>' +
						'<td id="pdate' + data.promiselist[i].ypromise_id + '">' + data.promiselist[i].yprodate + '</td>' +
						'<td id="pstart' + data.promiselist[i].ypromise_id + '">' + data.promiselist[i].yprostart + '</td>' +
						'<td id="pend' + data.promiselist[i].ypromise_id + '">' + data.promiselist[i].yproend +
						'<td id="ploc' + data.promiselist[i].ypromise_id + '">' + data.promiselist[i].yproloc + '</td>' +
						'<td><button type="button" class="btn btn-success" onClick="updatePromise(\'' + data.promiselist[i].ypromise_id + '\');"> 수정 </button></td>' +
						'<td><button type="button" class="btn btn-warning" onClick="deletePromise(\'' + data.promiselist[i].ypromise_id + '\');"> 삭제 </button></td>'
					);
				}
						
			}
		}
	});
}