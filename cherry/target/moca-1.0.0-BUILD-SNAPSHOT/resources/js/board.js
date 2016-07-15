function send(){
		alert("이메일로 답변드리겠습니다.");		
	}
	function sure_content() {
		if (('#sendOk').val = '완료') {
			alert("이 내용이 맞습니까?");
			$('#sendOk').val('수정');
			$('#ysubject').attr("readonly", true);
			$('#ycontent').attr("readonly", true);
			$('#sendOk').attr("onClick", "no_content();");
			$('#send').show();
		}
	}
	function no_content() {
		if (('#sendOk').val = '수정') {
			alert("수정하십시오");
			$('#sendOk').val('완료');
			$('#ysubject').attr("readonly", false);
			$('#ycontent').attr("readonly", false);
			$('#sendOk').attr("onClick", "sure_content();");
			$('#send').hide();
		}
	}