$(function(){

    $('#All').css('display', 'block');

    var str = $('tr').find('span').val();

    if (str=='공지') {
        $(this).css('background','pink');
    }

    // 글쓰기 버튼(글쓰기 페이지 이동버틍) 시작
    $('#boardWriteBtn').click(function(){
        let userid = $('#sessionUserid').val();

        if(userid == null || userid == ""){
            alert('로그인 후 사용해주세요');
            return;
        }else{
            location.href="/boardWrite";
        }

    });
    // 글쓰기 버튼(글쓰기 페이지 이동버틍) 끝

    // 게시판 글 *등록* (쓰기 처리버튼) 시작
    $('#regBtn').click(function(){
        let category = $('#category').val();
        let subject = $('#subject').val();
        let content = $('#content').val();

        //alert(category);

        if(category == 0){
            alert('카테고리를 선택하세요');
            $('#category').focus();
        }else if(subject=="" || subject==null){
            alert('제목을 입력하세요');
            $('#subject').focus();
        }else if(content=="" || content==null){
             alert('내용을 작성하세요');
             $('#content').focus();
        }else{
            $('#writeFrm').attr("action", "/boardWrite");
            $('#writeFrm').submit();
        }

    });
    // 게시판 글 *등록* (쓰기 처리버튼) 끝

    /*  게시글 내용보기페이지에서 수정버튼 시작 /bbs/boardDetail.jsp  */
    $('#modBtn').click(function(){
        let num = $('#boardNum').val();
        let sessionUserid = $('#sessionUserid').val();

        if(sessionUserid == null || sessionUserid == ""){
            alert("로그인이 만료되었습니다. 재로그인 후 이용해주세요.");
            location.href="/memberLogin";
        }else{
            let url = "/modify?";
            url += "num="+num;
            location.href=url;
        }
    });

     /*  게시글 내용보기페이지에서 목록버튼 시작 /bbs/boardDetail.jsp  */
     $('#boardListBtn').click(function(){
        let url = "/boardList?category=All";
        location.href=url;
     });

     /*  게시글 내용보기페이지에서 삭제버튼 시작 /bbs/boardDetail.jsp  */
     $('#boardDeleteBtn').click(function(){
        let num = $('#boardNum').val();
        url = "/boardDelete?num="+num;

        if(confirm('삭제 하시겠습니까?')){
            location.href=url;
        }
     });


    /*수정 페이지 에서 수정처리버튼 시작 /bbs/boardModify.jsp*/
    $('#modifyBtn').click(function(){
        let category = $('#category').val();
        let subject = $('#subject').val();
        let content = $('#content').val();

        //alert(category);

        if(category == 0){
            alert('카테고리를 선택하세요');
            $('#category').focus();
        }else if(subject=="" || subject==null){
            alert('제목을 입력하세요');
            $('#subject').focus();
        }else if(content=="" || content==null){
             alert('내용을 작성하세요');
             $('#content').focus();
        }else{
            $('#modifyFrm').attr("action", "/modify");
            $('#modifyFrm').submit();
        }
    });

    // 글 제목 마우스 갖다대면 색 변경
    $('.subject').hover(function(){
        $(this).css("color","blue");
    }, function(){
        $(this).css("color","black");
    });

    ////////////////// 메뉴 버튼 클릭시 해당버튼 표시 ////////////////
    $('.tablink').click(function(){
        $(this).css("background-color", "gray");
    });


    /////////// 검색 처리 /bbs/boardList.jsp ////////
    $('#searchBtn').click(function(){
        let search_keyword = $('#search_keyword').val().trim();

        if(search_keyword=="" || search_keyword==null){
            alert('검색할 키워드를 입력하세요.');
            $('#search_keyword').focus();
        }else{
            $('#searchFrm').attr("action", "/boardList");
            $('#searchFrm').submit();
        }
    });


}); //////   $(function(){ 끝////////////

    // 카테고리별 페이지열기
    function openPage(category){


        url = "/boardList?category="+category;

        location.href=url;
    }

    // 글 상세목록 가기
    function read(p1){
        // p1 num (게시글 고유번호)

        let param = "/boardDetail?num="+p1;

        location.href=param;
    }

    // 로그인 유무 확인 후 돌려보내기
    function loginChFn(sessionUserid){
        if(sessionUserid == null || sessionUserid==""){
            alert("로그아웃처리 되었습니다.");
            location.href="/memberLogin";
        }
    }

    // 페이지 번호 클릭시 실행할 함수
    function pageProc(curPage){
        let category = $('#category').val();
        let search_target = $('#search_target').val();
        let search_keyword = $('#search_keyword').val().trim();

        if(category=="Q&A"){
            category="Q%26A";
        }
        let url = "boardList?category="+category;

        if(search_keyword != null && search_keyword != ""){
            url += "&search_target="+search_target;
            url += "&search_keyword="+search_keyword;
        }

        url += "&nowPage="+curPage;
        location.href=url;
    }

