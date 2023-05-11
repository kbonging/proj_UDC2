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
				<span class="totalRecord">게시물 수 : ${paginationInfo.totalRecord}</span>
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


                                    <c:if test="${paginationInfo.totalRecord == 0}">
                                        <tr>
                                        <td></td>
                                        <td>검색된 게시물이 없습니다.</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        </tr>
                                    </c:if>
									<!-- 반복구간(시작) -->
                                    <c:forEach var="listMap" items="${list }">
									<tr>
										<td>
										    ${listMap.category}
										</td>
										<c:choose>
                                            <c:when test="${listMap.delCheck == 'Y'}">
                                                <td style="color:red">삭제된 글 입니다.</td>
                                            </c:when>
                                            <c:otherwise>
										        <td onclick="read(${listMap.num})" class="subject">${listMap.subject }
										            <c:if test="${listMap.commentsCnt > 0}">
										            &nbsp;<small style="color:red">[${listMap.commentsCnt}]</small>
										            </c:if>
										        </td>
                                            </c:otherwise>
                                        </c:choose>
										<!--
										<td><a href="/boardDetail?boardNo=${listMap.num}" style="text-decoration: none; color:black;">${listMap.subject }</a></td>
										-->
										<td>${listMap.nick}</td>
										<td>${listMap.regTM }</td>
										<td>${listMap.readCnt }</td>
										<td>${listMap.goodCnt }</td>
									</tr>

                                    </c:forEach>
									<!-- 반복구간(끝) -->
								</tbody>
							</table>

							<div class="divPage">
							    <!-- 이전블럭으로 이동 -->
							    <c:if test="${paginationInfo.firstPage>1 }">
                                		<%-- <a href='<c:url value="/board/list.do?currentPage=${pagingInfo.firstPage-1}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}"/>'> --%>
                                		<a href="#" onclick="pageProc(${paginationInfo.firstPage-1})" class="pageA">
                                			이전
                                		</a>
                                </c:if>

                                <!-- 페이지 번호 추가 -->
                                	<!-- [1][2][3][4][5][6][7][8][9][10] -->
                                	<c:forEach var="i" begin="${paginationInfo.firstPage }" end="${paginationInfo.lastPage }">
                                		<c:if test="${i==paginationInfo.currentPage }">
                                			<span style="color: blue;font-weight: bold;font-size: 20px">
                                				&nbsp;${i }&nbsp;</span>
                                		</c:if>
                                		<c:if test="${i!=paginationInfo.currentPage }">
                                				<%-- <a href='<c:url value="/board/list.do?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}"/>'> --%>
                                			<a href="#" onclick="pageProc(${i})" class="pageA">
                                				&nbsp;${i}&nbsp;
                                			</a>
                                		</c:if>
                                	</c:forEach>
                                	<!--  페이지 번호 끝 -->

                                	<!-- 다음 블럭으로 이동 -->
                                    	<c:if test="${paginationInfo.lastPage < paginationInfo.totalPage }">
                                    		<%-- <a href='<c:url value="/board/list.do?currentPage=${pagingInfo.lastPage+1}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}"/>'> --%>
                                    		<a href="#" onclick="pageProc(${paginationInfo.lastPage+1})" class="pageA">
                                    			다음
                                    		</a>
                                    </c:if>
							</div> <!-- .divPage 끝 -->

							<div class="btn_write" style="display: block;">
								<input type="button" class="sub2" value="글쓰기" id="boardWriteBtn">
							</div>
							<div class="addons" style="display: block;">
								<form name="searchFrm" method="get" id="searchFrm">
									<input type="hidden" id="category" name="category" class="category" value="${map.category}" >
									<div class="addons2" style="display: block;">
										<select name="search_target" class="sel1" id="search_target">
											<option value="subject"
                                                <c:if test="${map.search_target == 'subject' }">
                                                selected="selected"
                                            </c:if>>제목
											</option>
											<option value="content"
                                                <c:if test="${map.search_target == 'content' }">
                                                selected="selected"
                                            </c:if>>내용
                                            </option>
										</select>
										<input type="text" name="search_keyword" class="keyw" value="${map.search_keyword}" id="search_keyword">
										<input type="button" class="sub1" value="검색" id="searchBtn">
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