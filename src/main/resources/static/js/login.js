$(function(){
    $('#userid').focus();

    $('#loginBtn').click(function(){
        let userid = $.trim($('#userid').val());
        $('#userid').val(userid);
        let userPwd = $.trim($('#userPwd').val());
        $('#userPwd').val(userPwd);

        $('#frmLogin').attr("action", "/memberLogin_post");

    });

}); ///////////// $(function(){  끝 /////////////////////