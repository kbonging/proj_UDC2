<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- content -->
<title>비밀번호 변경</title>

<link rel="stylesheet" type="text/css" href="style/common.css" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/changePwd.js' />"></script>
<div class="body">
	<div class="div0">
		<h3>비밀번호 변경</h3>
		<form name="frm1" method="post" id="changePwdFrm">
			<div class="div1">
				<p class="p1">아이디</p>
				<input type="text" class="input1" id="userid" name="userid" value="${userid}"
				 style="font-size:18px;" disabled/><br>
				<p class="p2">숨김 메시지 표시</p>
			</div>
			<div class="div1">
				<p class="p1">현재 비밀번호</p>
				<input type="password" class="input1" id="currentPwd" name="currentPwd" placeholder="현재 비밀번호" />
				<p class="p2"></p>
			</div>
			<div class="div1">
				<p class="p1">새 비밀번호</p>
				<input type="password" class="input1" id="newPwd" name="newPwd" placeholder="새 비밀번호"/>
				<p class="p2"></p>
			</div>
			<div class="div1">
				<p class="p1">새 비밀번호 확인</p>
				<input type="password" class="input1" id="newPwdConfirm" name="newPwdConfirm" placeholder="새 비밀번호 확인"/>
				<p class="p2"></p>
			</div>
			<div class=div3> 
				<input type="button" value="비밀번호 변경" id="sub1" class="changePwdBtn">
			</div>
		</form>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>