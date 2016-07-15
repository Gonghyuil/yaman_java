/*채팅관련 스크립트*/
	/* 채팅 새창 열기 함수 */
		
		var windowName, n=0;
 		
 		function newWindow(value){
 			n = n+1;
 			windowName = value + n;

 		}
 		
 		function RoomListOpenWin(roomname){
 			
 			var url = "http://192.168.56.115:4000/" + roomname + "/" + $('#loginNAME').val() + "/" + $('#loginId').val();
 			
 			newWindow("YAMAN-CHAT");
 			
 			window.open(url,windowName,"width=405px, height=730px, toolbar=no, menubar=no, scrollbars=no, location=no");  
 		}
 		
 		function deleteroom(ychatlist_id){
 			$.ajax({
 				url : "http://192.168.56.115:8890/cherry/deleteRoom/" + ychatlist_id,
 				type : "get",
 				dataType: "json",
 				success: function(json, textStatus, jqXHR){
 					alert(json.deleteMessage);
 					delmo = "."+ychatlist_id;
 					$("tr").remove(delmo);
 				},
 				error: function(jqXHR, textStatus, errorThrown){
 					alert("채팅방 삭제 에러");
 				}
 			});
 		} 
 		
 		/*setInterval(function(){*/
			$.ajax({
				url : "http://192.168.56.115:8890/cherry/message",
				type: "post",
				data: "yaman_two=" + $('#loginId').val(),
				dataType: "json",
				success: function(json, textStatus, jqXHR){
						$('#invite-list tr:nth-child(1)').nextAll().remove();
						var i;
						if(json.getMessage.length == 0){
							$('#invite-list').append(
								'<tr class = table-hover>' +
								'<td colspan="5">' +
								'<span id="no_chat_message">채팅 초대 메세지가 없습니다.<span>' +
								'</td>' +
								'</tr>'
							);
						}
						for(i = 0; i < json.getMessage.length; i++){
						$('#invite-list').append(
								'<tr class = table-hover>' +
								'<td>' +
								 (i+1) +
								'</td>' +
								'<td>' +
								json.getMessage[i].yname +
								'</td>' +
								'<td>' +
								json.getMessage[i].roomname +
								'</td>' +
								'<td>' +
								'<button class="btn btn-default" onclick="' +
								'yes(' +
								json.getMessage[i].mid +
								');"' +
								'> 수락 </button>' +
								'</td>' +
								'<td>' +
								'<button class="btn btn-default" onclick="' +
								'nope(' +
								json.getMessage[i].mid +
								');"' +
								'> 거절 </button>' +
								'</tr>'
						);
					}
				},
				
			});
	/*	},1000);*/
		 
		 	function yes(mid){
		 		alert("수락");
				$.ajax({
					url : "http://192.168.56.115:8890/cherry/chat/yes/" + mid + "/"+ $('#loginId').val(),
					type : "get",
					dataType: "json",
					success: function(json, textStatus, jqXHR){
						alert(json.yesMessage);
						
						var lastChatRoomList = $('#myChatRoomList tr:last-of-type').attr('class');
						alert(lastChatRoomList);
	 					var delmo = "."+lastChatRoomList;
	 					
	 					
	 					$('#myChatRoomList').append(
		 						'<tr class = "' + mid + ' warning" style="cursor: pointer;">' +
	 							'<td onClick="RoomListOpenWin(\''+json.roomname+'\');">' +
	 								json.roomname	+
	 							'</td>' +
	 							'<td>' + 
	 							json.yname +
	 							'</td>' +
	 							'<td>' +
	 								'<button type="button" class="btn btn-default btn-lg" onClick=" + deleteroom(\'' + mid +'\');">' +
	 									'<span class = "glyphicon glyphicon-remove-circle" aria-hidden="true"></span>' +
	 								'</button>' +
	 							'</td>' +
	 						'</tr>'
	 					);
						
						newWindow("YAMAN-CHAT");
						
						var url = "http://192.168.56.115:4000/" + json.roomname + "/" + $('#loginNAME').val() + "/" + $('#loginId').val();
					    window.open(url,windowName, "width=405px, height=730px, toolbar=no, menubar=no, scrollbars=no, location=no");  
					},
					error : function(jqXHR, textStatus, errorThrown){
						alert("채팅 수락 실패");
					}
				});
		 	}
		
			function nope(mid){
				alert("거절");
				
				$.ajax({
					url : "http://192.168.56.115:8890/cherry/chat/nope/" + mid,
					type : "get",
					dataType: "json",
					success: function(json, textStatus, jqXHR){
						alert(json.nopeMessage);
					},
					error : function(jqXHR, textStatus, errorThrown){
						alert("채팅 초대 거절실패");
					}
				});
			}

	/*채팅 방 이름 중복 검사 함수*/
	$(function(){
		var dialog;
	
		dialog = $("#chat-room").dialog({
			autoOpen: false,
   	     show: {
   	         effect: "blind",
   	         duration: 1000
   	     },
   	     hide: {
   	         effect: "blind",
   	         duration: 1000
   	     },
   	     height:300,
   	     width: 400,
   	     modal: true,
   	     buttons: {
   	         "채팅방입장": function(){
   	         	if($('#room-okay').val() == 'okay'){
   	             	openWin();
   	             	dialog.dialog("close");
   	         	}else if($('#room-okay').val() == 'no'){
   	         		alert("방 이름이 중복되어서는 안됩니다.");
   	         		$('#room-name').focus();
   	         	}else{
   	         		alert("방 이름 검색을 하셔야 합니다.");
   	         		$('#room-name').focus();
   	         	}
   	         },
   	         Cancel: function() {
   	             dialog.dialog( "close" );
   	         }
   	     },
   	     close: function() {
   	         dialog.dialog("close");
   	     }
		});
		$( "#chat_btn" ).button().on( "click", function() {
		      dialog.dialog( "open" );
		});
	});

	/*채팅방이름 validation*/
	$(function(){
	
		$('#check-room-name').on('click',function(){
			var rname = $('#room-name').val();
			if(rname.length == 0){
				alert("방 이름을 입력하세요");
				return -1;
			}
			$.ajax({
				url: 'http://192.168.56.115:4000/' + rname,
				type: 'get',
				dataType : 'jsonp',
				jsonpCallback: 'callback',
				success: function(json,textStatus,jqXHR){
					alert(json.message);
					var okay = json.message.substring(5,8);
					if(okay == "중복"){
						$('#room-okay').val('no');
					}else{
						$('#room-okay').val('okay');
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert("실패");
				}
			});
		});
	});
	
	//채팅 윈도우창 열기
	function openWin(){
		var roomname = $('#room-name').val();
	$.ajax({
		
		url : "http://192.168.56.115:8890/cherry/chat/insert-roomname/"+ $('#loginId').val() + "/" + $("#id").val() + "/" + roomname,
		type : "get",
		dataType: "json",
		success: function(json, textStatus, jqXHR){
			$('#room-name').val('');
			$('#room-okay').val('');
			alert(json.roomname);
			$('#myChatRoomList').append(
						'<tr class = "' + json.ychatList_id + ' warning" style="cursor: pointer;">' +
							'<td onClick="RoomListOpenWin(\'' + json.roomname + '\');">' +
								json.roomname	+
							'</td>' +
							'<td>' +
								json.yname +
							'</td>' +
							'<td>' +
								'<button type="button" class="btn btn-default btn-lg" onClick="deleteroom(\'' + json.ychatList_id +'\');">' +
									'<span class = "glyphicon glyphicon-remove-circle" aria-hidden="true"></span>' +
								'</button>' +
							'</td>' +
						'</tr>'
					);
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert("에러");
		}
	});
	
	newWindow("YAMAN-CHAT");
	
	var url = "http://192.168.56.115:4000/" + $('#room-name').val() + "/" + $('#loginNAME').val() + "/" + $('#loginId').val();
	   	window.open(url,windowName,"width=405px, height=730px, toolbar=no, menubar=no, scrollbars=no, location=no");  
}

	