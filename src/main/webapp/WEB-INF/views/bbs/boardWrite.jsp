<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- content -->
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="style/boardWrite.css" />
<script type="text/javascript"
	src="../smartEdit/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/board.js' />"></script>
<script type="text/javascript">
$(function(){
let sessionUserid = $('#sessionUserid').val();
    //alert(sessionUserid);

    setInterval(function(){
        loginChFn(sessionUserid)
    },1000);



});
</script>
</head>
<body>

<div class="body">
	<h3>일반게시판 > 글쓰기</h3>
	<div class="div0">
		<form class="writeFrm" name="writeFrm" method="post" id="writeFrm">
			<div class="div1">
				<p class="p1">카테고리</p>
				<select class="sel1" name="category" id="category">
					<option value='0'>분류</option>
					<option value='1'>Q&A</option>
					<option value='2'>후기</option>
					<option value='3'>잡담</option>
				</select>
			</div>

			<!-- 공연 선택 (주석)
			<div class="div1" id="con_select">
				<p class="p1">공연선택</p>
				<select class="sel1" name="concerttitle" id="concerttitle">
					<option>선택</option>

					<option>get타이틀</option>

				</select>

			</div>
			-->

			<div class="div1">
				<p class="p1">제목</p>
				<input type="text" class="input1" id="subject" name="subject">
				<p class="p2">숨김 메시지 표시</p>
			</div>
			<div class="div1">
				<textarea class="input2" id="content" name="content" rows="10" cols="30"></textarea>
				<p class="p2"></p>
				<input type="file" class="input3" name="file" id="file">
			</div>
			<div class=div3>
				<input type="button" value="등록" id="regBtn" class="sub1">
			</div>
			<input type="hidden" name="sessionUserid" id="sessionUserid" value="${sessionScope.userid}"></input>
		</form>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>