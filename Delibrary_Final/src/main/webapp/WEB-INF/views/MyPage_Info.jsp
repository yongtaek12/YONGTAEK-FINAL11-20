<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의도서 - 딜리브러리</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="icon" type="image/png" sizes="16x16"	href="favicon/favicon-16x16.png">

<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var app = new Vue({
	el : '#app',
	data : {
		login : '로그인',
		signup : '회원가입',
		bookcart : '북카트',
		sitemap : '사이트맵',
	}
});
/* ↑ 원래 있던 코드 */
<%-- 이미지 수정 하는 코드 시작 --%>
 $(function(){
	$("#upload_file").click(function(){
		$("#upload_find").click();
	});
}); 
<%-- 이미지 수정 하는 코드 종료 --%>

<%-- ======= 현왕 체크박스에 체크가 되있는지 확인하는 코드 ======= --%>
$(function(){
	/* $(document).find("input:checkbox").each(function(index){
		if($(this).attr("name")=="genre"){
			if($(this).is(":checked")){
				$(this).parent().css("background-color","#DAE0E5");
			}
		};
	}); */
	/* $(document).ready(function(){
		let select = 0;
		let interestButton = ['#interest1','#interest2','#interest3','#interest4','#interest5','#interest6'];	
		let interestCheck = ['#interest_check1','#interest_check2','#interest_check3','#interest_check4','#interest_check5','#interest_check6'];	
		
		for(let i=0; i < interestButton.length; i++){	
			document.querySelector(interestButton[i]).addEventListener('click', function() {
					document.querySelector(interestButton[i]).classList.toggle('active');
					select += 1;
					if(select % 2 != 0) {
						document.querySelector(interestCheck[i]).setAttribute('checked', 'checked');
						$(this).css("background-color","#DAE0E5");
					} else {
						document.querySelector(interestCheck[i]).removeAttribute('checked');
						$(this).css("background-color","#F8F9FA");
					}
			})
		}
	}); */
});
<%-- ======= 현왕 체크박스에 체크가 되있는지 확인하는 코드 ======= --%>

<%-- ============== 닉네임, 비밀번호 빈칸이면 alert띄우고 실행 x ========== --%>
$(function(){
	$(document).ready(function(){
		$("#submit").on('click', function(){
			if($("#nickname").val().length === 0){
				alert("닉네임 입력은 필수 입니다!!");
				return false;
			}
			if($("#pw").val().length === 0){
				alert("비밀번호를 확인해주세요.");
				return false;
			}
		});
	});
});
<%-- ============== 닉네임, 비밀번호 빈칸이면 alert띄우고 실행 x 종료 ========== --%>

<%-- ========= 이메일 옵션박스 에서 값 가져오기 ========================= --%>
$(function(){	
	$(document).ready(function(){
		$('select[name=emailSelection]').change(function() {
			if($(this).val()=="1"){
				$('#email').val("");
				$("#email").attr("readonly", false);
			} else {
				$('#email').val($(this).val());
				$("#email").attr("readonly", true);
			}
		});
	});
});
<%-- ========= 이메일 옵션박스 에서 값 가져오기 종료 ========================= --%>	

<!-- ===================================== 현왕 모달창 실행 자바스크립트 추가 =========================================== -->
window.onload = function() {
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $("#pw").val($("#password_1").val());
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
<!-- ===================================== 현왕 모달창 실행 자바스크립트 추가 종료 =========================================== -->

<!-- ===================================== 현왕 모달창 내용 자바스크립트 추가 & 암호 변경하면 비밀번호 <input type=text>에 전달 =========================================== -->
	$("#btn_pw_ok").click(function(){
        var pwd1 = $("#password_1").val();
        var pwd2 = $("#password_2").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
	            alert($("#password_1").val());
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
        return false;
	});
	/* $(".modal_close").click(function(){
        $("#pw").val($("#password_1").val());
		return true;
	}); */
};
<!-- ===================================== 현왕 모달창 내용 자바스크립트 추가 종료 =========================================== -->


<%-- =============현왕 주소 넣기 자바스크립트 추가================================================= --%>
function sample6_execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if(data.userSelectedType === 'R'){
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraAddr !== ''){
                      extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 해당 필드에 넣는다.
                  document.getElementById("sample6_extraAddress").value = extraAddr;
              
              } else {
                  document.getElementById("sample6_extraAddress").value = '';
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('sample6_postcode').value = data.zonecode;
              document.getElementById("sample6_address").value = addr;

              // 상세주소 빈칸 만들기
              document.getElementById("sample6_detailAddress").value = " ";
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("sample6_detailAddress").focus();
          }
      }).open();
  }
<%-- =============현왕 주소 넣기 자바스크립트 추가 종료 ================================================= --%>


</script>

</head>

<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="home.html" class="navbar-brand"><img alt="딜리브러리"
				src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown"><a href="about.html"
						class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
						<ul class="dropdown-menu dropdown-menu-left fade-down">
							<li><a class="dropdown-item" href="about.html"> 대출/반납/연장</a></li>
							<li><a class="dropdown-item" href="#"> 공지사항 </a></li>
							<li><a class="dropdown-item" href="#"> 자주묻는질문</a></li>
							<li><a class="dropdown-item" href="#"> 묻고답하기 </a></li>
							<li><a class="dropdown-item" href="#"> 오시는길 </a></li>
						</ul></li>
					<li class="nav-item dropdown"><a href="books.html"
						class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
						<ul class="dropdown-menu dropdown-menu-left fade-down">
							<li><a class="dropdown-item" href="books.html">도서검색</a></li>
							<li><a class="dropdown-item" href="#">사서추천도서</a></li>
							<li><a class="dropdown-item" href="#">신착도서</a></li>
							<li><a class="dropdown-item" href="#">인기도서</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a href="community.html"
						class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
						<ul class="dropdown-menu dropdown-menu-left fade-down">
							<li><a class="dropdown-item" href="#">창작물게시판</a></li>
							<li><a class="dropdown-item" href="#">중고장터</a></li>
							<li><a class="dropdown-item" href="#">자유게시판</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a href="mypage.html"
						class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
						<ul class="dropdown-menu dropdown-menu-left fade-down">
							<li><a class="dropdown-item" href="mypage.html"> 나의도서정보</a></li>
							<li><a class="dropdown-item" href="lentBooks.html">대출현황/이력</a></li>
							<li><a class="dropdown-item" href="myfolder.html">내서재</a></li>
							<li><a class="dropdown-item" href="#">개인정보수정</a></li>
						</ul></li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
					<li class="nav-item" v-bind:title="login"><a
						href="sitemap.html" class="nav-link"><i
							class="fas fa-sign-in-alt"></i></a></li>
					<li class="nav-item" v-bind:title="signup"><a
						href="sitemap.html" class="nav-link"><i
							class="fas fa-user-plus"></i></a></li>
					<li class="nav-item" v-bind:title="bookcart"><a
						href="sitemap.html" class="nav-link"><i class="fas fa-book"></i></a>
					</li>
					<li class="nav-item" v-bind:title="sitemap"><a
						href="sitemap.html" class="nav-link"><i class="far fa-map"></i></a>
					</li>
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
							<a href="MyPage_Folder.do?cust_no=${c.cust_no }"><li class="list-group-item">내서재</li></a>
							<a href="MyPage_Info.do?cust_no=${c.cust_no }"><li class="list-group-item active">개인정보수정</li></a>
						</ul>
					</div>
				</div>

				<!-- 메인내용 -->
				<div class="col-md-9">
					<section id="updateCustomer">
						<form action="UpdateCustomer.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="cust_no" value="${c.cust_no}">
							<input type="hidden" name="birthday" value="${c.birthday }">
							<input type="hidden" name="name" value="${c.name }">
<!-- ============================= 현왕 고객 이름 시작 ========================================================================== -->
							<div class="form-group mt-2">
								<label for="name">이름</label>
								<h3 id="id_css">${c.name }</h3>
							</div>
<!-- ============================= 현왕 고객 이름 종료 ========================================================================== -->
							<hr>								
<!-- ============================= 현왕 파일 찾기 아이콘으로 변경해서 찾을수있도록 설정 ========================================================================== -->
							<!-- 회원 사진 & 파일 찾기 -->
							<div class="form-group mt-4"  style="text-align: center;">
								<div>
								<input type="file" name="uploadFile" style="display: none;" id="upload_find">
								<input type="hidden" name="fname" value="${c.fname}">
								<img src="img/${c.fname}" width="300" height="300" id="upload_file">
								</div>
								<small class="form-text text-muted"><span class="signup_required">*</span>  사진을 클릭하면 변경이 가능합니다.</small> 
								<small class="form-text text-muted">딜리브러리에서 커뮤니티 활동시 사용할 프로필사진을 업로드 해주세요.<br> (업로드 가능 최대파일사이즈: 10MB) </small>
							</div>
<!-- ============================= 현왕 파일 찾기 아이콘으로 변경해서 찾을수있도록 설정 종료 ========================================================================== -->
							<hr>
<%-- =======================================  현왕 email select로 option 클릭시 자동 써지기 추가  ================================================= --%>
							<div class="form-group mt-4">
								<label for="email">이메일</label> <span class="signup_required">*</span>
								<div>
								<input type="text" value="${id }" name="id" id="id"> @ <input type="text" id="email" value="${email }" name="email" placeholder="이메일 주소를 입력해주세요.">
              
					            <select id="emailSelection" name="emailSelection">
								   <option value="1" selected="selected">직접입력</option>
					               <option value="naver.com">Naver</option>
					               <option value="google.com">Google</option>
					               <option value="hanmail.net">Daum</option>
					               <option value="nate.com">Nate</option>
					               <option value="outlook.com">MSN</option>
					            </select>
								</div>
							</div>
<%-- =======================================  현왕 email select로 option 클릭시 자동 써지기 추가 종료 ================================================= --%>
							<hr>
<%-- =======================================  현왕 암호 출력 & 모달 시작 ================================================= --%>
							<!-- 비번 INPUT START -->
							<div class="form-group mt-2">
								<label for="pw">비밀번호</label> <span class="signup_required">*</span>
								<div>
								<input type="password" name="pw" value="${c.pw }" id="pw" readonly="readonly"> <button type='button' id="modal_btn">암호변경</button>
								</div>
									
								<div class="black_bg"></div>
								  <div class="modal_wrap">
					  			      <div class="title">비밀번호 변경하기</div>
									  <br><br><br>
								      <div class="content_title">비밀번호</div>
										<div class="content_content">
										    <input type="password" id="password_1" class="pw" placeholder="비밀번호">
										</div>
									   <small class="form-text text-muted">비밀번호는 
										   <span class="signup_required">8~16자, 영문, 숫자, 특수문자</span>를 포함해야 합니다.
									   </small>
										 <br><br>
										<div class="content_title">비밀번호 확인</div>
										<div class="content_content">
										    <input type="password" id="password_2" class="pw" placeholder="비밀번호 확인">
										    <br>
										    <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
										    <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
										</div>
										<div id="div_result"></div>
										<br>
										<button id="btn_pw_ok" type="button">암호 확인</button>
										<button type="button" class="modal_close">창 닫기</button>
								  </div>
							</div>
<%-- =======================================  현왕 암호 출력 & 모달 종료 ================================================= --%>
							<hr>
<%-- =======================================  현왕 닉네임 시작 ================================================= --%>
							<div class="form-group my-4">
								<label for="name">닉네임</label> <span class="signup_required">*</span>
								<input class="form-control" type="text" id="nickname"
									name="nickname" placeholder="닉네임을 입력해주세요" value="${c.nickname }">
								<small class="form-text text-muted">
									딜리브러리에서 커뮤니티 활동시 사용할 닉네임을 입력해주세요.
									<br>
									<span class="signup_required">
										한글 6자 혹은 알파벳 12자
									</span>
										이내로 기입해주세요.
									<br>
										- 띄어쓰기, 특수 문자 사용 불가
									<br>
										- 욕설, 비속어 사용시 이용이 제한될 수도 있습니다.
								</small>
							</div>
<%-- =======================================  현왕 닉네임 종료 ================================================= --%>
							<hr>
<%-- =======================================  현왕 핸드폰 번호 시작 ================================================= --%>
							<div class="form-group my-4">
								<label for="m_phone">휴대폰번호</label>
								<span class="signup_required">*</span>
								<div class="input-group mb-3">
									<input class="form-control" type="tel" id="m_phone" name="m_phone" placeholder="휴대폰번호를 입력해주세요" value="${c.m_phone }">
									<div class="input-group-append">
										<button class="btn btn-outline-info btn-Customer" type="button">
											인증번호 받기
										</button>
									</div>
								</div>
							</div>
<%-- =======================================  현왕 핸드폰 번호 종료 ================================================= --%>
							<hr>
<%-- =======================================  현왕 주소 시작 ================================================= --%>
							<label for="m_phone mt-4">주소</label>
							<span class="signup_required">*</span>
			<!-- ============= 우편번호 & 참고주소 & 우편찾기 버튼 ============= -->
							<div id="address_postcode">
								<div class="input-group">
									<input class="form-control" type="text" name="addr_num"id="sample6_postcode" value="${addr_num }" placeholder="우편번호">
									<input class="form-control"	type="text" name="addr_ref" id="sample6_extraAddress" value="${addr_ref }" placeholder="참고항목">
									<button class="btn btn-outline-info btn-Customer" type="button" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
								</div>
							</div>
			<!-- ============= 본 주소 & 상세주소 ============= -->
							<div class="form-group mt-1">
								<input class="form-control" type="text" id="sample6_address" name="addr_1" value="${addr_1 }" placeholder="주소">
								<input class="form-control mt-1" type="text" id="sample6_detailAddress" name="addr_2" value="${addr_2 }" placeholder="상세주소를 입력해주세요.">
							</div>
<%-- =======================================  현왕 주소 종료 ================================================= --%>
							<hr>
							<div class="interest_check">
								<div class="interest_check"><!-- 관심장르 CHECKBOX START -->
							<div class="form-group mt-4">
								<label class="mb-1">도서 관심장르를 모두 선택해주세요.</label> <br>
							
								<c:set var="interest" value="${c.interest }"/>
				            <c:if test="${fn:contains(interest, '인문')}">
				                  <input type="checkbox" name="genre" value="인문" CHECKED="checked">인문
				            </c:if>   
				               &nbsp;
				            <c:if test="${!fn:contains(interest, '인문')}">
				                  <input type="checkbox" name="genre" value="인문">인문
				            </c:if>   
				               &nbsp;
				            <c:if test="${fn:contains(interest, '경영')}">
				               <input type="checkbox" name="genre" value="경영" CHECKED="checked">경영       
				            </c:if>   
				               &nbsp;
				            <c:if test="${!fn:contains(interest, '경영')}">
				               <input type="checkbox" name="genre" value="경영">경영       
				            </c:if>   
				               &nbsp;
				            <c:if test="${fn:contains(interest, '소설')}">
				               <input type="checkbox" name="genre" value="소설" CHECKED="checked">소설  
				            </c:if>   
				            <c:if test="${!fn:contains(interest, '소설')}">
				               <input type="checkbox" name="genre" value="소설">소설       
				            </c:if>   
				               <br>
				            <c:if test="${fn:contains(interest, '역사')}">
				               <input type="checkbox" name="genre" value="역사" CHECKED="checked">역사 
				            </c:if>   
				               &nbsp;
				            <c:if test="${fn:contains(interest, '순수과학')}">
				               <input type="checkbox" name="genre" value="순수과학" CHECKED="checked">순수과학
				            </c:if>   
				               &nbsp;
				            <c:if test="${fn:contains(interest, '응용과학')}">
				               <input type="checkbox" name="genre" value="응용과학" CHECKED="checked">응용과학
				            </c:if>   
				            <c:if test="${!fn:contains(interest, '역사')}">
				               <input type="checkbox" name="genre" value="역사">역사 
				            </c:if>   
				               &nbsp;
				            <c:if test="${!fn:contains(interest, '순수과학')}">
				               <input type="checkbox" name="genre" value="순수과학">순수과학
				            </c:if>   
				               &nbsp;
				            <c:if test="${!fn:contains(interest, '응용과학')}">
				               <input type="checkbox" name="genre" value="응용과학">응용과학
				            </c:if>
							</div><!-- 관심장르 CHECKBOX END -->
								</div>
							</div>
							<button type="submit" class="btn btn-dark btn-block mb-1 btn-Customer">수정하기</button>
						</form>
					</section>
				</div>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<footer id="main-footer" class="text-center p-4">
		<div class="container">
			<div class="row">
				<div class="col">
					<p>
						Copyright &copy; <span id="year"></span> Glozzom
					</p>
				</div>
			</div>
		</div>
	</footer>
</html>