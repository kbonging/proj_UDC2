<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- content -->
<link rel="stylesheet" type="text/css" href="style/join.css" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/myPage.js' />"></script>
<div class="body">
	<div class="div0">
		<h3>회원 수정</h3>
		<br>
		<form id="regist" method="post">
                <div class="first_regi">
                    <p class="p1">아이디</p>
                </div>
                <div class="second_regi">
                    <div class="wrapper">
                        <div class="text">
                            <input class="input1" id="userid" type="text" name="userid" value="${userMap.userid}" />
                        </div>
                        <p class="p3" id="idCheckEX"></p>
                    </div>
                </div>
                <div class="first_regi">
                    <p class="p1">이름</p>
                </div>
                <div class="second_regi">
                    <input class="input1" id="uName" type="text" name="uName" value="${userMap.uName}">
                </div>
                <div class="first_regi">
                    <p class="p1">닉네임</p>
                </div>
                <div class="second_regi">
                    <input class="input1" id="nick" type="text" name="nick" placeholder="영문, 한글만 사용가능합니다" value="${userMap.nick}">
                </div>

             <div class="first_regi">
                 <p class="p1">email</p>
                 </div>
                 <div class="second_regi">
                    <span>
                    <input class="input2" id="email1" type="text" name="email1" value="${userMap.uEmail_01}"> @
                    <input class="input2" id="email2" type="text" name="email2" value="${userMap.uEmail_02}">
                    <input class="input2" id="uEmail" type="hidden" name="uEmail" >
                    <select id="emailDomain" class="emailDomain" name="emailDomain">
                        <option>직접입력</option>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>nate.com</option>
                    </select>
                    </span>
                 </div>

                 <!-- <div class = "realize">
             </div> 유효성 검사 칸-->
                <div class="first_regi">
                    <p class="p1">주민번호</p>
                </div>
                <div class="second_regi">
                    <span>
                    <input class="input2" id="jumin1" type="text" name="jumin1" maxlength="6" value="${userMap.jumin_01}"> -
                    <input class="input2" id="jumin2" type="Password" name="jumin2" maxlength="7" value="${userMap.jumin_02}">
                    <input class="input2" id="jumin" type="hidden" name="jumin" >
                    </span>
                </div>
                <!-- <div class = "realize">
             </div> 유효성 검사 칸-->
                <div class="first_regi">
                    <p class="p1">핸드폰번호</p>
                </div>
                <div class="second_regi">
                    <span> <select id="mobile1" class="mobile" name="mobile1">
                            <option value="010"
                                <c:if test="${userMap.mobile1 == '010'}">
                                selected="selected"
                                </c:if>>010</option>
                            <option value="011">011</option>
                            <option value="017">017</option>
                    </select> - <input class="mobile" id="mobile2" type="text" name="mobile2" maxlength="4" value="${userMap.mobile2}"> -
                    <input class="mobile" id="mobile3" type="text" name="mobile3" maxlength="4" value="${userMap.mobile3}">
                    </span>
                    <input class="mobile" id="tel" type="hidden" name="tel">
                    <input class="chkNick" id="telAuthenticationBtn" type="button" onclick="" value="인증하기" />
                </div>
                <!-- <div class = "realize">
             </div> 유효성 검사 칸-->
                <div class="first_regi">
                    <p class="p1">주소</p>
                </div>
                <div id="coordXY">
                    <!-- ================== -->
                    <input class="input4" type="text" id="sample6_postcode"  name="zipcode" placeholder="우편번호" value="${userMap.zipcode}"/>
                    <input class="btn_add1" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" />
                    <br>
                    <input class="input5" type="text" id="sample6_address" name="address" placeholder="주소" value="${userMap.address}"/>
                    <input class="input5" type="text" id="sample6_detailAddress" name="locationName" placeholder="상세주소" value="${userMap.locationName}"/><br>
                    <!-- 이거 꼭 눌러야 xy좌표 구함 -->
                    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목" />
                    <!-- ================== -->
                </div>
                <!-- <div class = "realize">
             </div> 유효성 검사 칸-->
                <div class="multi_radio1"></div>
                <div class="multi_radio2">
                    <input type="submit" id="wr_submit" value="회원수정">
             </div>
			 <input type ="hidden" name="chkId" id="chkId"> <!-- 아이디 체크 유무 -->
			 <input type ="hidden" name="chNick" id="chNick"> <!-- 닉네임 체크 유무 -->
		</form>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f45b93b9d4d2b1538f1f65bd30241ea9&libraries=services"></script>
<script type="text/javascript">
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

	var address = document.getElementById("sample6_address");
	var mapContainer = document.getElementById("map");
	var coordXY = document.getElementById("coordXY");
	var mapOption;
	var map;
	var x, y = "";

	if (address.value == "") {

		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 임의의 지도 중심좌표 , 제주도 다음본사로 잡아봤다.
			level : 4
		// 지도의 확대 레벨

		};

	}

	// 지도 생성
	map = new daum.maps.Map(mapContainer, mapOption);

	function addressChk() {
		var gap = address.value; // 주소검색어
		if (gap == "") {
			alert("주소를 입력하세요.");
			address.focus();
			return;
		}

		// 주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색
		geocoder
				.addressSearch(
						gap,
						function(result, status) {

							// 정상적으로 검색이 완료됐으면,
							if (status == daum.maps.services.Status.OK) {

								var coords = new daum.maps.LatLng(result[0].y,
										result[0].x);

								y = result[0].x;
								x = result[0].y;

								//xy좌표 넣어줌
								$(function() {
									$('#x').val(x);
									$('#y').val(y);
								});

								// 결과값으로 받은 위치를 마커로 표시합니다.
								var marker = new daum.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명표시
								var infowindow = new daum.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:5px 0;">좌표위치</div>'
										});

								infowindow.open(map, marker);

								// 지도 중심을 이동
								map.setCenter(coords);

								coordXY.innerHTML = "<br>X좌표 : " + x
										+ "<br><br>Y좌표 : " + y;
							}
						});
	}
</script>
<%@ include file="../inc/bottom.jsp"%>