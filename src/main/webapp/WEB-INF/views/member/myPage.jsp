<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- content -->
<link rel="stylesheet" type="text/css" href="style/join.css" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/join.js' />"></script>
<div class="body">
	<div class="div0">
		<h3>내정보</h3>
		<br>
		<form id="regist" method="post">
                <div class="first_regi">
                    <p class="p1">아이디</p>
                </div>
                <div class="second_regi">
                    <div class="wrapper">
                        <div class="text">
                            ${userMap.userid}
                        </div>
                        <p class="p3" id="idCheckEX"></p>
                    </div>
                </div>
                <div class="first_regi">
                    <p class="p1">이름</p>
                </div>
                <div class="second_regi">
                    ${userMap.uName}
                </div>
                <div class="first_regi">
                    <p class="p1">닉네임</p>
                </div>
                <div class="second_regi">
                    ${userMap.nick}
                </div>

             <div class="first_regi">
                 <p class="p1">email</p>
                 </div>
                 <div class="second_regi">
                    <span>
                    ${userMap.uEmail}
                    </span>
                 </div>

                <div class="first_regi">
                    <p class="p1">생년월일</p>
                </div>
                <div class="second_regi">
                    <span>
                    ${userMap.jumin}
                    </span>
                </div>
                <div class="first_regi">
                    <p class="p1">핸드폰번호</p>
                </div>
                <div class="second_regi">
                    <span>
                    ${userMap.tel}
                    </span>
                    <input class="mobile" id="tel" type="hidden" name="tel">
                </div>
                <div class="first_regi">
                    <p class="p1">주소</p>
                </div>
                <div id="coordXY">
                ${userMap.zipcode}<br>
                ${userMap.address}<br>
                ${userMap.locationName}
                </div>
                <div class="multi_radio1"></div>
                <div class="multi_radio2">
                    <input type="button" id="wr_submit" value="회원 수정" class="memModify">
                </div>
		</form>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>