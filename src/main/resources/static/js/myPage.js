$(function() {

    /* 아이디와 주소는 읽기만 가능하게 */
    $('#userid').prop('readonly', true);
    $('#sample6_postcode').prop('readonly', true);
    $('#sample6_address').prop('readonly', true);

    /* 마이페이지에서 회원정보 수정 버튼 (수정페이지로 이동) myPage.jsp*/
    $('#memModify').click(function(){
        location.href="/memModify";
    });

    /* 마이페이지에서 비밀번호 변경 버튼 (비밀번호 변경페이지로 이동) myPage.jsp*/
    $('#changePwd').click(function(){
        location.href="/changePwd";
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


// 회원수정 버튼
$('.memModifyBtn').click(function() {

    // 이메일 합치기
    let email1 = $('#email1').val();
    let email2 = $('#email2').val();
    $('#uEmail').val(email1 + "@" + email2);

    console.log($('#uEmail').val(email1 + "@" + email2));
   // alert($('#uEmail').val(email1 + "@" + email2));

    // 주민번호 합치기
    let jumin1 = $('#jumin1').val();
    let jumin2 = $('#jumin2').val();
    $('#jumin').val(jumin1 + "-" + jumin2);

   // alert($('#jumin').val(jumin1 + "-" + jumin2));
    console.log($('#jumin').val(jumin1 + "-" + jumin2));
    // 전화번호 합치기
    let mobile1 = $('#mobile1').val();
    let mobile2 = $('#mobile2').val();
    let mobile3 = $('#mobile3').val();
    $('#tel').val(mobile1+mobile2+mobile3);

   // alert($('#tel').val(mobile1+mobile2+mobile3));
    console.log($('#tel').val(mobile1+mobile2+mobile3));

    if ($('#uName').val().length < 1) {
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
    } else{

        if(confirm("회원수정 하시겠습니까?")){
            $('#memModifyFrm').attr("action", "/memModify");
            $('#memModifyFrm').submit();

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

    }); //$('.memModifyBtn').click 끝


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