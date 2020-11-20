<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
  <link rel="stylesheet" href="css/style.css">
  <!-- <script src="https://cdn.jsdelivr.net/npm/vue"></script> -->
  <title>도서정보 - 딜리브러리</title>
<!-- kakao 검색 API -->

<script type="text/javascript">
	$(function() {
		let booklist;

		let search = function(pageNUM) {
			if(pageNUM === undefined){
				pageNUM = 1;
			}
			let size = 48;
			$.ajax({
				method: "GET",
				url: "https://dapi.kakao.com/v3/search/book?target=title&size=" + size + "&page=" + pageNUM,
				data: { query:  $("#query").val() },
				headers: {Authorization: "KakaoAK 0050577fad730d5470e0f11bcdf64cd6"}
			})
				.done(function(msg) {
					if(pageNUM == 1){
						booklist = msg;
					}
					alert(msg.documents[0].title);
					var ul = $('<ul></ul>').addClass('card-list');
					var totalPage;
	
					for(let i = 0; i < msg.documents.length; i++) {
						var li = $('<li></li>').addClass('card');
						var a = $('<a></a>').addClass('card-image')
						$(a).css('background-image', 'url(' + msg.documents[i].thumbnail + ')');
						$(a).attr('data-image-full', msg.documents[i].thumbnail);
						a.css("width", "120px");
						a.css("height","174px");
						var img = $('<img>').attr('src', msg.documents[i].thumbnail);
	
						var a2 = $('<a></a>');
						$(a2).addClass('card-description');
						$(a2).attr('target', '_blank');
						
						var h4 = $('<h4></h4>').text(msg.documents[i].title);
						var p = $('<p></p>').text(msg.documents[i].authors);
	
						$(a).append(img);
						$(li).append(a);
						
						$(a2).append(h4);
						$(a2).append(p);
						$(li).append(a2);
	
						$(ul).append(li);
						$('.searchResult-body').append(ul);
					}
					
					let totalCount = msg.meta["pageable_count"];
					if(pageNUM != 1){
						totalCount = booklist.meta["pageable_count"];
					}
					console.log(pageNUM);
					console.log(size);
					console.log(totalCount);
					totalPage = totalCount / size + 1;
					if(totalCount / size === 0){
						totalPage = totalCount / size;
					}
					
					for(let i = 1; i <= totalPage; i++) {
						$('.paging').append($('<a></a>').addClass('paging-num').text(i));
					}

					$('.paging-num').click(function() {
						let clickedPage = $(this).text();
						$('.searchResult-body').children().remove();
						$('.paging').children().remove();
						search(clickedPage);
					});
				});
		}

		search();

		// footer
		$('#year').text(new Date().getFullYear());
		
		$('#search').click(function() {
			$("#query").val($("#bookName").val());
			$('.searchResult-body').children().remove();
			$('.paging').children().remove();
			search();
		})
	});
</script>

<style type="text/css">
	/* Lazy Load Styles */
	.card-image {
		display: block;
		background: #fff center center no-repeat;
		background-size: cover;
		margin: 0 auto;
		/* filter: blur(3px); /* blur the lowres image */ */
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 0; /* visually hide the img element */
	}
	
	.card-image.is-loaded {
		filter: none; /* remove the blur on fullres image */
		transition: filter 1s;
		margin: 0 auto;
	}
	
	/* Layout Styles */
	
	.card-list {
		display: block;
		padding: 0;
		font-size: 0;
		text-align: center;
		list-style: none;
		width: 825px;
	}
	
	.card-body {
		padding: 0;
	}
	
	.card {
		display: inline-block;
		width: 200px;
		height: 250px;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
	}
	
	.card-description {
		display: block;
		color: #515151;
		width: 200px;
		height: 100px;
		text-align: center;
	}
	
	.card-description > h4 {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: large;
		font-weight: bold;
	}
	
	.searchResult-body {
		margin-right: 150px;
		float: left;
		width: 60%;
	}
	
	.searchResult-options {
		margin-left: 150px;
		float: left;
		width: 20%;
		text-align: center;
	}
	
	.paging {
		margin: 0 auto;
		text-align: center;
		width: 100%;
		float: left;
	}
	
	.paging-num {
		margin: 0 10px;
	}
	
	.input-group {
		height: 26px;
		padding: 25px 5px 25px 5px;
		border: 1px; 
		float: left;
	}
	
	.searchResult-body {
		float: left;
	}
</style>
</head>
<body>
	<input type="hidden" value="${query}" id="query">
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
								<li><a class="dropdown-item" href="about.html"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="books.html" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="SearchResult.do">도서 검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="community.html" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage.html" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage.html"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="lentBooks.html">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="#">내서재</a></li>
								<li><a class="dropdown-item" href="MyPage_Info.do?cust_no=${cust_no}">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
					<c:if test="${cust_no == null}">
						<li class="nav-item" v-bind:title="login">
							<a href="LoginPage.do" class="nav-link"><i class="fas fa-sign-in-alt"></i></a>
						</li>
						<li class="nav-item" v-bind:title="signup">
							<a href="insertCustomer.do" class="nav-link"><i class="fas fa-user-plus"></i></a>
						</li>
					</c:if>
					<c:if test="${cust_no != null}">
						<li class="nav-item" v-bind:title="logout">
							<a href="logout.do" class="nav-link"><i class="fas fa-sign-out-alt"></i></a>
						</li>
					</c:if>
					<li class="nav-item" v-bind:title="bookcart">
						<a href="sitemap.html" class="nav-link"><i class="fas fa-book"></i></a>
					</li>
					<li class="nav-item" v-bind:title="sitemap">
						<a href="siteMap.do" class="nav-link"><i class="fas fa-map"></i></a>
					</li>
					<!-- <script>
						var app = new Vue({
							el: '#app',	
							data: {
								login: '로그인',
								signup: '회원가입',
								bookcart: '북카트',
								sitemap: '사이트맵',
							}});
					</script> -->
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- PAGE HEADER -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>도서 검색</h1>
			</div>
		  </div>
		</div>
	</header>
	
    <!-- MAIN SECTION -->
	<section id="contact" class="py-3">
		<div class="container">
		  <div class="row">
			<div class="col-md-3">
			  <div class="sidebar">
					<div class="side-head">
						<h4 class="text-light">도서정보</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<a href="#"><li class="list-group-item active">도서검색</li></a>
						<a href="#"><li class="list-group-item">사서추천도서</li></a>
						<a href="#"><li class="list-group-item">신착도서</li></a>						
						<a href="#"><li class="list-group-item">인기도서</li></a>
					</ul>
			  </div>
			</div>
			<div class="col-md-9">
				<div class="input-group">
					<input class="form-control searchbar" id="bookName" type="text"
						placeholder="책 제목 검색">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary btn-r" type="button"
							id="search">검색</button>
					</div>
				</div>
				<br><br><br>
				<!-- CARD COLUMNS -->
				<div class="searchResult-body">
					
				</div>
				<div class="paging">
					
				</div>
			</div>
		  </div>
		</div>
	</section>
	
	<div style="clear: both"></div>

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
</body>
</html>