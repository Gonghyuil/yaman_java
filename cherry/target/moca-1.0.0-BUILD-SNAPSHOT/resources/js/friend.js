 /* 친구모달 function  */

   function detail( yface, yname, yschool, ycompany, yphone, yemail, yhello, yok, yaman_id){
      $("#myFriendModal").modal();
      
      $("#face").empty();
      var img = '<img src="resources/images/'+yface+'" style="width: 15em; height: 15em;">';
      $("#face").append(img);
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
      
   /* 친구 목록 탭  - 친구 검색  */
   /* 친구 검색 */
   /*/cherry/myFriend/search/1*/
   $(document).ready(function(){
      $("#searchName").keyup(function(){
         var loginId = $("#loginId").val();
         $.ajax({
            url : "search/" + loginId,
            type : "post",
      
            data : {"searchName" : $("#searchName").val()},
            success : function(data){
            
               var content = "<table class='table'>";
               for(var i = 0 ; i < data.length ; i++){
                  
                  if(data[i].yok == '1'){
                     content += '<tbody class="table">';
                     content += '<tr id='+data[i].yaman_id+' style="background-color: skyblue;" class="detail_data">';  
                     
                     content += '<td>';
                     if(data[i].yface == '없음'){
                        content += '사진이 없습니다.';
                     }else{
                        content += '<img src="resources/images/'+data[i].yface+'" style="width: 30px; height: 30px;">'; 
                     }
                     
                     
                     content += '<span class="yface" style="display:none">'+data[i].yface+'</span>'; 
                     content += '<span class="yname" style="display:none">'+data[i].yname+'</span>';
                     content += '<span class="yschool" style="display:none">'+data[i].yschool+'</span>';
                     content += '<span class="ycompany" style="display:none">'+data[i].ycompany+'</span>';
                     content += '<span class="yphone" style="display:none">'+data[i].yphone+'</span>';
                     content += '<span class="yemail" style="display:none">'+data[i].yemail+'</span>';
                     content += '<span class="yok" style="display:none">'+data[i].yok+'</span>';
                     content += '<span class="yhello" style="display:none">'+data[i].yhello+'</span>';
                     content += '<span class="yaman_id" style="display:none">'+data[i].yaman_id+'</span>';
                     
                     content += '</td>';
                     content += '<td>'+data[i].yname+'</td>';
                     content += '<td>'+data[i].yhello+'</td>';
                     content += '</tr>';
                     content += '</tbody>';
                  }else if(data[i].yok == '0'){
                     content += '<tbody>';
                     content += '<tr id='+data[i].yaman_id+' class="detail_data">';  
                     
                     content += '<td>';
                     if(data[i].yface == '없음'){
                        content += '사진이 없습니다.';
                     }else{
                        content += '<img src="resources/images/'+data[i].yface+'" style="width: 30px; height: 30px;">'; 
                     }
                     
                     content += '<span class="yface" style="display:none">'+data[i].yface+'</span>';
                     content += '<span class="yname" style="display:none">'+data[i].yname+'</span>';
                     content += '<span class="yschool" style="display:none">'+data[i].yschool+'</span>';
                     content += '<span class="ycompany" style="display:none">'+data[i].ycompany+'</span>';
                     content += '<span class="yphone" style="display:none">'+data[i].yphone+'</span>';
                     content += '<span class="yemail" style="display:none">'+data[i].yemail+'</span>';
                     content += '<span class="yhello" style="display:none">'+data[i].yhello+'</span>';
                     content += '<span class="yok" style="display:none">'+data[i].yok+'</span>';
                     content += '<span class="yaman_id" style="display:none">'+data[i].yaman_id+'</span>';
                     
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
   
    /* 절교하기 버튼클릭시 절교메세지와 정보들을 brkmessage테이블에 저장한다. */
    $(document).ready(function(){
       $("#breakFriend").on("click", function(){
          $("#breakFriendModal").modal();
             $("#byeFd").on("click", function(){
                var msg = $("#brkFd").val();
                var yaman_me = $(".myId").text();//내 아이디
                var yaman_friend = $("#id").val();//친구의 아이디
                var friend_name = $("#name").val();
                var me_name = $(".myName").text();
                
                $.ajax({
                   url : "breakFriend",
                   type : "post",
                   dataType : 'json',
                   contentType : "application/json",
                   data : JSON.stringify({
                      "msg"   : $("#brkFd").val() ,
                      "yaman_one" : $(".myId").text() ,
                      "yaman_two" : $("#id").val(),
                      "friend_name" : $("#name").val(),
                      "me_name" : $(".myName").text()
                   }) ,
                   success : function(data){
                      /*window.location.reload();*/
                   }
                });
             });
       });
    });
   
    /* 절교메세지를 받은 사람이 로그인을 했을때 brkmessage테이블에서 메세지를 조회하여  뿌려주는 ajax */
//    setInterval(function(){
    $(document).ready(function(){
       $.ajax({
          url : "brkMessage",
          type : "post",
          dataType : 'json',
          contentType : "application/json",
          success : function(brkMessage){
             var content = '<table class="table" id="fdAddTable">'
                +'<thead>'+'<tr>'+'<th>보낸사람</th>'+'<th>메세지</th>'
                +'<th>확인</th>'+'</thead>';
             for(var i = 0 ; i < brkMessage.length ; i++){
                content += '<tbodY>';
                content += '<tr id="readMsgTd">';
                content += '<td>'+brkMessage[i].me_name+'</td>';
                content += '<td>'+brkMessage[i].msg+'</td>';
                content += '<td>';
                content += '<button onclick="readMsgChk('+brkMessage[i].brkmsgno+')">확인';
                content += '<span class="readMsgNo" style="display:none; text-align: right;">'+brkMessage[i].brkmsgno+'</span>';
                content += '<span class="readMsgChk" style="display:none; text-align: right;">'+brkMessage[i].readmsg+'</span>';
                content += '</button>';
                //span의 id 값으로 readmsg의 value값을 얻어오기 위함.
                content += '</td>';
                content += '</tr>';
                content += '</tbody>';
             }
             content += '</table>';
             $("#brkMsgTable").html(content);
             
             
          }
          
       });
    });
  /*  },1000);*/

       /* 절교메세지 탭에서 확인을 누르면 readmsg 값이 'N' 에서 'Y'로 update시킨다. */
        function readMsgChk(brkmsgno){
           
           $.ajax({
             url : "updateReadMsg",
             type : "post",
                dataType : 'json',
                contentType : "application/json",
                data :JSON.stringify({
                   "brkmsgno" : brkmsgno,
                    "readmsg"  : $(".readMsgChk").text(),
                    }) ,
                 success : function(){

                 }
          });
           $("#readMsgTd").remove();
           /*window.location.reload();*/
           
        }
       
       
    
   
   
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
            
            $("#UpdateFace").text(yface);
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
               url : "update",
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
            
            alert("성공");
            var form = new FormData(document.getElementById('myPhotoFrm'));
            $.ajax({
               url : "myImgUpdate",
               type : "post",
               dataTyspe : "text",
               data : form,
               processData : false,
               contentType : false,
               success : function(data){
                  
               },error : function(data){

               }
            });
            /*window.location.reload();*/
         }); 
      });
   });
   
  
   /* tab창 - css */
   $(document).ready(function(){
       $(".nav-tabs a").click(function(){
           $(this).tab('show');
       });
   });
   
    
      /* 친구추가 탭에 검색시 모달창으로 검색된 값을 넘겨주는 함수 */
      $(document).ready(function(){
        
         $("#searchBtn").on("click", function(){
            var yname = $("#searchYname").val();
            var yschool = $("#searchYschool").val();
            var yphone = $("#searchYphone").val();
            var yemail = $("#searchYemail").val();
               
            $.ajax({
                url : "add",
                type : "post",
                dataType : 'json',
                contentType : "application/json",
                data :JSON.stringify({
                      "yname"   : $("#searchYname").val() ,
                      "yschool" : $("#searchYschool").val() ,
                      "yphone"  : $("#searchYphone").val() ,
                      "yemail"  : $("#searchYemail").val(),
                      }) ,
                success : function(fdAddList){

                   
                   var   content = "<table class='table' id=id='fdAddTable'>"
                   +'<thead>'
                   +'<tr>'
                   +'<th>선택</th>'
                   +'<th>친구이름</th>'
                   +'<th>생년월일</th>'
                   +'</tr>'
                   +'</thead>';
                   for(i = 0 ; i < fdAddList.length ; i++){
                      content += '<tbody>';
                      content += '<tr>';
                      content += '<td id="chkId">';
                      content += '<input type="checkbox" name="chkbox" value="'+fdAddList[i].yaman_id+'">';
                      content += '</td>';

                      content += '<span class="fdYaman_id" style="display:none; text-align: right;">'+fdAddList[i].yaman_id+'</span>';
                      
                      content += '<td>'+fdAddList[i].yname;
                      
                      content += '<span class="fdYname" style="display:none; text-align: right;">'+fdAddList[i].yname+'</span>';
                      
                      content += '</td>'
                      content += '<td>'+fdAddList[i].ybirth;
                      
                      content += '<span id="fdYbirth" style="display:none; text-align: right;">'+fdAddList[i].ybirth+'</span>';
                      
                      content += '</td>';
                      content += '</tr>';
                      content += '</tbody>';
                   }
                   content += '</table>';
                   $("#fdAddTable").html(content);
                   $("#add_friend").tab("show");
                   $("#fdAddModal").modal();
                
                }
            });
         
         });
      });
      
      /* 요청 버튼을 눌렀을때 친구 메세지탭 친구요청창에 친구 요청을 보냄 */
        $(document).ready(function(){
           $("#reqBtn").on("click", function(){
              
              if($("input[name=chkbox]").is(":checked") == false){
                 alert("선택된 친구가 없습니다.");
              }else{
                 
                 
                 var checkArray = new Array();
                 var loginName = $("#loginNAME").val();
                 var loginId = $("#loginId").val();
                 $("input[name=chkbox]:checked").each(function(){
                   checkArray.push($(this).val());
                     
                     var allData = {"loginId" : loginId, "loginName" : loginName,"checkArray" : checkArray}
                     
                    $.ajax({
                      url : "friendReq",
                      type : "post",
                      data :allData,
                       success : function(data){
                          alert("성공");
                       }
                  });
                 });
              }
              
           });
           
           

           
           
         });

        /* 친구요청을 받은 사람이 로그인 했을때  메세지 탭 친구요청란에 친구 요청 정보를 출력해주는 ajax*/
        
       
    /*   setInterval(function(){*/
           $.ajax({
                url : "reqMessage",
                type : "post",
                dataType : 'json',
                contentType : "application/json",
                success : function(reqMessage){
                   var content = '<table class="table" id="fdReqMsg">'
                      +'<thead>'+'<tr>'+'<th>보낸사람</th>'+'<th>확인</th>'+'</tr>'+'</thead>';
                   for(var i = 0 ; i < reqMessage.length ; i++){
                      content += '<tbodY>';
                      content += '<tr id="reqMsg">';
                      content += '<td>'+reqMessage[i].reqme_name+'</td>';
                      content += '<td>';
                      content += '<button onclick="friendAgree('+reqMessage[i].req_me+')">수락';
                      content += '</button>';
                      content += '<button onclick="friendReject('+reqMessage[i].req_me+')">거절';
                      content += '</button>';
                      content += '</td>';
                      content += '</tr>';
                      content += '</tbody>';
                   }
                   
                   content += '</table>';
                   $("#fdReqMsg").html(content);
                   
                }
           
             });
 /*       }, 1000);*/

        /* 친구요청 수락을 눌렀을 경우  */
        function friendAgree(yaman_one){
           var loginId = $("#loginId").val();
           $.ajax({
                url : "addFriend",
                type : "post",
                   dataType : 'json',
                   contentType : "application/json",
                   data :JSON.stringify({
                      "yaman_two" : loginId,
                       "yaman_one"  : yaman_one
                       }) ,
                    success : function(data){

                    }
             });
           $("#reqMsg").remove();
           /*window.location.reload();*/
           }
        
        
        /* 친구 요청 거절을 눌렀을 경우 */
        function friendReject(yaman_one){
           var loginId = $("#loginId").val();
           $.ajax({
                url : "rejectFriend",
                type : "post",
                   dataType : 'json',
                   contentType : "application/json",
                   data :JSON.stringify({
                      "yaman_two" : loginId,
                       "yaman_one"  : yaman_one
                       }) ,
                    success : function(data){

                    }
             });
           $("#reqMsg").remove();
           /*window.location.reload();*/
        }
        
        /* setInterval을 사용해서 친구가 접속했을때 계속해서 친구목록이 바뀌는 ajax */
           
         /* setInterval(function(){*/
             $.ajax({
                url:"loginRefresh",
                type : "post",
                   dataType : 'json',
                   contentType : "application/json",
                   success : function(data){
                      
                      var content = "<table class='table'>";
                     for(var i = 0 ; i < data.length ; i++){
                        
                        if(data[i].yok == '1'){
                           content += '<tbody class="table">';
                           content += '<tr id='+data[i].yaman_id+' style="background-color: skyblue;" class="detail_data">';  
                           
                           content += '<td>';
                           if(data[i].yface == '없음'){
                              content += '사진이 없습니다.';
                           }else{
                              content += '<img src="resources/images/'+data[i].yface+'" style="width: 30px; height: 30px;">'; 
                           }
                           
//                           content += '<td>'+data[i].yface; 
                           content += '<span class="yface" style="display:none">'+data[i].yface+'</span>'; 
                           content += '<span class="yname" style="display:none">'+data[i].yname+'</span>';
                           content += '<span class="yschool" style="display:none">'+data[i].yschool+'</span>';
                           content += '<span class="ycompany" style="display:none">'+data[i].ycompany+'</span>';
                           content += '<span class="yphone" style="display:none">'+data[i].yphone+'</span>';
                           content += '<span class="yemail" style="display:none">'+data[i].yemail+'</span>';
                           content += '<span class="yok" style="display:none">'+data[i].yok+'</span>';
                           content += '<span class="yhello" style="display:none">'+data[i].yhello+'</span>';
                           content += '<span class="yaman_id" style="display:none">'+data[i].yaman_id+'</span>';
                           
                           content += '</td>';
                           content += '<td>'+data[i].yname+'</td>';
                           content += '<td>'+data[i].yhello+'</td>';
                           content += '</tr>';
                           content += '</tbody>';
                        }else if(data[i].yok == '0'){
                           content += '<tbody>';
                           content += '<tr id='+data[i].yaman_id+' class="detail_data">';  
                           
                           content += '<td>';
                           if(data[i].yface == '없음'){
                              content += '사진이 없습니다.';
                           }else{
                              content += '<img src="resources/images/'+data[i].yface+'" style="width: 30px; height: 30px;">'; 
                           }
                           
//                           content += '<td>'+data[i].yface;
                           content += '<span class="yface" style="display:none">'+data[i].yface+'</span>';
                           content += '<span class="yname" style="display:none">'+data[i].yname+'</span>';
                           content += '<span class="yschool" style="display:none">'+data[i].yschool+'</span>';
                           content += '<span class="ycompany" style="display:none">'+data[i].ycompany+'</span>';
                           content += '<span class="yphone" style="display:none">'+data[i].yphone+'</span>';
                           content += '<span class="yemail" style="display:none">'+data[i].yemail+'</span>';
                           content += '<span class="yhello" style="display:none">'+data[i].yhello+'</span>';
                           content += '<span class="yok" style="display:none">'+data[i].yok+'</span>';
                           content += '<span class="yaman_id" style="display:none">'+data[i].yaman_id+'</span>';
                           
                           content += '</td>';
                           content += '<td>'+data[i].yname+'</td>';
                           content += '<td>'+data[i].yhello+'</td>';
                           content += '</tr>';
                           content += '</tbody>';
                        }
                        content += "</table>";
                     }
                     
                     $("#friendInfo").html(content);
                     

                   }
             });
     /*     }, 1000);*/
         
             
             