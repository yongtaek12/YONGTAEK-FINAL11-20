<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/postCss.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
  <title>커뮤니티 - 딜리브러리</title>
</head>

<body class="d-flex flex-column">
  <div id="page-content">
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="about.do" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="about.do"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="SearchResult.do" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="SearchResult.do">도서 검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?group=20" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage_main.do?cust_no=${cust_no }" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="lentBooks.html">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="#">내서재</a></li>
								<li><a class="dropdown-item" href="MyPage_Info.do?cust_no=${cust_no}">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
	               <c:if test="${empty cust_no }">
	                  <li class="nav-item" v-bind:title="login">
	                     <a href="LoginPage.do" class="nav-link"><i class="fas fa-sign-in-alt"></i></a><p class="sr-only">로그인</p>
	                  </li>
	                  <li class="nav-item" v-bind:title="signup">
	                     <a href="insertCustomer.do" class="nav-link"><i class="fas fa-user-plus"></i></a><p class="sr-only">회원가입</p>
	                  </li>
	               </c:if>
	               <c:if test="${not empty cust_no }">
	                  <li class="nav-item p-1"><small class="text-light">${cust_name} 님</small></li>
	                  <li class="nav-item" v-bind:title="logout">
	                     <a href="logout.do?cust_no=${cust_no }" class="nav-link"><i class="fas fa-sign-out-alt"></i></a><p class="sr-only">로그아웃</p>
	                  </li>
	               </c:if>
	               <li class="nav-item" v-bind:title="bookcart">
	                  <a href="#" class="nav-link"><i class="fas fa-book"></i></a><p class="sr-only">북카트</p>
	               </li>
	               <li class="nav-item" v-bind:title="sitemap">
	                  <a href="siteMap.do" class="nav-link"><i class="fas fa-map"></i></a><p class="sr-only">사이트맵</p>
	               </li>
	               <script>
	                  var app = new Vue({
	                     el: '#app',   
	                     data: {
	                        login: '로그인',
	                        signup: '회원가입',
	                        bookcart: '북카트',
	                        sitemap: '사이트맵',
	                        logout: '로그아웃'
	                     }});
	               </script>
	            </ul>
			</div>
		</div>
	</nav>
  
	<!-- 도서관소개 PAGE HEADER -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>Q & A</h1>
			</div>
		  </div>
		</div>
	</header>
	
	<!-- MAIN SECTION -->
	<section id="contact" class="py-3">
		<!-- 사이드바 -->
		<div class="container">
		  <div class="row">
			<div class="col-md-3">
			  <div class="sidebar">
					<div class="side-head">
						<h4 class="text-light text-center">도서관소개</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<a href="about.do"><li class="list-group-item active">대출/반납/연장</li></a>
						<a href="postList.do?group=10"><li class="list-group-item">공지사항</li></a>
						<a href="faqViewpage.do"><li class="list-group-item">자주묻는질문</li></a>						
						<a href="QnaList.do?option=p_title&search="><li class="list-group-item">묻고 답하기</li></a>
						<a href="addrViewpageAPI.do"><li class="list-group-item">오시는길</li></a>
					</ul>
			  </div>
			</div>
			
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->	
	
			<!-- 메인내용 -->
			<div class="col-md-9 pb-4">
        <!-- ACTIONS -->
       <form action="QnaUpdate.do" method="post" enctype="multipart/form-data">
        <section id="actions" class="py-4">
          <div class="container">
            <div class="row">
              <div class="col-md-2">
	                <a href="QnaList.do" class="btn btn-warning">
	                  <i class="fas fa-arrow-left"></i> 취소
	                </a>
			  </div>
			  <div class="col-md-8">
				 	<span>&nbsp;</span>
			  </div>
              <div class="col-md-2">
              		<button class="btn btn-success btn-block"><i class="fas fa-check"></i> 확인</button>
              </div>
            </div>
          </div>
        </section>
				<!-- controller로 넘길 값들 -->
				<div>
					<input type="hidden" name="p_id" value="${qna.p_id }">
					<input type="hidden" name="p_no" value="${qna.p_no }">
					<input type="hidden" name="cust_no" value="${c.cust_no}">
					<input type="hidden" name="fname" value="${qna.fname}">
				</div>
				
        <!-- DETAILS -->
        <section id="details">
          <div class="container">
            <div class="row">
              <div class="col">
                <div class="card">
                  <div class="card-header">
                    <h4>내글 수정</h4>
                  </div>
                  <div class="card-body">
						<div class="form-group">
							<label for="title">제목</label>
							<input type="text" class="form-control" name="p_title" value="${qna.p_title }" placeholder="제목을 입력하세요.">
						</div>
                      <div class="form-group">
                        <label for="image">파일첨부</label>
                        <div>
                          <input type="file" name="uploadFile" value="${qna.fname }" class="input-file">
                          <img alt="${qna.fname }" src="/img/${qna.fname }" height="100">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="body">글내용</label>
                        <textarea name="p_content" class="form-control" rows="5" placeholder="내용을 입력하세요">${qna.p_content }</textarea>
                      </div>
                  </div>
	                </div>
	              </div>
	            </div>
          	</div>
        	</section>
         </form>
      	</div>
    	</div>
  	</div>
  </section>
</div>

  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
        </div>
      </div>
    </div>
  </footer>


  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

  </script>
</body>

</html>