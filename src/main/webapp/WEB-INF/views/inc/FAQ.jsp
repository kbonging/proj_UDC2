<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.title').click(function() {
			$(this).siblings('.Content').slideToggle();
			$(this).toggleClass('contentOpen');
		});
	});
</script>
<style type="text/css">
.body * {
	font-family: 'Noto Sans KR', sans-serif;
	margin-left: auto;
	margin-right: auto;
}

.container {
	margin-top: 100px;
	margin-bottom: 100px;
	width: fit-content;
}

.faq {
	border-bottom: 5px solid rgba(255, 255, 255, .5);
	font-size: 15px;
	width: 750px;
	font-weight: 900;
	font-weight: bold;
}

.title {
	font-weight: bold;
	padding: 10px 36px 10px 0;
	position: relative;
	cursor: pointer;
	padding-left: 50px;
	border-bottom: 2px solid black;
	font-size: 18pt;
}

.title:after {
	content: "+";
	position: absolute;
	top: 50%;
	left: 0;
	width: 36px;
	text-align: center;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	font-weight: bold;
	color: inherit;
	font-size: 20px;
}

.title.contentOpen:after {
	content: "-";
}

.Content {
	display: none;
	padding-left: 50px;
	padding-right: 25px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-weight: 400;
	font-size: 11pt;
}

.one {
	text-align: center;
}

.one p {
	margin-bottom: 10px;
	font-size: 11pt;
	font-weight: 700;
}

.one div {
	border: 1px solid #9d9d9d;
	width: 250px;
	height: 50px;
	vertical-align: middle;
	line-height: 50px;
	font-size: 10pt;
	font-weight: 400;
	border-radius: 5px 5px 5px 5px;
	background-color: #f5f5f5;
}

.one a {
	text-decoration: none;
}

.one a:hover {
	font-weight: bold;
}

.inquiry {
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="faq">
			<div class="title">예매한 티켓의 결제 수단을 변경할 수 있나요?</div>
			<div class="Content">
				'무통장입금'을 선택하여 예매한 경우 입금 완료 전 신용카드로 결제 수단을 변경할 수 있습니다.
				PC>MY공연>예매확인/취소 상세에서 직접 변경하시거나 고객센터 전화(1544-6399) 또는 일대일문의를 남겨주시면 처리
				가능합니다. <br> <br> 단, 신용카드로 결제한 경우 다른 카드로 변경 또는 할부 개월 수 변경
				등은 하실 수 없으니 카드 결제 시 유의해 주시기 바랍니다. <br> <br> * 공연에 따라 결제 수단
				변경이 불가할 수 있으므로 공지 및 공연 상품 상세 정보에서 확인해 주시기 바랍니다.
			</div>
		</div>
		<div class="faq">
			<div class="title">무통장 입금의 입금은행을 변경하고 싶습니다</div>
			<div class="Content">
				입금은행 변경을 원하시는 경우, 번거로우시겠지만 이전 주문을 취소하고 새로 주문을 해주셔야 합니다. <br> <br>
				입금은행을 변경하여 입금하신 후, 3~4시간 후에도 입금확인 메일이 도착하지 않은 경우 1:1 문의를 통해 연락주시면
				확인해드리겠습니다.
			</div>
		</div>
		<div class="faq">
			<div class="title">무통장 입금 결제는 어떻게 이용하나요?</div>
			<div class="Content">
				예매 시 '무통장입금'을 선택하시면 가상계좌를 발급해드립니다. 발급된 가상 계좌로 예매 후 익일 오후 11시 29분까지
				입금해주셔야 예매가 완료됩니다. 단, 상품에 따라 예매 당일 밤 11시 29분에 마감되는 경우가 있으니 예매 전후 반드시
				확인해주시기 바랍니다. <br> <br> * 이용 가능 은행: 우리, 국민, 농협, 신한, KEB하나,
				기업, SC제일, 우체국 <br> <br> '무통장입금' 결제 수단은 관람일 4일 전 예매 시 까지만
				이용할 수 있으나, 특정 공연, 특정 기간 동안 해당 결제 수단 사용 제한이 있을 수 있습니다. <br> <br>
				ATM 기기기로는 가상계좌 입금이 안 되는 경우가 있으니 가급적 인터넷 뱅킹, 모바일 뱅킹 등을 이용해주시고, 은행마다
				은행 이용 마감 시간 또는 점검으로 인해 입금 처리가 안 될 수 있으니 은행별 이용 가능 시간을 꼭 확인해주시기 바랍니다.
			</div>
		</div>
		<div class="faq">
			<div class="title">현금 영수증은 어떻게 발급받나요?</div>
			<div class="Content">
				무통장입금, 공연예매권, YES상품권, 예치금 등을 사용하신 결제 금액에 대해 현금 영수증 발급 신청이 가능합니다. <br>
				<br> * MY공연>예매확인/취소 에서 직접 현금영수증 발급 신청 (예매일 ~ 공연관람일 이후 1년간 발급 신청
				가능합니다.) <br> <br> ※ 네이버페이 결제 건의 경우, 예스24 티켓 고객센터로 문의 후 발급
				가능합니다. <br> <br> 발급 후 영수증 확인은 국세청 홈페이지에서 3~4일 이내에 확인하실 수
				있습니다.
			</div>
		</div>
		<div class="faq">
			<div class="title">문화상품권으로 결제가 가능한가요?</div>
			<div class="Content">문화진흥원에서 발행한 문화상품권(컬쳐캐쉬)은 티켓 결제가 불가합니다.</div>
		</div>
		<div class="faq">
			<div class="title">결제 완료 메시지를 받았는데 예매 내역이 없어요.</div>
			<div class="Content">
				동시 접속 수가 많을 경우 좌석 선택 중복건이 다수 발생할 수 있습니다. <br> <br> 이런 경우에는
				결제를 먼저 완료하신 고객님의 예매가 완료됩니다. <br> <br> 또한, 결제 완료 메시지를
				받으셨더라도 예매번호가 생성 되지 않은 경우 정상 예매건이 아니므로 [MY티켓>예매확인/취소]에서 예매내역을 꼭 확인해
				주시기 바랍니다. 만약, 예매 내역 없이 결제만 완료가 되었다면 자동으로 취소가 진행되나, 빠른 취소를 원하신다면 예매자
				본인께서 고객센터 1544-6399 또는 1:1문의하기로 연락해 주시기 바랍니다.
			</div>
		</div>

		<div class="one">
			<br> <br>
			<p>기타 문의는 1:1문의하기를 이용바랍니다.</p>
			<div class="inquiry">
				<a href="#">1:1 문의하기</a>
			</div>
		</div>
	</div>
	<%@ include file="../inc/bottom.jsp"%>