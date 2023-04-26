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

</head>
<body>

<div class="body">
	<h3>일반게시판 > 글수정</h3>
	<div class="div0">
		<form class="modifyFrm" name="modifyFrm" method="post" id="modifyFrm">
			<div class="div1">
				<p class="p1">카테고리</p>
				<select class="sel1" name="category" id="category">
					<option value='1'
                        <c:if test="${boardMap.category == '1'}">
                        selected="selected"
                        </c:if>>Q&A
					</option>
					<option value='2'
                        <c:if test="${boardMap.category == '2'}">
                        selected="selected"
                        </c:if>>후기
                    </option>
                    <option value='3'
                        <c:if test="${boardMap.category == '3'}">
                        selected="selected"
                        </c:if>>잡담
                    </option>
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
				<input type="text" class="input1" id="subject" name="subject" value="${boardMap.subject}">
				<p class="p2">숨김 메시지 표시</p>
			</div>
			<div class="div1">
				<textarea class="input2" id="content" name="content" rows="10" cols="30">${boardMap.content}</textarea>
				<p class="p2"></p>
				<input type="file" class="input3" name="img" id="img">
			</div>
			<div class=div3>
				<input type="button" value="수정" id="modifyBtn" class="sub1">
			</div>
		</form>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>