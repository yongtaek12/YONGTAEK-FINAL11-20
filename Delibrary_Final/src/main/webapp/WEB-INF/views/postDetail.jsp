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
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/postCss.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
  <script>
    // Get the current year for the copyright
    $(function(){
    	$('#year').text(new Date().getFullYear());
    });
  </script>
  <title>커뮤니티 - 딜리브러리</title>
</head>

<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#">도서검색</a></li>
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
								<li><a class="dropdown-item" href="postList.do?group=60">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="#"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="#">대출현황/이력</a></li>
								<li><a class="dropdown-item" href="MyPage_Folder.do">내서재</a></li>
								<li><a class="dropdown-item" href="MyPage_">개인정보수정</a></li>
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
	<!-- 메인나브 -->
  
	<!-- 커뮤니티 헤더 -->
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <c:if test="${group eq 20}">
					<h3>창작물 게시판<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 30}">
					<h3>중고장터<br>&nbsp;</h3>
				</c:if>
				<c:if test="${group eq 60}">
					<h3>자유게시판<br>&nbsp;</h3>
				</c:if>
			</div>
		  </div>
		</div>
	</header>
	<!-- 커뮤니티 헤더 -->
	
	<!-- MAIN SECTION -->
	<section id="contact" class="py-3">
		<!-- 사이드바 -->
		<div class="container">
		  <div class="row">
			<div class="col-md-3">
			  <div class="sidebar">
					<div class="side-head">
						<h4 class="text-light">커뮤니티</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<li class="list-group-item active text-dark"><a href="postList.do?group=20">창작물게시판</a></li>
						<li class="list-group-item"><a href="postList.do?group=30">중고장터</a></li>
						<li class="list-group-item"><a href="#">자유게시판</a></li>
					</ul>
			  </div>
			</div>

			<!-- 메인내용 -->
			<div class="col-md-9 pb-4">
        <!-- ACTIONS -->
        <section id="actions" class="py-4">
          <div class="container">
            <div class="row">
              <div class="col-md-2">
                <a href="postList.do?group=${group}" class="btn btn-light btn-block">
                  <i class="fas fa-arrow-left"></i> 목록
                </a>
							</div>
							<div class="col-md-6">
								<span>&nbsp;</span>
							</div>
							<c:if test="${not empty cust_no }">
								<c:if test="${post.cust_no eq cust_no }">
		              <div class="col-md-2">
		                <a href="postUpdate.do?p_id=${post.p_id}&&cust_no=${post.cust_no}&&group=${group}" class="btn btn-success btn-block">
		                  <i class="fas fa-edit"></i> 수정
		                </a>
		              </div>
		              <div class="col-md-2">
		                <button id="btnDel" class="btn btn-outline-danger btn-block"  p_id="${post.p_id}" cust_no="${cust_no }" group="${group}">
		                  <i class="far fa-trash-alt"></i> 삭제
		                </button>
		              </div>
								</c:if>
							</c:if>
            </div>
          </div>
        </section>

				<!-- 글상세 -->
				<section id="details">
			    <div class="container">
			      <div class="row">
			        <div class="col">
			          <div class="card">
			            <div class="card-header">
			              <h4 >[말머리]${post.p_title}</h4>
										<p class="text-muted text-small pt-2 m-0">
											게시일 <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${post.p_regdate }" /> | 작성자 ${post.p_writer} | 조회 ${post.p_hit }
										</p>
			            </div>
			            <div class="card-body">
										<p class="card-text">${post.p_content}</p> 
										<c:if test="${not empty post.fname }">
											<a href="/img/${post.fname }"><img src="/img/${post.fname }" alt="${post.fname }" height="200"></a>
										</c:if>
									</div>
									<input type="hidden" name="p_id" value="${post.p_id}">
									<input type="hidden" name="p_no" value="${post.p_no}">
									<input type="hidden" name="fname" value="${post.fname}">
									<input type="hidden" name="cust_no" value="${post.cust_no}">
			
									<!-- 댓글창 -->
									<div class="card-body">
										<div class="container">
											<div class="row card-header py-2">
												<div class="p-0">
													<h5 class="m-0">댓글 
														<button id="btnInsertReply" class="btn btn-secondary btn-sm text-small" p_id="${post.p_id}" p_no="${post.p_no}" cust_no="${cust_no }" group="${group}">등록</button>
													</h5>
												</div>
											</div>  
										</div>
		                <div class="form-group">
											<textarea id="re_content" name="re_content" value="${re_content}" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
		                </div>
										<!-- 댓글목록보기 -->
			             <c:forEach var="r" items="${listReply }">
				             <table width="100%">
			                	<tr class="">
			                		<td class="text-center pr-2" rowspan="3" width="10%"><img alt="" src="img/" width="50px" height="50px" class="rounded-circle" border="1"></td>
			                		<th>${r.re_writer}</th>
			                		<td width="20%">
			                			<div class="text-right">
			                				<c:if test="${not empty cust_no }">
			                					<c:if test="${r.cust_no==cust_no }">
													<button class="btn btn-outline-success btn-sm table-align-right block-inline btnUpdateReply" id="btnUpdateReply" re_no="${r.re_no}" cust_no="${post.cust_no }"><i class="fas fa-edit"></i></button>
						                			<button class="btn btn-outline-danger btn-sm table-align-right block-inline btnDeleteReply" id="btnDeleteReply" re_no="${r.re_no}" cust_no="${r.cust_no }"><i class="far fa-trash-alt"></i></button>
			                					</c:if>
			                				</c:if>
			                			</div>
									</td>
			                	</tr>
			                	<tr>
			                		<td colspan="2">${r.re_content }</td>
			                	</tr>
			                	<tr>
			                		<td colspan="2"><small class="text-muted"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${r.re_regdate }" /></small></td>
			                	</tr>
			                </table>
			             </c:forEach>
									</div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </section>
		  </div>
	 	 </div>
	  </div>
  </section>

	<!-- FOOTER -->
	<footer id="main-footer" class="text-white mt-5 p-4">
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="text-center">
						Copyright &copy;
						<span id="year"></span>
						Delibrary
					</p>
				</div>
			</div>
		</div>
	</footer>

	<script type="text/javascript">
		$(function(){
			//게시글 삭제 버튼 btnDel
			$("#btnDel").click(function(){
				const p_id=this.getAttribute("p_id");
				const cust_no=this.getAttribute("cust_no");
				const group=this.getAttribute("group");

				var result=confirm("삭제시 복원이 불가합니다. 정말로 삭제하시겠습니까?");
				if(result){
					$.ajax({
						url:'postDelete.do',
						type:'POST',
						data:{
							"p_id":p_id,
							"cust_no":cust_no,
							"group":group
						},
						success:function(re){
							if(re>0){
								console.log(re+", 삭제 성공");
								window.location="postList.do?group="+group;
							}else{
								alert("작성자 본인만 삭제할 수 있습니다.")
							}
						},
						error:function(){
							alert("게시글 삭제에 실패하였습니다.");
						}
					});
				}
			});

			//댓글 등록 버튼 btnInsertReply
			$("#btnInsertReply").click(function(){
				const p_id=this.getAttribute("p_id");
				const p_no=this.getAttribute("p_no");
				const cust_no=this.getAttribute("cust_no");
				const group=this.getAttribute("group");
				const re_content=$("#re_content").val();

				console.log("p_id  :   "+p_id)
				console.log("p_no  :   "+p_no)
				console.log("cust_no  :   "+cust_no)
				console.log("group  :   "+group)
				console.log("re_content  :   "+re_content)

				$.ajax({
					url:'replyInsert.do',
					type: 'POST',
					data: {
							"p_id": p_id,
							"p_no": p_no,
							"cust_no": cust_no,
							"group": group,
							"re_content": re_content
						},
					success: function(re){
							if(re>0){
								console.log(re);
								window.location="postDetail.do?p_id="+p_id+"&&group="+group;
							}else{
								alert("댓글 등록 실패");
							}
						},
					error: function(){
							alert("댓글 등록 실패");
						}
				});
			});

			//댓글 삭제 btnDeleteReply
			$(".btnDeleteReply").click(function(){
				const re_no=this.getAttribute("re_no");
				const cust_no=this.getAttribute("cust_no");

				var result=confirm("삭제시 복원이 불가합니다. 정말로 삭제하시겠습니까?");
				if(result){
					$.ajax({
						url:'replyDelete.do',
						type:'POST',
						data:{
							"re_no":re_no,
							"cust_no":cust_no
						},
						success:function(re){
							if(re>0){
								console.log(re+", 삭제 성공");
								location.reload();
							}else{
								alert("작성자 본인만 삭제할 수 있습니다.")
							}
						},
						error:function(){
							alert("댓글 삭제에 실패하였습니다.");
						}						
					});
				}
			});
		});
		
	</script>

</body>  

</html>