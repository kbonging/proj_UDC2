<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<title>일반게시판 > 내용보기</title>
<link rel="stylesheet" type="text/css" href="style/boardDetail.css" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/board.js' />"></script>
</head>
<body>
	<div class="div0">
		<h3>${boardMap.category}</h3>
		<div class="div00">
			<p class="p1">${boardMap.subject}</p>
		</div>
		<div class="div1">
			<table>
				<colgroup>
					<col style="width: 50%;" />
					<col style="width: 50%;" />
				</colgroup>
				<tr>
					<td>
						<div class="div_inner1">
							<p class="p1">
								<a href="#" style="text-decoration: none;">${boardMap.nick}</a>
							</p>
						</div>
					</td>
					<td>
						<div class="div_inner2">
							<p class="p2">날짜&nbsp;</p>
							<p class="p1">${boardMap.regTM}</p>
							<p class="p2">&nbsp;&nbsp;조회수&nbsp;</p>
							<p class="p2">${boardMap.readCnt}</p>
							<p class="p2">&nbsp;&nbsp;추천수&nbsp;</p>
							<p class="p2">${boardMap.goodCnt}</p>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="div2">
			<p class="p1">${boardMap.content} </p>
		</div>
		<div class="div_btns">
			<table>
				<tr>
					<th>
						<div>
							<input type="button" class="btns" value="목록">
							<c:if test="${sessionScope.userid == boardMap.userid}">
                                <input type="button" class="btns" value="수정" id="modBtn">
                                <input type="button" class="btns" value="삭제">
							</c:if>
						</div>
					</th>
				</tr>
			</table>
		</div>
		<input type="hidden" name="num" value="${boardMap.num}" id="boardNum">

		<!-- 댓글 for문 돌릴 곳 (시작) -->
		<div class="div_comm">
			<table>
				<colgroup>
					<col style="width: 50%;" />
					<col style="width: 50%;" />
				</colgroup>
				<!-- 첫 번째 줄 : [좌]아이디/작성일자 //[우]수정 -->
				<tr>
					<td>
						<div class="div_inner">
							<p class="p1">
								<a href="#" style="text-decoration: none; color: #466cb4;">댓글닉</a>
							</p>
							<p>&nbsp;&nbsp;&nbsp;</p>
							<p class="p1">2022-10-01 18:50</p>
						</div>
					</td>
					<td>
						<div class="div_inner">
							<p class="p1">
								<a href="#" style="text-decoration: none;">⋮</a>
							</p>
						</div>
					</td>
				</tr>
				<!-- 두 번째 줄 : 댓글 본문 내용 -->
				<tr>
					<td colspan="2" style="text-align: left;"><span class="p1">댓글처리기능 구현중</span>
					</td>
				</tr>
				<!-- 두 번째 줄 : 댓글 본문 내용 -->
				<tr>
					<td colspan="2" style="text-align: right;"><br>
						<div>
							<input type="button" class="btns" value="대댓글">
						</div></td>
				</tr>
			</table>
		</div>
		<!-- 댓글 for문 돌릴 곳 (끝) -->

		<div class="div3" id="comment">
			<form name="frm1" method="post" action="">
				<textarea class="input2" rows="10" cols="30"></textarea>
				<div class=div3>
					<input type="submit" value="댓글 등록" id="sub1">
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../inc/bottom.jsp"%>