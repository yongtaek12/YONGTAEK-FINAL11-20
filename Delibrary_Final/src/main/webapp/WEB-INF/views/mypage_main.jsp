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
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
   <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
  <title>나의도서 - 딜리브러리</title>

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
						<a href="mypage_main.do?cust_no=${c.cust_no }"><li class="list-group-item active">나의도서정보</li></a>
						<a href="#"><li class="list-group-item">대출현황/이력</li></a>
						<a href="#"><li class="list-group-item">내서재</li></a>						
						<a href="MyPage_Info.do?cust_no=${c.cust_no }"><li class="list-group-item">개인정보수정</li></a>
					</ul>
			  </div>
      </div>

      <!-- 메인내용 -->
        <div class="col-md-9">
          <div class="p-4">
            <div class="card-body">
              
              <!-- CARD GROUPS -->
              <div class="card-group">
                <div class="card">
                  <img class="card-img-top img-fluid" src="img/${c.fname}">
                </div>
                <div class="card">
                  <div class="card-body" style="padding-top: 50px; text-align: center;">
                      <h4 class="card-title">${c.nickname}</h4>
                      <p class="card-text">${id}@${email}</p>
                      <p class="card-text">${c.interest}</p>
                      <p class="card-text">
                          <a href="MyPage_Info.do?cust_no=${c.cust_no }"><small class="text-muted">개인정보수정</small></a>
                      </p>
                  </div>
                </div>
                <div class="card">
                  <div class="card-body" style=" text-align: center;">
                      <a href="lentBooks.html"><p class="card-text">대출현황 00건</p></a>
                      <hr>
                      <a href="#"><p class="card-text">예약현황 00건</p></a>
                      <hr>
                      <a href="#"><p class="card-text">연체도서 00건</p></a>
                      <hr>
                      <a href="lentHistory.html"><p class="card-text">대출/반납이력 00건</p></a>
                  </div>
                </div>
              </div>
              <br><br>
              <!-- HOVERABLE -->
              <div class="row pb-2">
                <div class="col">
                  <h5>대출현황</h5>
                </div>
                <div class="text-right mb-2">
                  <button class="btn btn-secondary btn-sm" onclick="lentBooks()">전체보기</button>
                </div>
              </div>
              <table class="table table-hover">
                <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>도서명</th>
                        <th>대출일자</th>
                        <th>반납예정일</th>
                        <th>연체일수</th>
                    </tr>
                </thead>
                <tbody>
                  <tr>
                      <th scope="row">1</th>
                      <td><a href="#">도서제목1</a></td>
                      <td>00/00/00</td>
                      <td>00/00/00</td>
                      <td>0</td>
                  </tr>
                  <tr>
                      <th scope="row">2</th>
                      <td><a href="#">도서제목2</a></td>
                      <td>00/00/00</td>
                      <td>00/00/00</td>
                      <td>0</td>
                  </tr>
                  <tr>
                      <th scope="row">3</th>
                      <td><a href="#">도서제목3</a></td>
                      <td>00/00/00</td>
                      <td>00/00/00</td>
                      <td>0</td>
                  </tr>
                </tbody>
              </table>
              <br>

              <!-- HOVERABLE -->
              <div class="row pb-2">
                <div class="col">
                  <h5>예약현황</h5>
                </div>
                <div class="text-right mb-2">
                  <button class="btn btn-secondary btn-sm">전체보기</button>
                </div>
              </div>
              <table class="table table-hover">
                <thead>
                  <tr>
                      <th>&nbsp;</th>
                      <th>도서명</th>
                      <th>대출일자</th>
                      <th>반납예정일</th>
                      <th>연체일수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                      <th scope="row">1</th>
                      <td><a href="#">도서제목1</a></td>
                      <td>00/00/00</td>
                      <td>00/00/00</td>
                      <td>0</td>
                  </tr>
                </tbody>
              </table>
              <br>

              <div class="row pb-2">
                <div class="col">
                  <h5>연체도서</h5>
                </div>
                <div class="text-right mb-2">
                  <button class="btn btn-secondary btn-sm">전체보기</button>
                </div>
              </div>
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="text-center">연체도서가 없습니다.</td>
                  </tr>
                </thead>
              </table>
              <br>

              <!-- HOVERABLE -->
              <div class="row pb-2">
                <div class="col">
                  <h5>대출/반납이력</h5>
                </div>
                <div class="text-right mb-2">
                  <button class="btn btn-secondary btn-sm">전체보기</button>
                </div>
              </div>
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>&nbsp;</th>
                    <th>도서명</th>
                    <th>대출일자</th>
                    <th>반납예정일</th>
                    <th>연체일수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td><a href="#">도서제목1</a></td>
                    <td>00/00/00</td>
                    <td>00/00/00</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td><a href="#">도서제목2</a></td>
                    <td>00/00/00</td>
                    <td>00/00/00</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td><a href="#">도서제목3</a></td>
                    <td>00/00/00</td>
                    <td>00/00/00</td>
                    <td>0</td>
                  </tr>
                </tbody>
              </table>
            </div>
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