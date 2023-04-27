<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/board.css">

<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/board.js' />"></script>
</head>
<body>

	<div class="contents">

		<div class="grid-container grid03">
			<div class="grid-item1">
				<b>커뮤니티</b>
			</div>
			<div class="tab">
				<button class="tablink"  onclick="openPage('All')" id="defaultOpen">전체</button>
				<button class="tablink"  onclick="openPage('Q%26A')" >Q&A</button>
				<button class="tablink"  onclick="openPage('Review')">후기</button>
				<button class="tablink"  onclick="openPage('Chat')">잡담</button>
			</div>
			<div class="grid-item3">

				<div id="All" class="tabcontent">
					<!-- content - 바뀌는 부분 -->
					<div class="community_content">
						<div class="in_content">
							<table class="board">
								<colgroup>
									<col style="width: 9%;" />
									<col style="width: 55%;" />
									<col style="width: 9%;" />
									<col style="width: 9%;" />
									<col style="width: 9%;" />
									<col style="width: 9%;" />
								</colgroup>
								<thead>
									<tr>
										<td scope="col" class="no"><span>번호</span></td>
										<td scope="col" class="title" style="text-align: center;"><span>제목</span></td>
										<td scope="col" class="writer"><span>글쓴이</span></td>
										<td scope="col" class="regdate"><span>등록일</span></td>
										<td scope="col" class="count"><span>조회</span></td>
										<td scope="col" class="recommand"><span>추천</span></td>
									</tr>
								</thead>
								<tbody>
                                    <tr>
                                        <td>공지</td>
                                        <td><a href="#" style="text-decoration: none; color:black;">[4월 세미나] 개발자 세미나</a></td>
                                        <td>관리자</td>
                                        <td>23-04-18</td>
                                        <td>22</td>
                                        <td>3</td>
                                    </tr>
									<tr>
                                        <td>공지</td>
                                        <td><a href="#" style="text-decoration: none; color:black;">Q&A 좋은 답글 달리는 꿀팁!</a></td>
                                        <td>관리자</td>
                                        <td>23-01-01</td>
                                        <td>529</td>
                                        <td>156</td>
                                    </tr>
                                    <tr>
                                        <td>공지</td>
                                        <td><a href="#" style="text-decoration: none; color:black;">글쓰기 공지사항을 준수해주세요</a></td>
                                        <td>관리자</td>
                                        <td>22-10-01</td>
                                        <td>2621</td>
                                        <td>423</td>
                                    </tr>

									<!-- 반복구간(시작) -->

                                    <c:forEach var="map" items="${list }">
                                    
									<tr>
										<td>
										<c:choose>
										    <c:when test = "${map.category == 1}">
                                            Q&A
										    </c:when>
										    <c:when test = "${map.category == 2}">
                                            후기
										    </c:when>
										    <c:when test = "${map.category == 3}">
                                            잡담
                                            </c:when>
                                            <c:otherwise>

                                            </c:otherwise>
										</c:choose></td>
										<c:choose>
                                            <c:when test="${map.delCheck == 'Y'}">
                                                <td style="color:red">삭제된 글 입니다.</td>
                                            </c:when>
                                            <c:otherwise>
										        <td onclick="read(${map.num})" class="subject">${map.subject }</td>
                                            </c:otherwise>
                                        </c:choose>
										<!--
										<td><a href="/boardDetail?boardNo=${map.num}" style="text-decoration: none; color:black;">${map.subject }</a></td>
										-->
										<td>${map.nick}</td>
										<td>${map.regTM }</td>
										<td>${map.readCnt }</td>
										<td>${map.goodCnt }</td>
									</tr>

                                    </c:forEach>
									<!-- 반복구간(끝) -->
								</tbody>
							</table>
							<div class="btn_write" style="display: block;">
								<input type="button" class="sub2" value="글쓰기" id="boardWriteBtn">
							</div>
							<div class="addons" style="display: block;">
								<form name="frm" action="" method="get">
									<div class="addons2" style="display: block;">
										<select name="search_target" class="sel1">
											<option value="title_content">전체</option>
											<option value="title">제목</option>
											<option value="content">내용</option>
										</select>
										<input type="text" name="search_keyword" class="keyw" value="" >
										<input type="submit" class="sub1" value="검색">
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- content 바뀌는 부분 끝 -->
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="sessionUserid" id="sessionUserid" value="${sessionScope.userid}"></input>
</body>


<%@ include file="../inc/bottom.jsp"%>