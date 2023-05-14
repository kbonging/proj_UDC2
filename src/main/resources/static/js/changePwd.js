$(function() {
    $('#currentPwd').focus();

    $('.changePwdBtn').click(function() {

        if ($('#currentPwd').val().length < 1) {
            alert('현재 비밀번호를 입력하세요');
            $('#currentPwd').focus();
            event.preventDefault();
        } else if ($('#newPwd').val().length < 1) {
            alert('새 비밀번호를 입력하세요.');
            $('#newPwd').focus();
            event.preventDefault();
        } else if ($('#newPwd').val() != $('#newPwdConfirm').val()) {
            alert('새 비밀번호와 비밀번호 확인이 일치하지않습니다.');
            $('#newPwdConfirm').focus();
            event.preventDefault();
        }else {

            if(confirm('비밀번호 변경하시겠습니까?')){
                $('#changePwdFrm').attr("action", "/changePwd");
                $('#changePwdFrm').submit();
            }else{
                event.preventDefault();
            }

        }
    });


});  //$(function() { 끝