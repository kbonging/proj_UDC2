$(function() {

///////////////////////////////////////////////////////////////////////////
/*//////////   회원가입 입력(/member/member.jsp)  시작   /////////*/
///////////////////////////////////////////////////////////////////////////
$('#userid').focus();

$('#sample6_postcode').prop('readonly', true);
$('#sample6_address').prop('readonly', true);

//$('#btnChkId').click(function(){
//    var id=$('#userid').val();
//    open('checkUserid.jsp?userid='+id,'chk',
//        'width=500,height=300,left=0,top=0,location=yes,resizable=yes');
//});

//$('#btnChkNick').click(function(){
//    var nick=$('#nick').val();
//    open('checkNick.jsp?nick='+nick,'chk',
//        'width=500,height=300,left=0,top=0,location=yes,resizable=yes');
//});

$('#telAuthenticationBtn').click(function(){
    alert('인증되었습니다.');
});

////////////// 이메일 select 시작//////////////

 $('#emailDomain').change(function(){
    let email = $(this).val();

    if(email == "" || email =="직접입력"){
        $('#email2').prop('readonly', false);
        $('#email2').val("");
        $('#email2').focus();
    }else{
        $('#email2').val(email);
        $('#email2').prop('readonly', true);
        $('#email1').focus();
    }
 });

////////////// 이메일 select 끝//////////////



//////////////// 중복 아이디 체크 시작 //////////////////

///////////////// ajax START ////////////////


$('#userid').change(function(){
    let userid = $('#userid').val();

    if(validate_userid(userid)){
        $.ajax({
            type:"GET",
            url:"/idCheck",
            data:{
                "userid":$("#userid").val()
            },
            dataType:"JSON",

            success:function(data) {
                let result = data;

                if(result == 1){
                    $('#idCheckEX').html('사용 가능한 아이디입니다.');
                    $('#idCheckEX').css("color", "blue");
                    $('#chkId').val('Y');
                }else if(result == 2){
                    $('#idCheckEX').html('이미 사용중인 아이디입니다.');
                    $('#idCheckEX').css("color", "red");
                    $('#chkId').val('N');
                }
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        }); //ajax 끝

    }else{
        $('#idCheckEX').html('');
    }

});

	///////////////// ajax END ////////////////

//////////////// 중복 아이디 체크 끝 //////////////////



// 가입완료 버튼
$('#wr_submit').click(function() {

    // 이메일 합치기
    let email1 = $('#email1').val();
    let email2 = $('#email2').val();
    $('#uEmail').val(email1 + "@" + email2);

//    alert($('#uEmail').val(email1 + "@" + email2));

    // 주민번호 합치기
    let jumin1 = $('#jumin1').val();
    let jumin2 = $('#jumin2').val();
    $('#jumin').val(jumin1 + "-" + jumin2);

//    alert($('#jumin').val(jumin1 + "-" + jumin2));

    // 전화번호 합치기
    let mobile1 = $('#mobile1').val();
    let mobile2 = $('#mobile2').val();
    let mobile3 = $('#mobile3').val();
    $('#tel').val(mobile1+mobile2+mobile3);

//    alert($('#tel').val(mobile1+mobile2+mobile3));

    if ($('#userid').val().length < 1) {
        alert('아이디를 입력하세요');
        $('#userid').focus();
        event.preventDefault();
    } else if (!validate_userid($('#userid').val())) {
        alert('아이디는 영문, 숫자, _(밑줄문자)만 가능합니다.');
        $('#userid').focus();
        event.preventDefault();
    } else if ($('#userPwd').val().length < 1) {
        alert('비밀번호를 입력하세요');
        $('#userPwd').focus();
        event.preventDefault();
    } else if ($('#userPwd').val() != $('#userPwd2').val()) {
        alert('비밀번호가 일치하지 않습니다.');
        $('#userPwd2').focus();
        event.preventDefault();
    } else if ($('#uName').val().length < 1) {
        alert('이름을 입력하세요.');
        $('#uName').focus();
        event.preventDefault();
    } else if (!validate_name($('#uName').val())) {
        alert('이름은 한글만 가능합니다.');
        $('#uName').focus();
        event.preventDefault();
    } else if ($('#nick').val().length < 1) {
        alert('닉네임 입력하세요.');
        $('#nick').focus();
        event.preventDefault();
    } else if (!validate_nick($('#nick').val())) {
        alert('닉네임은 영문, 한글만 가능합니다.');
        $('#nick').focus();
        event.preventDefault();
    } else if ($('#email1').val().length < 1 || $('#email2').val().length < 1 ) {
        alert('이메일을 입력하세요');
        $('#email1').focus();
        event.preventDefault();
    } else if ($('#jumin1').val().length < 1) {
        alert('주민번호 앞자리를 입력하세요.');
        $('#jumin1').focus();
        event.preventDefault();
    } else if ($('#jumin1').val().length != 6) {
        alert('주민번호 앞자리 6자를 입력하셔야합니다.');
        $('#jumin1').focus();
        event.preventDefault();
    } else if ($('#jumin2').val().length < 1) {
        alert('주민번호 뒷자리를 입력하세요.');
        $('#jumin2').focus();
        event.preventDefault();
    } else if ($('#jumin2').
            val().length != 7) {
        alert('주민번호 뒷자리 7자를 입력하셔야합니다.');
        $('#jumin2').focus();
        event.preventDefault();
    } else if (!validate_jumin($('#jumin1').val())
            || !validate_jumin($('#jumin2').val())) {
        alert('주민번호는 숫자만 가능합니다.');
        $('#jumin1').focus();
        event.preventDefault();
    } else if ($('#mobile2').val().length < 1) {
        alert('핸드폰번호를 입력하세요.')
        event.preventDefault();
    } else if ($('#mobile3').val().length < 1) {
        alert('핸드폰번호를 입력하세요.')
        event.preventDefault();
    } else if (!validate_phone($('#mobile2').val())
            || !validate_phone($('#mobile3').val())) {
        alert('전화번호는 숫자만 가능합니다.');
        $('#mobile2').focus();
        event.preventDefault();
    } else if ($('#sample6_postcode').val().length < 1) {
        $('#sample6_postcode').focus();
        alert('우편번호를 입력하세요');
        event.preventDefault();
    } else if ($('#sample6_detailAddress').val().length < 1) {
        $('#sample6_detailAddress').focus();
        alert('상세주소를 입력하세요');
        event.preventDefault();
    } else if($('#chkId').val() != 'Y'){
        $('#userid').focus();
        alert('중복된아이디입니다 다른 아이디를 사용해주세요.');
        event.preventDefault();
    } else{

        if(confirm("회원가입하시겠습니까?")){
            $('#regist').attr("action", "/memberJoin");
            $('#regist').submit();

        }else{
            event.preventDefault();
        }

    }


    /*else if($('#chkId').val()!='Y'){
        alert('아이디 중복확인을 해야 합니다.');
        $('#btnChkId').focus();
        event.preventDefault();
    }else if($('#chNick').val()!='Y'){
        alert('닉네임 중복확인을 해야 합니다.');
        $('#btnChkNick').focus();
        event.preventDefault();
    }*/

    }); //$('#wr_submit').click 끝

}); // $(function()  끝//////////////////////////////////////////////

    ////////////////////////////////////////
	//전화번호 숫자만 가능
	function validate_phone(hp) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(hp);
	}

	//아이디 영문, 숫자, 특수문자(_)만 가능
	function validate_userid(id) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);

	}

	//주민번호 숫자만 가능
	function validate_jumin(jumin) {
		var pattern = new RegExp(/^[0-9]+$/g);
		return pattern.test(jumin);
	}

	//이름 한글만 가능
	function validate_name(name) {
		var pattern = new RegExp(/^[ㄱ-ㅎ가-힣]+$/g);
		return pattern.test(name);
	}

	//닉네임 영문, 한글만 가능
	function validate_nick(nick) {
		var pattern = new RegExp(/^[a-zA-Zㄱ-ㅎ가-힣]+$/g);
		return pattern.test(nick);
	}

	////////////////////////////////////////


