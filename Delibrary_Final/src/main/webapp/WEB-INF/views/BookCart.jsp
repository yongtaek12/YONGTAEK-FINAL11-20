<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <title>도서정보 - 딜리브러리</title>
  <style>

 	.img-fluid {
	  height: 250px;
      width: 244px;
	  
	}

  
  </style>
  <style>
  /*
연 f8f9fa
진 343a40
*/

@media all and (min-width: 992px) {
  .navbar .nav-item .dropdown-menu {
    display: block;
    opacity: 0;
    visibility: hidden;
    transition: 0.3s;
    margin-top: 0;
  }
  .navbar .dropdown-menu.fade-down {
    top: 80%;
    transform: rotateX(-75deg);
    transform-origin: 0% 0%;
  }
  .navbar .dropdown-menu.fade-up {
    top: 180%;
  }
  .navbar .nav-item:hover .dropdown-menu {
    transition: 0.3s;
    opacity: 1;
    visibility: visible;
    top: 100%;
    transform: rotateX(0deg);
  }
}

.sidebar {
  border: 1px solid gainsboro;
}
.side-head {
  background: url('../img/side-head.jpg');
  padding: 40px;
}

body {
  overflow-x: hidden;
}

.icons {
  height: 15px;
}

.searchbar {
  border-radius: 25px;
  padding: 5px 25px;
}

#home-icons p {
  font-size: 14px;
}

.btn {
  border-radius: 25px;
}

.navbar .nav-link {
  font-size: 14px;
  text-transform: uppercase;
  padding-left: 1rem !important;
  padding-right: 1rem !important;
}

.carousel-item {
  height: 600px;
}

.carousel-image-1 {
  /* background: url('../img/image1.jpg'); */
  background-color: cadetblue;
  background-size: cover;
}

.carousel-image-2 {
  /* background: url('../img/image2.jpg'); */
  background-color: darkgoldenrod;
  background-size: cover;
}

.carousel-image-3 {
  /* background: url('../img/image3.jpg'); */
  background-color: darkseagreen;
  background-size: cover;
}

#home-heading {
  position: relative;
  min-height: 250px;
  /* background: url('../img/lights.jpg'); */
  background-attachment: fixed;
  background-repeat: no-repeat;
  text-align: center;
  color: #fff;
}

.dark-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7);
}

#video-play {
  position: relative;
  min-height: 200px;
  background: url('../img/media.jpg');
  background-attachment: fixed;
  background-repeat: no-repeat;
  background-position: 0 -300px;
  text-align: center;
  color: #fff;
}

#video-play a {
  color: #fff;
}

#page-header {
  height: 180px;
  background: url('../img/image1.jpg');
  background-position: 0 -360px;
  background-attachment: fixed;
  color: #fff;
  border-bottom: 1px #eee solid;
  padding-top: 20px;
}

.about-img {
  margin-top: -50px;
}

#faq .card {
  border: #444;
}

#faq a {
  color: #fff;
  text-decoration: none;
}

#faq .card-body,
#faq .card-header {
  background: #333;
}

#main-footer {
  background: #000;
  color: #fff;
  flex-shrink: none;
}

/*  ------------------------------------------- */
/*    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!      */
/*    !!!!!!!  공통부분 추가 css 입니다  !!!!!!!      */
/*    !!!!!!!      지우지 마세요       !!!!!!!      */
/*    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!      */
/*  ------------------------------------------- */


html, body{
   height: 100%;
}

#page-content{
   flex: 1 0 auto;
}

.sidebar {
  border: 1px solid gainsboro;
}
.side-head {
  background: url('../img/side-head.jpg');
  padding: 40px;
}
.sidebar a{
   color: #343a40;
}

.searchbar {
  border-radius: 25px;
  padding: 5px 25px;
}

.list-group .active{
   background-color: #f8f9fa;
   color: #343a40;
   border-color: #d8d8d8;
} 

#tbody a{
   color: #343a40;
}
  </style>
  
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript">
//전역변수
var bor_no = 0;
var b_no = 0;

$(function(){
	var updateborrow = function(){
		b_no
		bor_no
		//var data =$("form[name=test]").serialize() ;
		var bor_date =$('#bor_date').val()
		var return_date =$('#return_date').val()
		var return_ok =$('#return_ok').val()

        //alert(b_no);
        bor_date
		var data ={"bor_no":bor_no,"b_no":b_no,"bor_date":bor_date,"return_date":return_date,"return_ok":return_ok, }
			
		
		$.ajax({
			url:"/updateborrow",
			dataType:"Json",
			type:"POST",
			data:data,
			success:function(data){
				console.log(data);
				}
			});
		}

	var deleteborrow = function(){
		
		bor_no
		
		var data ={"bor_no":bor_no};

		
		$.ajax({
			url:"/deleteborrow",
			dataType:"Json",
			type:"POST",
			data:data,
			success:function(data){
				console.log(data);
				}
			});
		}
/*	
	$('#b').mouseleave(function() {
	       $('#option').dialog({
	   		modal: true,
	   		buttons: {
	   			"수정":function(){
	 
	   				updateborrow();
	   				},
	   			"삭제":function(){
	   				deleteborrow();
	   				
	   				}}
	              })
	      
	});
	
	
	
	
*/

//대출현황 클릭 하얀색 뛰어나오는거.

	$('#1').click(function() {
	$(this).addClass("nav-link active");
	$('#2').removeClass("active");
	$('#3').removeClass("active");
	$('#4').removeClass("active");
	
		});
		 
	$('#2').click(function() {
	$(this).addClass("nav-link active");
	$('#1').removeClass("active");
	$('#3').removeClass("active");
	$('#4').removeClass("active");
		}); 

	$('#3').click(function() {
		$(this).addClass("nav-link active");
		$('#1').removeClass("active");
		$('#2').removeClass("active");
		$('#4').removeClass("active");
			});
	
	$('#4').click(function() {
		$(this).addClass("nav-link active");
		$('#1').removeClass("active");
		$('#2').removeClass("active");
		$('#3').removeClass("active");
			});

	$('#dd').click(function() {
		var idVal=$("#dd").val();
		
		//alert(idVal);
			});
	//클릭시 b_no 값을 가져옵니다.
    $('.card-body').click(function(){
        //클릭했을때 각각 name 의 b_no 와 ID의 bor_no 의 값을 가져옵니다
		bor_no = $(this).attr("id");
		b_no=$(this).attr("name");
        //alert(b_no );
		
        alert("관리자만 접근가능" );
       	
       	$('#option').dialog({
     		modal:true,
     		buttons :{
     			"수정":function(){
     				updateborrow();
     				},
     			"삭제":function(){
     				deleteborrow();
     				
     				}

     			}

     		})
         });
       
	///여가까지가  card-body.click
    	
});
	
</script>
  
</head>
<body class="d-flex flex-column">


											<div id="option" title="update and delete" style='display:none'>
											<form name="test" id ="test">
											대여일 : <input type="date" name="bor_date" id="bor_date"><br>
											반납일 : <input type="date" name="return_date" id="return_date"><br>
											반납여부 : <input type="text" name="return_ok" id="return_ok"><br>
											<!--  책번호 : <input type="number" name="b_no" id="n_no"><br>
											-->
											
											</form>
																			
										</div>

	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container" id="page-content">
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
								<li><a class="dropdown-item" href="community.html">창작물게시판</a></li>
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
			  <h1>북카트</h1>
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
						<h4 class="text-light">북카트</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<a href="#"><li class="list-group-item active">북카트</li></a>
						<a href="BookCart.do"><li class="list-group-item">대출현황/이력</li></a>
						<a href="#"><li class="list-group-item">나의도서정보</li></a>						
						<a href="#"><li class="list-group-item">개인정보수정</li></a>
					</ul>
			  </div>
			</div>
			
			<!-- 메인내용 -->
			<div class="col-md-9">
			  <div class="p-4">
				  <!-- CARD WITH NAV -->
					<div class="card-header">
										

										
							<ul class="nav nav-tabs card-header-tabs">
							
									<li class="nav-item">
									
									<a class="nav-link active" id = "1" href="BookCart.do">대출현황</a>
									</li>
									<li class="nav-item" >
											<a class="nav-link" id ="2" href="#">예약현황</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id ="3" href="BookCart.do?return_date=sysdate">연체도서</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id ="4" href='BookCart.do?return_ok=Y'>대출/반납이력</a>
									</li>
							</ul>
					</div>
						
					<!-- CARD COLUMNS -->
					
					<div class="card-columns">
						<c:forEach var="b" items="${b }"> 
						<div class="card">
							
							
=							<div class="card-body" id="${b.bor_no }" name="${b.b_no }">
									<a href="#"><h4 class="card-title"></h4></a>
									
									<img class="card-img-top img-fluid" src="${b.b_image }" alt="">
							<!-- <img class="card-img-top img-fluid" src="img/borrow3.png" alt=""> -->		
									
									<p class="card-text">
										  ${b.b_title }  BY ${b.b_writer }<br>		
										<small class="text-muted">대여일 : ${b.bor_date } </small><br>
										<small class="text-muted">반납일 : ${b.return_date } </small><br>
											<small class="text-muted">반납여부 : ${b.return_ok }</small>
											
										 	<!-- <small class="text-muted">대여번호 : ${b.bor_no } </small><br>
											<small class="text-muted">책번호 : ${b.b_no } </small><br>	-->												
									</p>			
										</div>
										</div>	
						</c:forEach>
						
						
	</section>
  <!-- FOOTER -->
  <footer  id="main-footer" class="text-center p-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Copyright &copy;
            <span id="year"></span> Glozzom</p>
        </div>
      </div>
    </div>
  </footer>


  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
      <script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    $('.slider').click({
      infinite: true,
      slideToShow: 1,
      slideToScroll: 1
    });
  </script>
</body>

</html>