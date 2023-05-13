<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="style/info.css">

<!-- content -->
<link rel="stylesheet" href="style/table.css">
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/myPage.js' />"></script>
<div class="container">
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">회원정보</button>
		<!--
		<button class="tablinks" onclick="openCity(event, 'Paris')">작성한 글</button>
		<button class="tablinks" onclick="openCity(event, 'Seoul')">작성한 댓글</button>
		<button class="tablinks" onclick="openCity(event, 'Tokyo')">예매/결제 내역</button>
		-->
	</div>

	<!-- Tab content -->
	<div id="London" class="tabcontent">
		<div class="div0">
			<table class="Full-width">
				<colgroup>
					<col style="width: 50%;" />
					<col style="width: 50%;" />
				</colgroup>
				<tr>
					<td>아이디</td>
					<td id="userid">${userMap.userid}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td id="username">${userMap.uName}</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td id="nickname">${userMap.nick}</td>
				</tr>
				<tr>
                    <td>생년월일</td>
                    <td id="nickname">${userMap.birthday}</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td id="nickname">${userMap.uEmail}</td>
                </tr>
				<tr>
					<td>전화번호</td>
					<td id="tel">${userMap.tel}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td id="address">${userMap.zipcode},&nbsp;${userMap.address}&nbsp;${userMap.locationName}</td>
				</tr>
			</table>
		</div>
		<div class="div1">
			<table class="btn_mold">
				<colgroup>
					<col style="width: 33%;" />
					<col style="width: 33%;" />
					<col style="width: 33%;" />
				</colgroup>
				<tr>
					<td>
						<button class="btn default" id="memModify">회원정보 수정</button>
					</td>
					<td>
						<button class="btn default" id="changePwd">비밀번호 변경</button>
					</td>
					<td>
						<button class="btn default"
							onclick="window.open('Out.jsp',
							 'window_name',
							 'toolbar=no, menubar=no, scrollbars=no, resizable=no, width=815, height=360, location=no, status=no');">
							 회원탈퇴</button>
					</td>
					<!-- 기존꺼
					<td>
                        <button class="btn default"
                            onclick="window.open('changeNick.jsp',
                             'window_name',
                             'toolbar=no, menubar=no, scrollbars=no, resizable=no, width=500, height=300, location=no, status=no');">
                             회원정보 수정</button>
                    </td>
                    -->
				</tr>
			</table>
		</div>
	</div>

	<div id="Paris" class="tabcontent">
		<h3>작성한 글</h3>
		<p>내가 작성한 글의 목록입니다.</p>
		<table class="zebra">
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: 60%;" />
				<col style="width: 20%;" />
			</colgroup>
			<tr>
				<td class="title1">카테고리</td>
				<td class="title2">제목</td>
				<td class="title3">작성일</td>
			</tr>
			<tr>
				<td class="content1">후기</td>
				<td class="content2"><a href="#" style="text-decoration: none; color:black;">업데이트중</a></td>
				<td class="content3">00:00</td>
			</tr>
		</table>
	</div>

	<div id="Seoul" class="tabcontent">
		<h3>작성한 댓글</h3>
		<p>내가 작성한 댓글의 목록입니다.</p>
		<table class="zebra">
			<colgroup>
				<col style="width: 40%;" />
				<col style="width: 40%;" />
				<col style="width: 20%;" />
			</colgroup>
			<tr>
				<td class="title1">게시글 제목</td>
				<td class="title2">나의 댓글</td>
				<td class="title3">작성일</td>
			</tr>
			<tr>
				<td class="content1"><a href="#" style="text-decoration: none; color:black;">업데이트 중</a></td>
				<td class="content2"><a href="#" style="text-decoration: none; color:black;">업데이트 중</a></td>
				<td class="content3">00:00</td>
			</tr>
		</table>
	</div>

	<div id="Tokyo" class="tabcontent">
		<h3>예매/결제 내역</h3>
		<p>업데이트 중입니다</p>
	</div>
</div>
<script>
	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>
<!-- content -->
<%@ include file="../inc/bottom.jsp"%>