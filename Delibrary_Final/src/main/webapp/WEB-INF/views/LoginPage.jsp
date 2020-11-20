<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/yurim.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <title>로그인 - 딜리브러리</title>
</head>

<body class="d-flex flex-column">
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="about.html" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do?option=p_title&search="> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="books.html" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#">도서검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="community.html" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=60">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="#">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="MyPage_Folder.do">내서재</a></li>
								<li><a class="dropdown-item" href="#">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
					<li class="nav-item" v-bind:title="login">
						<a href="LoginPage.do" class="nav-link"><i class="fas fa-sign-in-alt"></i></a>
					</li>
					<li class="nav-item" v-bind:title="signup">
						<a href="insertCustomer.do" class="nav-link"><i class="fas fa-user-plus"></i></a>
					</li>
					<li class="nav-item" v-bind:title="bookcart">
						<a href="siteMap.do" class="nav-link"><i class="fas fa-book"></i></a>
					</li>
					<li class="nav-item" v-bind:title="sitemap">
						<a href="siteMap.do" class="nav-link"><i class="far fa-map"></i></a>
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
	  <div class="darkOverlay">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>로그인</h1>
			</div>
		  </div>
		</div>
		</div>
	</header>
		
	
  <!-- MAIN SECTION -->
	<section id="loginPage">
		<!-- 타이틀: 딜리브러리 -->	
		<h1 class="heroTitle">Delibrary<span class="heroTitle_dot"> : </span> <span class="heroTitle_kor">딜리브러리</span></h1>
		<hr class="heroLine">
		
		<!-- 로그인 폼 시작 -->	
		<form action="Home.do" method="post">
		<div class="form-group mt-4">
			<input class="form-control form-control-lg loginForm" type="email" id="email" name="email" placeholder="이메일 주소">
			<input class="form-control form-control-lg mt-2 loginForm" type="password" id="pw" name="pw" placeholder="비밀번호">
			<input type="hidden" name="loginOk" value="ok">
			<button class="btn btn-dark btn-lg btn-block mt-2 btn-Customer" type="submit">로그인</button>
		</div>
	</form>
	
	<!-- 회원가입 / 이메일찾기 / 비밀번호찾기 -->	
	<div id="loginInfo">
		<p class="text-right">아직 딜리브러리 회원이 아니신가요? <br>
		<a href="insertCustomer.do">회원가입하기</a><br>
		<hr class="heroLineSecond">
		<p class="text-muted text-center mb-5">
			<a href="#" data-toggle="modal" data-target="#emailModal">이메일 찾기 </a>
			&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#pwModal">비밀번호찾기</a> </p>
		</form>
	</div>

	<!-- 이메일찾기 MODAL -->
	<div class="modal" id="emailModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">내 이메일 찾기</h5>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				<!-- 폼시작 -->
					<!-- <form action="findEmail.do" method="post"> -->
						<div class="form-group">
							<label for="username">이름</label>
							<input type="text" id="findEmail_name" name="name" placeholder="이름을 입력하세요" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="password">가입 휴대전화번호</label>
							<input type="tel" id="findEmail_cell" name="m_phone" placeholder="예시) 010-1234-5678" class="form-control" required>
						</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-outline-info btn-Customer" id="findMyEmail" type="button">내 이메일 찾기</button>
					<!-- </form> -->
					<!--폼 종료 -->
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 MODAL -->
	<div class="modal" id="pwModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">내 비밀번호 찾기</h5>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
						<div class="form-group">
							<label for="username">이름</label>
							<input type="text" id="findPw_name" placeholder="이름을 입력하세요" class="form-control">
						</div>
						<div class="form-group">
							<label for="password">가입 이메일</label>
							<input type="email" id="findPw_email" placeholder="예시)hello@delibrary.com" class="form-control">
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="submit" id="findPw_btn" class="btn btn-outline-info btn-Customer" data-dismiss="modal">비밀번호 찾기</button>
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
            <span id="year"></span> Delibrary 딜리브러리</p>
        </div>
      </div>
    </div>
  </footer>

  <!---------------------- 자바스크립트 섹션 ----------------------->

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

	$('#findMyEmail').click(function(){
		console.log('findmyEmail Ok!');
		const name = $('#findEmail_name').val();
		const m_phone = $('#findEmail_cell').val();
		
		$.ajax({
			url:'/findEmail.do',
			type:"POST",
			data: {
				'name': name,
				'm_phone': m_phone
			},
			success:function(re){				
				alert('가입하신 이메일은 ' + re + ' 입니다.'); 
			},
			error:function(){
				alert('가입 정보가 없습니다. 입력값을 확인해 주시거나 회원가입을 해주시기 바랍니다.');
			}

		});
	});

	$('#findPw_btn').click(function(){
		console.log('findPw Ok!');
		const name =$('#findPw_name').val();
		const email =$('#findPw_email').val();
		$.ajax({
			url:'/pwEmail.do',
			type:'POST',
			data: {
				'name': name,
				'email': email
			},
			success:function(result){
				if(result > 0){
					alert('가입하신 이메일로 임시 비밀번호를 발급하여 보내드렸습니다. 메일을 확인해 주시기 바랍니다.'); 
				} else {
					alert('가입 정보가 없습니다. 입력값을 확인해 주시거나 회원가입을 해주시기 바랍니다.');
				}	
			},
		 	error: function(){
		 		alert('비밀번호 변경 오류');
			}
		});		
	});
    
  </script>
</body>

</html>