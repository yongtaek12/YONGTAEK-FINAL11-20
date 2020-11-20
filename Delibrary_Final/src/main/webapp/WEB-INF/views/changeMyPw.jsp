<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
      integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
      integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css"
    />
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <title>비밀번호 변경 - 딜리브러리</title>
  </head>

  <body>
    <nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
      <div class="container">
        <a href="Home.do" class="navbar-brand"
          ><img
            alt="딜리브러리"
            src="img/logo_bg_dark.jpg"
            height="20"
            class="pl-3 mb-1"
        /></a>
        <button
          class="navbar-toggler"
          data-toggle="collapse"
          data-target="#navbarCollapse"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav ml-4">
            <li class="nav-item dropdown">
              <a
                href="about.html"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
                >도서관소개</a
              >
              <ul class="dropdown-menu dropdown-menu-left fade-down">
                <li>
                  <a class="dropdown-item" href="about.html"> 대출/반납/연장</a>
                </li>
                <li><a class="dropdown-item" href="#"> 공지사항 </a></li>
                <li><a class="dropdown-item" href="#"> 자주묻는질문</a></li>
                <li><a class="dropdown-item" href="#"> 묻고답하기 </a></li>
                <li><a class="dropdown-item" href="#"> 오시는길 </a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a
                href="books.html"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
                >도서정보</a
              >
              <ul class="dropdown-menu dropdown-menu-left fade-down">
                <li><a class="dropdown-item" href="books.html">도서검색</a></li>
                <li><a class="dropdown-item" href="#">사서추천도서</a></li>
                <li><a class="dropdown-item" href="#">신착도서</a></li>
                <li><a class="dropdown-item" href="#">인기도서</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a
                href="community.html"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
                >커뮤니티</a
              >
              <ul class="dropdown-menu dropdown-menu-left fade-down">
                <li>
                  <a class="dropdown-item" href="community.html"
                    >창작물게시판</a
                  >
                </li>
                <li><a class="dropdown-item" href="#">중고장터</a></li>
                <li><a class="dropdown-item" href="#">자유게시판</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a
                href="mypage.html"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
                >나의도서</a
              >
              <ul class="dropdown-menu dropdown-menu-left fade-down">
                <li>
                  <a class="dropdown-item" href="mypage.html"> 나의도서정보</a>
                </li>
                <li>
                  <a class="dropdown-item" href="lentBooks.html"
                    >대출현황/이력</a
                  >
                </li>
                <li>
                  <a class="dropdown-item" href="myfolder.html">내서재</a>
                </li>
                <li><a class="dropdown-item" href="#">개인정보수정</a></li>
              </ul>
            </li>
          </ul>
          <ul id="app" class="navbar-nav ml-auto">
            <li class="nav-item" v-bind:title="login">
              <a href="LoginPage.do" class="nav-link"
                ><i class="fas fa-sign-in-alt"></i
              ></a>
            </li>
            <li class="nav-item" v-bind:title="signup">
              <a href="insertCustmer.do" class="nav-link"
                ><i class="fas fa-user-plus"></i
              ></a>
            </li>
            <li class="nav-item" v-bind:title="bookcart">
              <a href="siteMap.do" class="nav-link"
                ><i class="fas fa-book"></i
              ></a>
            </li>
            <li class="nav-item" v-bind:title="sitemap">
              <a href="siteMap.do" class="nav-link"
                ><i class="far fa-map"></i
              ></a>
            </li>
            <script>
              var app = new Vue({
                el: "#app",
                data: {
                  login: "로그인",
                  signup: "회원가입",
                  bookcart: "북카트",
                  sitemap: "사이트맵"
                }
              });
            </script>
          </ul>
        </div>
      </div>
    </nav>

    <!-- MAIN SECTION -->

    <section id="pwChangePage">
      <!-- 타이틀: 딜리브러리 -->

      <!-- 로그인 폼 시작 -->
      <form action="Home.do" method="post">
        <!-- JUMBOTRON -->
        <div class="jumbotron text-center mt-5">
          <h1 class="text-center">비밀번호 변경</h1>
          <hr />

         
            <div class="form-group pw-changeForm m-auto">
              <label for="email">가입 이메일</label>
              <input
                class="form-control mb-3"
                type="email"
                id="pwChange_email"
                placeholder="ex) hello@delibrary.com"
              />
            </div>

            <div class="form-group pw-changeForm m-auto">
              <label for="password">새 비밀번호</label>
              <input class="form-control  mb-3" type="password" id="pwChange_pw" placeholder="비밀번호를 입력해주세요.">
            </div>
                <div class="form-group pw-changeForm m-auto">
              <label for="name">새 비밀번호 확인</label>
              <input class="form-control mb-" type="password" id="pwChange_pw_ck" placeholder="비밀번호를 다시 입력해주세요.">
              <small class="form-text pw_message text-left" id="pw_match">비밀번호가 일치하지 않습니다.</small>
				      <small class="form-text pw_message text-left" id="pw_length">8~16자로 설정해주세요. </small>
				      <small class="form-text pw_message mb-1 text-left" id="pw_ok">영문 대문자, 소문자, 숫자 조합으로 해주세요.</small>
            </div>
       
        
             <a class="btn btn-dark btn-lg mt-4" href="#" role="button">비밀번호 변경하기</a>
          </div>

        </div>
      </form>
    </section>

    <!-- FOOTER -->
    <footer id="main-footer" class="text-center p-4">
      <div class="container">
        <div class="row">
          <div class="col">
            <p>Copyright &copy; <span id="year"></span> 딜리브러리 Delibrary</p>
          </div>
        </div>
      </div>
    </footer>

    <script
      src="http://code.jquery.com/jquery-3.3.1.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
      integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
      integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
      crossorigin="anonymous"
    ></script>

    <script>
      // Get the current year for the copyright
      $("#year").text(new Date().getFullYear());

      //////////////////////////**비밀번호 및 비밀번호 확인**//////////////////////////////////
	let inputPw = document.getElementById('pwChange_pw'); //패스워드 입력 
	let inputPw_check = document.getElementById('pwChange_pw_ck'); //패스워드 체크 입력

	let pw_length = document.getElementById('pw_length'); //패스워드 길이 메세지
	let pw_match = document.getElementById('pw_match'); // 패스워드 매치 메세지
	let pw_ok = document.getElementById('pw_ok'); // 패스워드 조합 메세지
	
	//패스워드창 클릭하면 메세지 띄우기
	inputPw.onfocus = function () {
		inputPw.classList.add('is-invalid');
		pw_match.style.display = 'block';
		pw_length.style.display = 'block';
		pw_ok.style.display = 'block';
	}

	//패스워드창 클릭 안하면 초록/빨강 인풋 테두리 없에기
	inputPw.onblur = function(){
		inputPw.classList.remove('is-invalid');
		inputPw.classList.remove('is-valid');
	}

	//패스워드창 패스워드 체크
	inputPw.onkeyup = function(){
		let lowerCaseLetters = /[a-z]/g;
		let upperCaseLetters = /[A-Z]/g;
		let numbers = /[0-9]/g;

		//패스워드 8~16자, 대문자, 소문자 다 있으면 메세지 없에기
		if(inputPw.value.match(lowerCaseLetters) && inputPw.value.match(upperCaseLetters) && inputPw.value.match(numbers)){
			pw_ok.style.display = 'none';
		}

		//패스워드 길이 8자 이상이면 메세지 없에기
		if(inputPw.value.length >= 8) {
			pw_length.style.display = 'none';
		}

		//조건 다 맞으면 인풋 테두리 초록
		if (inputPw.value.match(lowerCaseLetters) && inputPw.value.match(upperCaseLetters) && inputPw.value.match(numbers) && (inputPw.value.length >= 8)) {
			inputPw.classList.remove('is-invalid');
			inputPw.classList.add('is-valid');
		}
	}

	//패스워드체크창 클릭하면 빨간테두리
	inputPw_check.onfocus = function() {
		inputPw_check.classList.add('is-invalid');
	}

	//패스워드체크창 나가면 테두리 빼기
	inputPw_check.onblur = function() {
		inputPw.classList.remove('is-invalid');
		inputPw.classList.remove('is-valid');
	}
	
	inputPw_check.onkeyup = function(){
		inputPw_val = document.getElementById('pwChange_pw').value; //패스워드 입력값
		inputPw_check_val = document.getElementById('pwChange_pw_ck').value; // 패스워드 체크 입력값

		if(inputPw_val === inputPw_check_val) { //두개 값 같아지면 초록테두리 
			inputPw_check.classList.remove('is-invalid');
			inputPw_check.classList.add('is-valid');
			pw_match.style.display = 'none'; //불일치 메세지 없에기
		}
	}
    </script>
  </body>
</html>