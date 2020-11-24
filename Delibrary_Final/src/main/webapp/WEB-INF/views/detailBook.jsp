<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">


  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	
  <title>도서정보 - 딜리브러리</title>
	<style>
	#main-footer {
  background: #000;
  color: #fff;
  flex-shrink: none;
}

/*  ------------------------------------------ */
/*          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!          */
/*          !!!!!!!   공통부분 추가 css 입니다!!!!!!!          */
/*          !!!!!!!      지우지 마세요           !!!!!!!!          */
/*          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!          */
/*  ------------------------------------------ */
.img{
	 width: 85%;
 	 height: 90%;
  	 padding : 30px;
 	 
}
html, body{
   height: 100%;
}

#page-content{
   flex: 1 0 auto;
}

.sidebar {
  border...
  
	
	</style>
	
  <style>
    /* 용택 - 마우스 갖다대면 효과*/
  	.reverse {
	color: white;
	background-color: #58ACFA;
	border-radius: 10px;
	}
  
  
    /* 내서재 추가 / 바로대여*/
    .buttonadd {
      border-radius: 4px;
      background-color: #F2F2F2;
      color: black;
      
      text-align: center;
      font-size: 20px;
      width: 30%;
      height: 20%;
      transition: all 0.5s;
      cursor: pointer;
      margin: 5px;
    }
    /* 내서재 추가 / 바로대여*/
    .buttonadd span {
      cursor: pointer;
      display: inline-block;
      position: relative;
      transition: 0.5s;
    }
    /* 내서재 버튼 효과/ 바로대여*/
    .buttonadd span:after {
      content: '\00bb';
      position: absolute;
      opacity: 0;
      top: 0;
      right: -20px;
      transition: 0.5s;
    }
    
    .buttonadd:hover span {
      padding-right: 25px;
    }
    
    .buttonadd:hover span:after {
      opacity: 1;
      right: 0;
    }
    </style>



  <style>
    /* 아코디안
Add a fold-out icon to any element, by adding a data-attribute:
`data-css-icon` with one of the following values:
- cross
- dots
- down
- equals
- menu
- plus
- right
AND a blank <i></i>-tag.
_Example:_
<span data-css-icon="cross">Title here<i></i><span>.
Extra modifiers are `fill`, `outline` and `square`.
_Example:_
<span data-css-icon="square cross outline">Title here<i></i><span>.
*/
[data-css-icon] {
	--animdur: .3s;
  --loading-animdur: 0.8s;
	--animtf: ease-in;
	--bdw: 2px;
  --bdrs: 50%;
  --bgc: transparent;
	--c: currentcolor;
  --dots-bgc: silver;
  --dots-size: 0.5rem;
  --icon-size: 1rem;
	--size: 3.0rem;
	align-items: center;
  cursor: pointer;
	display: flex;
	justify-content: space-between;
}
[data-css-icon] i {
  align-items: center;
  background-color: var(--bgc);
  border-radius: var(--bdrs);
  box-sizing: border-box;
  display: inline-flex;
  height: var(--size);
  justify-content: center;
  position: relative;
  transition: background-color var(--animdur) var(--animtf);
  width: var(--size);
}
[data-css-icon] i::after,
[data-css-icon] i::before {
  transform-origin: 50% 50%;
	transition: all var(--animdur) var(--animtf);
}
[data-css-icon*="down"] i::after,
[data-css-icon*="right"] i::after {
  background: transparent;
	border-color: var(--c);
	border-style: solid;
  box-sizing: border-box;
	content: '';
	display: inline-block;
	height: var(--icon-size) ;
	margin: 0;
  position: relative;
	width: var(--icon-size);
}
[data-css-icon*="down"] i::after {
	border-width: 0 var(--bdw) var(--bdw) 0;
  top: calc(0px - (var(--icon-size) / 4));
  transform: rotate(45deg);
}
[data-css-icon*="right"] i::after {
	border-width: var(--bdw) var(--bdw) 0 0;
  right: calc((var(--icon-size) / 4));
  top: 0;
	transform: rotate(45deg);
}
[data-css-icon*="equals"] i::after,
[data-css-icon*="equals"] i::before,
[data-css-icon*="cross"] i::after,
[data-css-icon*="cross"] i::before,
[data-css-icon*="menu"] i,
[data-css-icon*="menu"] i::after,
[data-css-icon*="menu"] i::before,
[data-css-icon*="plus"] i::after,
[data-css-icon*="plus"] i::before {
  /* Width need to be the diagonal of the down-arrow side-length (--size): sqrt(2) * --size. */
	--w: calc(var(--icon-size) * 1.4142135623730950488016887242097);
	background: var(--c);
	content: '';
	height: var(--bdw);
	position: absolute;
	width: var(--w);
}
[data-css-icon*="cross"] i::before,
[data-css-icon*="plus"] i::before {
	transform: rotate(90deg);
}
[data-css-icon*="equals"] i {
  --m: 4px;
}
[data-css-icon*="equals"] i::after {
  transform: translateY(var(--m));
}
[data-css-icon*="equals"] i::before {
  transform: translateY(calc(0px - var(--m)));
}
[data-css-icon*="dots"],
[data-css-icon*="menu"] {
  height: var(--size);
}
[data-css-icon*="menu"] i {
  --bdrs: 0;
  --m: 7px;
  position: relative;
  right: calc((var(--size) - var(--w)) / 2);
}
[data-css-icon*="menu"] i::after {
  top: var(--m);
}
[data-css-icon*="menu"] i::before {
  top: calc(0px - var(--m));
}
[data-css-icon*="dots"] i,
[data-css-icon*="dots"] i::after,
[data-css-icon*="dots"] i::before {
  animation: dots var(--loading-animdur) infinite alternate;
  background-color: var(--c);
  border-radius: 50%;
  content: "";
  display: inline-block;
  height: var(--dots-size);
  width: var(--dots-size);
}
[data-css-icon*="dots"] i {
  animation-delay: var(--loading-animdur);
  position: relative;
  right: calc((var(--size) - var(--dots-size)) / 4);
}
[data-css-icon*="dots"] i::after {
  animation-delay: 0s;
  left: calc(0px - (var(--dots-size) * 3));
  position: absolute;
}
[data-css-icon*="dots"] i::before {
  animation-delay: calc(var(--loading-animdur) / 2);
  left: calc(0px - (var(--dots-size) * 1.5));
  position: absolute;
}
[data-css-icon*="spin"] i::after {
  animation: spin var(--loading-animdur) infinite linear;
  border-radius: 50%;
  border: var(--bdw) solid var(--dots-bgc);
  border-left: var(--bdw) solid var(--c);
  content: "";
  height: var(--icon-size);
  transform: translateZ(0);
  width: var(--icon-size);
}
/* STATE */
[open] > summary > [data-css-icon*="cross"] i::after {
	transform: rotate(45deg);
}
[open] > summary > [data-css-icon*="cross"] i::before {
  transform: rotate(135deg);
}
[open] > summary > [data-css-icon*="down"] i::after {
  top: var(--bdw);
	transform: rotate(45deg) scale(-1) ;
}
[open] > summary > [data-css-icon*="right"] i::after {
  right: 0;
  top: calc(0px - (var(--icon-size) / 4));
	transform: rotate(135deg);
}
[open] > summary > [data-css-icon*="plus"] i::after {
	transform: rotate(180deg);
}
[open] > summary > [data-css-icon*="plus"] i::before {
	transform: rotate(-0deg);
}
[open] > summary > [data-css-icon*="equals"] i::after { transform: rotate(-45deg); }
[open] > summary > [data-css-icon*="equals"] i::before { transform: rotate(45deg); }
[open] > summary > [data-css-icon*="menu"] i { background-color: transparent; }
[open] > summary > [data-css-icon*="menu"] i::after { transform: translateY(calc(0px - var(--m))) rotate(-45deg); }
[open] > summary > [data-css-icon*="menu"] i::before { transform: translateY(var(--m)) rotate(45deg); }
/* RTL: inset-block-end fails */
[dir="rtl"] [data-css-icon*="right"] i::after {
	left: calc((var(--icon-size) / 4));
}
[dir="rtl"] [data-css-icon*="menu"] i {
	left: 0.5rem;
  right: auto;
}
/* MODIFIERS */
[data-css-icon*="outline"] i {
  border: var(--bdw) solid var(--c);
}
[data-css-icon*="fill"] {
  --bgc: hsl(196, 64%, 39%);
  --c: hsl(195, 10%, 95%);
}
[data-css-icon*="square"] {
  --bdrs: 5px;
}
/* For this demo only */
body { font-family: system-ui, sans-serif; }
/*버튼크기 
button, details { width: 6rem; }*/
button { font-family: inherit; font-size: inherit; }
details {
  height: var(--collapsed);
  overflow: hidden;
  transition: height 300ms cubic-bezier(0.4, 0.01, 0.165, 0.99);
}
details[open] {
  height: var(--expanded);
}
button,
summary { 
  background-color: var(--bgc);
  border: 0;
  border-radius: 5px;
  color: var(--c, inherit);
  list-style-type: none;
  margin: 0.5rem 0;
  outline: none;
  padding-bottom: 0.5rem;
  padding-top: 0.5rem;
  padding-inline-end: 0.5rem;
  padding-inline-start: 1rem;
  user-select: none;
}
summary::marker { display: none; }
summary::-webkit-details-marker { display: none; }
/* 4 States of summary */
button,
summary {
  --bgc: hsl(195, 10%, 90%);
}
[open] > summary {
  --bgc: hsl(195, 10%, 20%);
  --c: hsl(195, 10%, 92%);
}
button:focus,
summary:focus {
  --bgc: hsl(195, 10%, 75%);
}
[open] > summary:focus {
  --bgc: hsl(195, 10%, 10%);
    --c: hsl(195, 10%, 99%);
}
[open] > summary:focus > [data-css-icon*="fill"],
[open] > summary > [data-css-icon*="fill"] {
  --bgc: hsl(195, 10%, 80%);
  --c: hsl(195, 10%, 10%);
}
summary + * {
  color: #777;
  line-height: 1.6;
  padding: 0.5rem;
}
@keyframes dots {
  0% {
    background-color: var(--c);
  }
  50%,
  100% {
    background-color: var(--dots-bgc);
  }
}
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(1turn);
  }
}
</style>

	
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript">
//전역변수
var FOL_NO =1;
let cust_no = Number(${cust_no});
//book for DB
var b_image;
var b_title;
var b_writer="";
var b_year;
var b_price;
var detail;
//책소개 아코디안
  function setDetailsHeight(selector, wrapper = document) {
	const setHeight = (detail, open = false) => {
		detail.open = open;
		const rect = detail.getBoundingClientRect();
		detail.dataset.width = rect.width;
		detail.style.setProperty(open ? `--expanded` : `--collapsed`,`${rect.height}px`);
	}
	const details = wrapper.querySelectorAll(selector);
	const RO = new ResizeObserver(entries => {
		return entries.forEach(entry => {
			const detail = entry.target;
			const width = parseInt(detail.dataset.width, 10);
			if (width !== entry.contentRect.width) {
				detail.removeAttribute('style');
				setHeight(detail);
				setHeight(detail, true);
				detail.open = false;
			}
		})
	});
	details.forEach(detail => {
		RO.observe(detail);
	});
}
/* Run it */
setDetailsHeight('details');
$(function(){
	
	
	<!-- 홈화면에서 책 누르면 자동으로 검색되는 ajax (재성이 추가)-->
	let search = function() {
		$.ajax({
			method: "GET",
			url: "https://dapi.kakao.com/v3/search/book?target=title",
			data: { query:  $("#query").val() },
			headers: {Authorization: "KakaoAK 0050577fad730d5470e0f11bcdf64cd6"}
		})
			.done(function(msg) {
				$('#b_image').attr("src", msg.documents[0].thumbnail);
				$('#b_title').text("책 제목 : " + msg.documents[0].title);
				$('#b_writer').text("저자 : " + msg.documents[0].authors);
				$('#b_year').text("출간일 : " + (msg.documents[0].datetime).substr(0, 10));
				$('#b_price').text("가격 : " + msg.documents[0].price);
				$('#detail').text(msg.documents[0].contents);
				//변수처리
				b_image = msg.documents[0].thumbnail
				b_title = msg.documents[0].title
				b_writer = msg.documents[0].authors
				b_year = msg.documents[0].datetime
				b_price = msg.documents[0].price
				detail = msg.documents[0].contents
			});
	}
	search();
	//대여 누를시 책으로 저장하게함
	var insertBook= function(){	
		/*
		b_image
		b_title
		b_writer
		b_year
		b_price
		detail
		
		*/
		//alert(detail);
		b_writer2 = JSON.stringify(b_writer);
		
		//alert(typeof detail);
		var data ={"b_writer":b_writer2,"b_image":b_image,"b_title":b_title,"b_year":b_year,"b_price":b_price,"b_detail":detail }
		
		$.ajax({
			url:"insertBook",
			dataType:"Json",
			type:"POST",
			data:data,
			success:function(data){
				console.log(data);
				}
			});
		}
	var insertPost = function(){
		
		var P_TITLE="${b.b_title }";
		//폴더값 가져와지는지 확인용
		//alert(P_TITLE)
		var data ={"FOL_NO":FOL_NO,"P_TITLE":P_TITLE,"cust_no":cust_no,"fname":b_image }
		$.ajax({
			url:"/insertPost",
			dataType:"Json",
			type:"POST",
			data:data,
			success:function(data){
				console.log(data);
				}
			});
		}
	//마우스 갖다대면 파란색 하이라이트
	$('.folder').mouseover(function() {
		$(this).addClass("reverse",700);
	}); 
	$('.folder').mouseleave(function() {
		$(this).removeClass("reverse",700);
	});
	// 폴더 클릭하면 값가져오기
	$('#tempList').on("click","tr",function(){
		//alert($(this).find("td:eq(0)").text());
		FOL_NO =eval($(this).find("td:eq(0)").text());
		//alert(FOL_NO);
		var result = confirm("폴더에 저장하시겠어요?");
		if(result){
			insertPost();
		    alert("저장");
			
		}else{
		    alert("취소");
		}
		
		});
	//마우스 갖다대면 파란색 하이라이트
	
	$('.card-text').mouseover(function() {
		$(this).addClass("reverse",700);
	}); 
	
	$('.card-text').mouseleave(function() {
		$(this).removeClass("reverse",700);
	});
	//대여버튼
	$('#borrow').click(function(){
		if (cust_no=null){
			alert("로그인해주세요");
			}
		
		
		$('#dialog-borrow').dialog({
		modal: true, 
		height:250,
		width:340,
		buttons: {
			
			"대여": function() {
				insertBook();
				
				var count = eval(${b.b_count });
				var count2 = eval(${sumbook });
				 var b_no = eval(${b.b_no });
				 var cust_no = eval(${cust_no });
				 var data= {"cust_no":cust_no, }
					if(count2 >=100){
						alert("대여가능 도서권수를 초과하였습니다")
					}else{
						
						var b_no =eval(${b.b_no });
						var cust_no =eval(${cust_no });
						
						$.ajax({
							url :"/insertBorrow",
							dataType:"Json",
							data:data,
								//"b_no="+b_no,
							//data: "cust_no="+${cust_no }}
							type: "POST",
							success:function(data){
								alert("대출완료")
							},
							error : function(){
								alert("에러")		
							}
							});	
					}$( this ).dialog( "close" );
				//대여 날짜를 선택								
		},"취소": function() { alert("취소하셨습니다.") }
				 },					
	});						
	});
	//내서재 추가
	$('#my_library').click(function(){
		//var result = confirm('내서재에 추가하시겠습니까??'); 
			//if(result){
				//var cust_no =eval(${cust_no });
			
			
								
				$('#dialog-library').dialog({
					modal:true,
				  	show: {effect: "blind", duration: 600 },			
					height:400,
					width:550,
					buttons:   {
						"내서재보기":function(){
							$("#library-list").dialog({
								modal:true,
							  	show: {effect: "blind", duration: 600 },			
								height:500,
									width:650,
								})
							
							}
							 }
						
				});
				});
});
  </script>
  </head>
<body class="d-flex flex-column">
  
	
	<input id="query" value="${query}" type="hidden">

	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
		<!--  
			<a href="home.html" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>-->
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
								<li><a class="dropdown-item" href="SearchResult.do">도서검색</a></li>
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
								<li><a class="dropdown-item" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="borrowList.do">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="Mylibrary.jsp">내서재</a></li>
								<li><a class="dropdown-item" href="MyPage_Info.do?cust_no=${cust_no}">개인정보수정</a></li>
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
						<a href="BookCart.do" class="nav-link"><i class="fas fa-book"></i></a>
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
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
        <h1>책 상세보기</h1>
        
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
						<h4 class="text-light">책</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<a href="#"><li class="list-group-item active">책상세보기</li></a>
						<a href="#"><li class="list-group-item">대출현황/이력</li></a>
						<a href="MyLibrary.do"><li class="list-group-item">내서재</li></a>						
						<a href="#"><li class="list-group-item">개인정보수정</li></a>
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
                  <img id="b_image" class="img" src="img/${b.b_image }" alt=""style="margin-left: auto; margin-right: auto; display: block;"/>

                </div>
                <div class="card">
                  <div class="card-body">
                      <h4 class="card-title" id="b_title" name="f"></h4>
                      <p class="card-text" id="b_writer"></p>
                      <p class="card-text" id="b_year"></p>
                      <p class="card-text">이용가능 서적 :<a href="www.kyobobook.co.kr"> www.kyobobook.co.kr </a></p>
                      <p class="card-text" id="b_price">가격 : </p>
                      
                  </div>
                </div>

                </div>
              </div>
              <br><br>
              
              <!-- HOVERABLE -->
              <div class="row pb-2">
                <div class="col">
                  <h5>책정보</h5>
                  <details>
                    <summary>
                      <span data-css-icon="down fill">책소개<i></i></span>
                    </summary>
                    <div id="detail">
                    </div>
                  </details>
                  <!-- 
                  <details>
                    <summary>
                      <span data-css-icon="down fill">혹시몰라서<i></i></span>
                    </summary>
                    <div>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos minus quo ipsam culpa! Dicta, reiciendis.
                    </div>
                  </details>
					 -->
                    <br>
                    <br>
                  <button id=my_library class="buttonadd"
                  style="float: left; margin-left: 100px;">
                  <span>내서재 추가</span>
                </button>
                <button id=borrow class="buttonadd"
                  style="float: left; margin-left: 50px;">
                  <span>바로 대여</span>
                </button>
                
                
                
             <!-- 모달 다이얼로그 모음 -->
             
             <!-- 도서대여 클릭시 첫화면 -->
             
			<div id="dialog-borrow" title="도서대여" style='display: none'>
			<img width="85px" height="70px" alt="book image"
					src="img/borrow.png"><span
					style='color: green; font-size: 15pt;'> 대출하시겠습니까? </span> <!--  <span
					style='font-size: 20pt;'>${sumbook } 개</span> --><span><b><u></u></b></span>
			</div>
			<!-- 도서대여 클릭시 두번째 화면
			<div id="dialog-borrow-date" title="대출일을 선택해주세요"
				style='display: none'>
				대출일 : <input type="date" name="BOR_DATE" id="BOR_DATE"><br>
			</div> -->
            
            <!-- 내서재추가 클릭시 폴더 선택 화면 -->
            <div id="dialog-library" title="내폴더 선택" style='display: none'>
							<h3>폴더 목록</h3>
				<table width="30%" id="tempList">
					<tr>
						
					<tr>
					<c:forEach var="g" items="${f }">
					<tr>
						<td>${g.fol_no }</td>
						<!-- <td>${g.fol_no }</td> -->
						<td><img width="50px" height="60px" alt="book image"
					src="img/folder.png"></td>
						<td  id ="test" class="folder">${g.fol_name }</td>				
					</tr>
					</c:forEach>						
				</table>
				
			</div>      
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


  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
    <script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());
  </script>
</body>

</html>