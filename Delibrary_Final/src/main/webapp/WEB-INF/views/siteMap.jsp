<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
	<link rel="StyleSheet" type="text/css" href="/resource/TeamCSS_nonAside.css">
</head>
<body>
	<header id="main_header">
		<div id="title">
			<a href="Home.do">
			<img alt="홈페이지" src="img/Logo.png" width=500px; height=150px;>
			</a>
		</div>
		<nav id="main_gnb">
			<ul>
				<c:if test="${empty cust_no }">
					<li><a href="LoginPage.do">로그인</a></li>
					<li><a href="insertCustomer.do">회원가입</a></li>
				</c:if>
				<c:if test="${not empty cust_no }">
					<li><a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a></li>
					<li><a href="logout.do?cust_no=${cust_no }">로그아웃</a></li>
				</c:if>
			</ul>
		</nav>
		<nav id="main_lnb">
			<div class="menu"><a>도서대여</a></div>
			<div class="menu"><a href="postList.do?group=10">커뮤니티</a></div>
				<div class="dropdown">
					<img src="resource/img/community icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="postList.do?group=10">공지사항</a></div><br>
						<div class="sub"><a href="postList.do?group=20">창작물 게시판</a></div><br>
						<div class="sub"><a href="postList.do?group=30">중고장터</a></div>
					</div>
				</div>
			<div class="menu"><a href="faqViewpage.do">고객지원</a></div>
				<div class="dropdown">
					<img src="resource/img/customer service icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="faqViewpage.do">FAQ</a></div><br>
						<div class="sub"><a href="QnaList.do">Q&A</a></div><br>
						<div class="sub"><a href="addrViewpageAPI.do">오시는길</a></div>
					</div>
				</div>
			<div class="menu"><a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a></div>
				<div class="dropdown">
					<img src="resource/img/mypage icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="MyPage_Info.do?cust_no=${cust_no}">내정보</a></div><br>
						<div class="sub"><a href="MyPage_Folder.do?cust_no=${cust_no}">나의서재</a></div><br>
						<div class="sub"><a href="optOutCustomer.do">회원탈퇴</a></div>
					</div>
				</div>
			<div class="menu"><a href="siteMap.do">사이트맵</a></div>
		</nav>
	</header>
	<div id="content">
		<section id="main_section">
			<main>
				<div class="wrapperlist">
				<h3 class="titlemap">사이트맵</h3>
				<hr>
			
				<div class="map">
					<ul class="maplist"> 
						<li><h4 class="each_title">마이페이지</h4></li>
						<li><a href="MyPage_Info.do?cust_no=${c.cust_no}">내정보</a></li>
						<li><a href="MyPage_Folder.do?cust_no=${c.cust_no}">나의서재</a></li>
						<li><a href="optOutCustomer.do">회원탈퇴</a></li>
					</ul>
				</div>	

				<div class="map">
					<ul class="maplist">
						<li><h4 class="each_title">도서대여</h4></li>
						<li><a href="#">도서대출현황</a></li>
						<li>&nbsp;  </li>
						<li>&nbsp;  </li>
					</ul>
				</div>

				<div class="map">
					<ul class="maplist">
						<li><h4 class="each_title">커뮤니티</h4></li>
						<li><a href="postList.do?group=10">공지사항</a></li>
						<li><a href="postList.do?group=20">창작물게시판</a></li>
						<li><a href="postList.do?group=30">중고장터</a></li>
					</ul>
				</div>
			
				<div class="map">
						<ul class="maplist">
							<li><h4 class="each_title">고객지원센터</h4></li>
							<li><a href="faqViewpage.do">FAQ</a></li>
							<li><a href="QnaList.do">Q&A</a></li>
							<li><a href="addrViewpageAPI.do">오시는길</a></li>
						</ul>
					</div>
				</div>	
			</main>
		</section>
	</div>
	<footer id="main_footer">
		<p>&copy; 탈주금지조. All rights reserved. | Design by members of 탈주금지조</a>.</p>
		<img alt="" src="img/twitter_icon.png">
		<img alt="" src="img/facebook_icon.png">
		<img alt="" src="img/insta_icon.png">
		<img alt="" src="img/youtube_icon.png">
	</footer>
</body>
</html>