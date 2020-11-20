<%@page import="com.example.demo.vo.BorrowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="stylesheet" href="css/style.css">

<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>

<!-- 외부 CSS, JS 파일 링크 -->
<link rel="stylesheet" href="css/HomeCSS.css">
<script type="text/javascript" src="/js/HomeJS.js"></script>

<script type="text/javascript">
	window.onload = function() {
		let radios = document.getElementsByClassName('radios');
		let tables = document.getElementsByClassName('manage-table');
		let areas = document.getElementsByClassName('manage-area')
		let trs = document.getElementsByTagName('tr');
		let update_inputs = document.getElementsByClassName('update-imput');
		let update_buttons = document.getElementsByClassName('update-btn');
		let delete_buttons = document.getElementsByClassName('delete-btn');
		let update_ok_buttons = document.getElementsByClassName('update-ok');
		let delete_ok_buttons = document.getElementsByClassName('delete-ok');
		let update_tds;
		let inputs;
		let data = {};

		function makeInputsAndTds(idx) {
			update_tds = update_buttons[idx].parentNode.parentNode.childNodes;
			inputs = update_tds[0].parentNode.parentNode.parentNode.parentNode.parentNode.childNodes;
			for(let i = 1; i < update_tds.length-3; i+=2) {
				inputs[i].value = update_tds[i].innerText;
			}
		}

		for(let i = 0; i < tables.length; i++) {
			tables[i].style.display = 'none';
			areas[i].style.display = 'none';
		}
		tables[0].style.display = '';
		areas[0].style.display = '';
		

		for(let i = 0; i < radios.length; i++) {
			radios[i].onclick = function() {
				for(let i = 0; i < tables.length; i++) {
					tables[i].style.display = 'none';
					areas[i].style.display = 'none';
				}
				tables[i].style.display = '';
				areas[i].style.display = '';
			}
		}

		for(let i = 0; i < update_buttons.length; i++) {
			update_buttons[i].addEventListener('click', function(e) {
				makeInputsAndTds(i);
			}, true);
		}

		for(let i = 0; i < delete_buttons.length; i++) {
			delete_buttons[i].addEventListener('click', function(e) {
				makeInputsAndTds(i);
			}, true);
		}

		for(let i = 0; i < delete_ok_buttons.length; i++) {
			delete_ok_buttons[i].addEventListener('click', function(e) {
				data['i'] = i;
				console.log("i : " + data['i'])
				data['pk'] = inputs[1].value;
				alert(data['i']);
				alert(data['pk']);
	             $.ajax({
	                 url:"/deletefrommanager.do",
	                 type:"POST",
	                 async: false,
	                 data: data,
	                 success:function(data){
	                    alert('ok');
	                    data = {};
	                    location.reload();
	                 }, 
	                 error:function(){
	                    alert("에러발생");
	                 }
	              });
			}, true);
		}

		for(let i = 0; i < update_ok_buttons.length; i++) {
			update_ok_buttons[i].addEventListener('click', function(e) {
				data['i'] = i;
				console.log("i : " + data['i'])
				for(let i = 1; i < inputs.length-3; i+=2) {
					data[inputs[i].name] = inputs[i].value;
				}
				
	             $.ajax({
	                 url:"/updatefrommanager.do",
	                 type:"POST",
	                 async: false,
	                 data: data,
	                 success:function(data){
	                    alert('ok');
	                    data = {};
	                    location.reload();
	                 }, 
	                 error:function(){
	                    alert("에러발생");
	                 }
	              });
			}, true);
		}
	}
</script>

<style type="text/css">
	#tabs {
		text-align: center;
	}

	#manage-area {
		margin: 0 auto;
		padding: 0;
	}
	
	.manage-table {
		margin: 0 auto;
		font-size: medium;
		text-align: center;
	}
	
	.table-wrapper {
		height: 800px;
		overflow: scroll;
	}
	
	th {
		border-bottom: 3px black solid;
	}
	
	tr {
		border-bottom: 1px black solid;
	}
	
	.radios {
		display: none;
	}
	
</style>

</head>
<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
		<div class="container container-fluid">
			<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark2.jpg" height="40"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-0">
					<li class="nav-item dropdown">
						<a href="about.html" class="nav-link dropdown-toggle" data-toggle="dropdown"><b>도서관소개</b></a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="about.html"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="SearchResult.do" class="nav-link dropdown-toggle" data-toggle="dropdown"><b>도서정보</b></a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="SearchResult.do">도서 검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?group=20" class="nav-link dropdown-toggle" data-toggle="dropdown"><b>커뮤니티</b></a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage.html" class="nav-link dropdown-toggle" data-toggle="dropdown"><b>나의도서</b></a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
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
				</ul>
			</div>
		</div>
	</nav>
	
  	<!-- MANAGERPAGE CONTENTS -->
	<div id="tabs">
		<label for="cust">회원관리</label>
		<label for="book">도서관리</label>
		<label for="post">게시글관리</label>
		<label for="borrow">대여정보관리</label>
	
		<input type="radio" name="tab" class="radios" id="cust" checked="checked">
		<input type="radio" name="tab" class="radios" id="book">
		<input type="radio" name="tab" class="radios" id="post">
		<input type="radio" name="tab" class="radios" id="borrow">
	</div>

	<div class="manage-area">
		회원번호 : <input type="text" class="update-input" name="cust_no">
		관리자구분 : <input type="text" class="update-input" name="manager">
		<button class="update-ok">수정확인</button>
		<button class="delete-ok">삭제확인</button>
		<div class="table-wrapper">
			<table class="manage-table">
				<tr>
					<th>회원번호</th>
					<th>관리자구분</th>
					<th>작업</th>
				</tr>
				<c:forEach items="${clist}" var="c">
					<tr>
						<td>${c.cust_no }</td>
						<td>${c.manager }</td>
						<td>
							<button type="button" class="update-btn">수정</button>
							<button type="button" class="delete-btn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
		
	<div class="manage-area">
		도서번호 : <input type="text" value="22" class="update-input" name="b_no">
		재고 : <input type="text" value="22" class="update-input" name="b_count">
		카테고리 번호 : <input type="text" value="22" class="update-input" name="c_no">
		<button class="update-ok">수정확인</button>
		<button class="delete-ok">삭제확인</button>
		<div class="table-wrapper">
			<table class="manage-table">
				<tr>
					<th>도서번호</th>
					<th>재고</th>
					<th>카테고리 번호</th>
					<th>작업</th>
				</tr>
				<c:forEach items="${blist}" var="b">
					<tr>
						<td>${b.b_no }</td>
						<td>${b.b_count }</td>
						<td>${b.c_no }</td>
						<td>
							<button type="button" class="update-btn">수정</button>
							<button type="button" class="delete-btn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
		
	<div class="manage-area">
		게시글ID : <input type="text" value="33" class="update-input" name="p_id">
		게시글번호 : <input type="text" value="33" class="update-input" name="p_no">
		회원번호 : <input type="text" value="33" class="update-input" name="cust_no">
		<button class="update-ok">수정확인</button>
		<button class="delete-ok">삭제확인</button>
		<div class="table-wrapper">
			<table class="manage-table">
				<tr>
					<th>게시글ID</th>
					<th>게시글번호</th>
					<th>회원번호</th>
					<th>작업</th>
				</tr>
				<c:forEach items="${plist}" var="p">
					<tr>
						<td>${p.p_id }</td>
						<td>${p.p_no }</td>
						<td>${p.cust_no }</td>
						<td>
							<button type="button" class="update-btn">수정</button>
							<button type="button" class="delete-btn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
		
	<div class="manage-area">
		대여번호 : <input type="text" value="44" class="update-input" name="bor_no">
		대여일 : <input type="text" value="44" class="update-input" name="bor_date">
		반납일 : <input type="text" value="44" class="update-input" name="return_date">
		반납여부 : <input type="text" value="44" class="update-input" name="return_ok">
		대여회원번호 : <input type="text" value="44" class="update-input" name="cust_no">
		책번호 : <input type="text" value="44" class="update-input" name="b_no">
		<button class="update-ok">수정확인</button>
		<button class="delete-ok">삭제확인</button>
		<div class="table-wrapper">
			<table class="manage-table">
				<tr>
					<th>대여번호</th>
					<th>대여일</th>
					<th>반납일</th>
					<th>반납여부</th>
					<th>대여회원번호</th>
					<th>책번호</th>
					<th>작업</th>
				</tr>
				<c:forEach items="${bo_list}" var="bo">
					<tr>
						<td>${bo.bor_no }</td>
						<td>${bo.bor_date }</td>
						<td>${bo.return_date }</td>
						<td>${bo.return_ok }</td>
						<td>${bo.cust_no }</td>
						<td>${bo.b_no }</td>
						<td>
							<button type="button" class="update-btn">수정</button>
							<button type="button" class="delete-btn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>