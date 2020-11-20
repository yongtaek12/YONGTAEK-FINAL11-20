<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
<link rel="stylesheet" type="text/css" href="css/folder.css">
<link rel="stylesheet" type="text/css" href="css/book.css">

<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<title>나의서재 - 딜리브러리</title>

</head>

<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="home.html" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="about.html" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="about.html"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="#"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="#"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="#"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="#"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="books.html" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="books.html">도서검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="community.html" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#">창작물게시판</a></li>
								<li><a class="dropdown-item" href="#">중고장터</a></li>
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage.html" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage.html"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="lentBooks.html">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="myfolder.html">내서재</a></li>
								<li><a class="dropdown-item" href="#">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
					<li class="nav-item" v-bind:title="login">
						<a href="sitemap.html" class="nav-link"><i class="fas fa-sign-in-alt"></i></a>
					</li>
					<li class="nav-item" v-bind:title="signup">
						<a href="sitemap.html" class="nav-link"><i class="fas fa-user-plus"></i></a>
					</li>
					<li class="nav-item" v-bind:title="bookcart">
						<a href="sitemap.html" class="nav-link"><i class="fas fa-book"></i></a>
					</li>
					<li class="nav-item" v-bind:title="sitemap">
						<a href="sitemap.html" class="nav-link"><i class="far fa-map"></i></a>
					</li>
					<script>
						var app = new Vue({
							el: '#app',	
							data: {
								login: '로그인',
								signup: '회원가입',
								bookcart: '북카트',
								sitemap: '사이트맵',
							}});
					</script>
				</ul>
			</div>
		</div>
	</nav>
  
	<!-- PAGE HEADER -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>나의도서</h1>
			</div>
		  </div>
		</div>
	</header>
	
  <!-- MAIN SECTION -->
  <!-- 사이드바 -->
	<section id="contact" class="py-3">
		<div class="container">
		  <div class="row">
			<div class="col-md-3">
			  <div class="sidebar">
					<div class="side-head">
						<h4 class="text-light">나의도서</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<a href="mypage_main.do?cust_no=${c.cust_no }"><li class="list-group-item">나의도서정보</li></a>
						<a href="#"><li class="list-group-item">대출현황/이력</li></a>
						<a href="MyPage_Folder.do?cust_no=${cust_no }"><li class="list-group-item active">내서재</li></a>						
						<a href="MyPage_Info.do?cust_no=${c.cust_no }"><li class="list-group-item">개인정보수정</li></a>
					</ul>
					
			  </div>
      </div>

      <!-- 메인내용 -->
        <div class="col-md-9 fol_div">
       		<input type="hidden" name="cust_no" value="${c.cust_no }">
         	<div class="card">
         		<div class="card-body" id="fol_card">
			    	<img src="img/${c.fname }" width="170" height="170" align="left" style="background: white;"><br>
					<p id="fol_card_name" style="padding-top: 10%">${c.name } 님의 서재</p>
         		</div>
			</div>			
	    	<form action="MyPage_Folder.do">
				<div class="menu-search">
		
		          <!-- Search -->
		          <div class="catalog-search">
		            <input class="shuffle-search input_field " type="search" autocomplete="off" value="" maxlength="128" id="input-search" placeholder="search book" />
		            <label class="input_label" for="input-search">
		              <span class="input_label-content"></span>
		              <span class="input_label-search"></span>
		            </label>
		          </div>
		
		        </div>
	        </form>
	        <form action="#" style="text-align: left; padding-top: 10px;">
		   		<font style="font-size: x-large; font-weight: bold;" >나의 서재</font>____폴더 : ${totalFol }개&nbsp;|&nbsp;글    : ${totalRecord }개 
				<input type="submit" value="폴더추가">
			</form>
	        <hr>
	        <form action="#" style="text-align: right;">
				<input type="checkbox" name="array" value="title" onclick="changeArray(this.value)">제목 순 정렬
				<input type="checkbox" name="array" value="number" onclick="changeArray(this.value)">추가 순 정렬
				<input type="submit" value="선택폴더 삭제">
	        </form>
	        <div class="grid-container">
	        <c:forEach items="${flist}" var="f">
			 	 <a href="MyPage_File.do?group=50&cust_no=${c.cust_no }&fol_no=${f.fol_no}">
				     <span class="grid-cont-font">
					 	 <div class="folder">
						   <div class="paper one"></div>
						   <div class="paper two"></div>
						   <div class="paper three"></div>
						  <div class="paper four"></div>
					     </div>
				     	${f.fol_name }
				     </span>
					</a>
	        </c:forEach>
			</div>
        </div>
      </div>
    </div>
  </section>

  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Copyright &copy;
            <span id="year"></span> Glozzom</p>
        </div>
      </div>
    </div>
  </footer>
</html>