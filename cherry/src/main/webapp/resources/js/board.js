function send(){
		$.ajax({
			url: 'http://192.168.56.115:8890/cherry/board_write',
			type: 'post',
			data: 
				'ysubject=' + $('#ysubject').val() + 
				'&ycontent=' + $('#ycontent').val() +
				'&yaman_id=' + $('#loginId').val(),
			dataType: 'json',
			success : function(json, textStatus, jqXHR){
				alert(json.boardMessage);
				
				$("#boardSender").modal('hide');
				
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("불만사항 접수 실패");
			}
		});	
	}
function sure_content() {
		if (('#sendOk').val = "완료") {
			alert("이 내용이 맞습니까?");
			$('#sendOk').val("수정");
			$('#ysubject').attr("readonly", true);
			$('#ycontent').attr("readonly", true);
			$('#sendOk').attr("onClick", "no_content();");
			$('#send').show();
		}
	}
function no_content() {
		if (('#sendOk').val = "수정") {
			alert("수정하십시오");
			$('#sendOk').val("완료");
			$('#ysubject').attr("readonly", false);
			$('#ycontent').attr("readonly", false);
			$('#sendOk').attr("onClick", "sure_content();");
			$('#send').hide();
		}
	}

function gogo(){
	$('#ysubject').val('');
	$('#ycontent').val('');
	if (('#sendOk').val = "수정") {
		$('#sendOk').val("완료");
		$('#ysubject').attr("readonly", false);
		$('#ycontent').attr("readonly", false);
		$('#sendOk').attr("onClick", "sure_content();");
		$('#send').hide();
	}
}

