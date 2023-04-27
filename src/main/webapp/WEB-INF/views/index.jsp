<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/top.jsp"%>
<link rel="stylesheet" href="style/card.css">

<!DOCTYPE html>
<!-- content - 바뀌는 부분 -->
<div class="container">
	<main class="container">
		<div class="find">
			<h1>FINDING PLACE</h1>
		</div>
		<div class="map">
			<%@ include file="kakaoAPI/main.jsp"%>
		</div>
		<div class="recent">
			<h1><a href="cList.jsp" style="text-decoration: none; color:black;">RECENT UPDATE</a></h1>
		</div>
		<div class="row mb-2">


			<!-- 여기 한덩어리 시작 -->
			<div class="col-md-6">
				
				<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="article_card">
						<div class="bg-pic">
							<img src="<c:url value='/img/seventeen.jpg' />" alt="" aria-hidden="true" />
						</div>
						<div class="inner">
							<div class="header">
								<!-- <div class="prix">JOHN MAYER</div> -->
							</div>
							<div class="footer">
								<span class="prix"><a href="cDetail.jsp?concertNo=" style="text-decoration: none; color:white;  text-shadow: 1px 1px 1px black;">SEVENTEEN</a></span>
								<span class="unit"> <!-- &euro; --></span>
								<div>고척스카이돔</div>
							</div>

							<div class="content">
								<ul> 
									<li class="title"></li>
								
									<li>contents[0]</li>
									<li>contents[1]</li>
									<li>contents[2]</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		    <!-- 여기 한덩어리 끝 -->
            <!-- 여기 한덩어리 시작 -->
			<div class="col-md-6">

				<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="article_card">
						<div class="bg-pic">
							<img src="<c:url value='/img/BTOB.jpg' />" alt="" aria-hidden="true" />
						</div>
						<div class="inner">
							<div class="header">
								<!-- <div class="prix">JOHN MAYER</div> -->
							</div>
							<div class="footer">
								<span class="prix"><a href="cDetail.jsp?concertNo=" style="text-decoration: none; color:white;  text-shadow: 1px 1px 1px black;">BTOB</a></span>
								<span class="unit"> <!-- &euro; --></span>
								<div>올림픽 체조경기장</div>
							</div>

							<div class="content">
								<ul>
									<li class="title"></li>

									<li>contents[0]</li>
									<li>contents[1]</li>
									<li>contents[2]</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		    <!-- 여기 한덩어리 끝 -->
            <!-- 여기 한덩어리 시작 -->
			<div class="col-md-6">

				<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="article_card">
						<div class="bg-pic">
							<img src="<c:url value='/img/lee.jpg' />" alt="" aria-hidden="true" />
						</div>
						<div class="inner">
							<div class="header">
								<!-- <div class="prix">JOHN MAYER</div> -->
							</div>
							<div class="footer">
								<span class="prix"><a href="cDetail.jsp?concertNo=" style="text-decoration: none; color:white;  text-shadow: 1px 1px 1px black;">LEE CHANGSUB</a></span>
								<span class="unit"> <!-- &euro; --></span>
								<div>올림픽 핸드볼경기장</div>
							</div>

							<div class="content">
								<ul>
									<li class="title"></li>

									<li>contents[0]</li>
									<li>contents[1]</li>
									<li>contents[2]</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		    <!-- 여기 한덩어리 끝 -->
            <!-- 여기 한덩어리 시작 -->
			<div class="col-md-6">

				<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="article_card">
						<div class="bg-pic">
							<img src="<c:url value='/img/IU.jpg' />" alt="" aria-hidden="true" />
						</div>
						<div class="inner">
							<div class="header">
								<!-- <div class="prix">JOHN MAYER</div> -->
							</div>
							<div class="footer">
								<span class="prix"><a href="cDetail.jsp?concertNo=" style="text-decoration: none; color:white;  text-shadow: 1px 1px 1px black;">IU</a></span>
								<span class="unit"> <!-- &euro; --></span>
								<div>잠실종합운동장</div>
							</div>

							<div class="content">
								<ul>
									<li class="title"></li>

									<li>contents[0]</li>
									<li>contents[1]</li>
									<li>contents[2]</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		    <!-- 여기 한덩어리 끝 -->

		</div>
	</main>
</div>
<!-- content 바뀌는 부분 끝 -->

<%@ include file="inc/bottom.jsp"%>