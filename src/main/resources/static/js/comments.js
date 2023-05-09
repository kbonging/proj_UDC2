$(function(){

    //////////////////////////////////////////////////////////////////////////////
    ////////////////  글상세페이지 들어가면 바로 댓글 목록 보여주기 시작  ////////////////
    //////////////////////////////////////////////////////////////////////////////
    getReplyList();
    //////////////////////////////////////////////////////////////////////////////
    ////////////////  글상세페이지 들어가면 바로 댓글 목록 보여주기 시작  ////////////////
    //////////////////////////////////////////////////////////////////////////////


    //////////////////////////////////////////////////////////////////////////////
    //////////////// 글 상세 목록에서 댓글 등록 버튼 시작 comments.jsp  ////////////////
    //////////////////////////////////////////////////////////////////////////////
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
                console.log(data);
                $('#content').val('');
                getReplyList();
            },
            error:function(request,status,error){
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

          }); //ajax 끝
        }
    });
    //////////////////////////////////////////////////////////////////////////////
    ////////////////  글 상세 목록에서 댓글 등록 버튼 끝 comments.jsp  ////////////////
    //////////////////////////////////////////////////////////////////////////////



});

//댓글 목록 보여주기 함수 시작
function getReplyList(){
    let boardNo = $('#boardNum').val();
    let sessionUserid = $('#sessionUserid').val();
    console.log(sessionUserid);
    console.log(boardNo);

    $.ajax({

    type:"GET",
    url:"/GET_commentsList",
    data:{
       "boardNo":boardNo
    },
    dataType:"JSON",

    success:function(data) {

        console.log(data);
        if(data != null){
        console.log("여기 들어오나?");

            let str = "";
            for(let i=0; i < data.length; i++){

                if(data[i].delCheck != 'Y'){
                    str += "<table><colgroup><col style='width: 50%;' /><col style='width: 50%;' /></colgroup>";
                    str += "<tr>";
                    str += "<td><div class='div_inner'><p class='p1'><a href='#' style='text-decoration: none; color: #466cb4;'>"+data[i].nick+"</a></p><p>&nbsp;&nbsp;&nbsp;</p><p class='p1'>"+data[i].regTM+"</p></div></td>";
                    str += "<td><div class='div_inner'><p class='p1'><a href='#' style='text-decoration: none;'>⋮</a></p></div></td>";
                    str += "</tr>";

                    str += "<tr>";
                    str += "<td colspan='2' style='text-align: left;'><span class='p1'>"+data[i].content+"</span></td>";
                    str += "</tr>";

                    str += "<tr>";
                    str += "<td colspan='2' style='text-align: left;'><br><div><input type='button' class='btns' value='답변'>&nbsp;";
                    if(sessionUserid == data[i].userid){
                        str += "<input type='button' class='btns' value='삭제' onclick='delComments("+data[i].commentNo+")'>";
                    }
                    str += "</div></td></tr>";
                    str += "</table>";

                }else if(data[i].delCheck == 'Y'){
                    str += "<div style='color:red' class='delComDiv'>";
                    str += "삭제된 댓글입니다.";
                    str += "</div>";
                }


            } // for 끝
            $('.div_comm').html(str);
        }


    },
    error:function(request,status,error){
       alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }

  }); //ajax 끝

};
//댓글 목록 보여주기 함수 끝

// 댓글 삭제 함수 시작
function delComments(commentNo){
    let delChk = confirm("댓글을 삭제하시겠습니까?");

    if(delChk){
        $.ajax({

        type:"GET",
        url:"/deleteComProc",
        data:{
        "commentNo":commentNo
        },
        dataType:"JSON",

        success:function(data) {
        console.log(data);
        getReplyList();
        },
        error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }

      }); //ajax 끝
    }
};
// 댓글 삭제 함수 끝
