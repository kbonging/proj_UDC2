$(function(){
    // 글 상세 목록에서 댓글 등록 버튼 comments.jsp //
    $('.commentBtn').click(function(){
        let userid = $('#sessionUserid').val();
        let boardNo = $('#boardNum').val();

        // alert(userid +" , "+ boardNo);

        if(userid==null || userid==""){
            alert('로그인 후 사용가능합니다.');
            return;
        }else{
            $.ajax({

            type:"POST",
            url:"/comments",
            data:{
               "boardNo":boardNo,
               "content":$("#content").val().trim(),
               "userid":userid
            },
            dataType:"JSON",

            success:function(data) {
                alert(data);
            },
            error:function(request,status,error){
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

          }); //ajax 끝
        }
    });


});

