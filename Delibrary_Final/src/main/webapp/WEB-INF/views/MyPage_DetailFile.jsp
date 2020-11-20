<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="StyleSheet" type="text/css" href="resource/TeamCSS.css">
	<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">
	<style type="text/css">
		.scroll{
		  background-color: white;
		  width: 700px;
		  height: 600px;
		  overflow-x: hidden;
		  overflow-y: scroll;
		}
	
		.file_list {
	    width: 100%; 
	    border-collapse: separate; 
	    border-spacing: 3px;
		}
		.file_list th {
		    padding: 15px; 
		    border: none; 
		    border-left: 5px solid #C03; 
		    border-bottom: 1px solid #DDD; 
		    background: #FCF0F3; 
		    font-weight: normal; 
		    text-align:center; 
		    text-shadow: 0 1px #FFF; 
		    vertical-align: middle;
		
		}
		.file_list td {
		   padding: 15px; 
		   border: none;
		   border-bottom: 1px solid #DDD; 
		   text-align: left; 
		   vertical-align: baseline;
		   background-color: #FBF2EF;
		}
		
		textarea {
	       width: 95%;
	       height: 250px;
	       padding: 10px 10px;
	       font-size: 15px;
        }
        
    .come_on{
		font-size: 85.5%
	}
	
	.come_on h1{
		text-align: center;
	}
	
	.come_on input[type=text],label {
		margin-bottom: 12px;
		padding: .4em;
		width: 95%;
	}
	</style>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="JQuery-Session-Plugin-master/jquery.session.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#a").dialog({
			autoOpen:false,
			buttons:{
				수정:function(){
					var content = $("#event_content").val();
					$("#open_button").html(content);
					//$.session.set("my_content", content);
					$("#a").dialog("close");
				},
				되돌리기:function(){
					$("#event_content").val('${p.p_content}');
				},
				취소:function(){
					$("#event_content").val("");
					$("#a").dialog("close");
				}
			},

			modal:true
		});
		/* $("#btn_save").click(){
			var my_content = $.session.get("my_content");
			
		}; */
	});

	function pro(${p.p_content}){
		content = $(this).text();
		${p.p_content} = "";
		$("#a").dialog("open");
	}
	
	</script>
</head>
<body>
	<header id="main_header">
		<div id="title">
			<a href="Home.do">
			<img alt="홈페이지" src="img/Logo.png" width=500px; height=150px;>
			</a>
		</div>
		<nav id="main_gnb">
			<ul>
				<c:if test="${empty cust_no }">
					<li><a href="LoginPage.do">로그인</a></li>
					<li><a href="insertCustomer.do">회원가입</a></li>
				</c:if>
				<c:if test="${not empty cust_no }">
					<li><a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a></li>
					<li><a href="logout.do?cust_no=${cust_no }">로그아웃</a></li>
				</c:if>
			</ul>
		</nav>
		<nav id="main_lnb">
			<div class="menu"><a>도서대여</a></div>
			<div class="menu"><a href="postList.do?group=10">커뮤니티</a></div>
				<div class="dropdown">
					<img src="resource/img/community icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="postList.do?group=10">공지사항</a></div><br>
						<div class="sub"><a href="postList.do?group=20">창작물 게시판</a></div><br>
						<div class="sub"><a href="postList.do?group=30">중고장터</a></div>
					</div>
				</div>
			<div class="menu"><a href="faqViewpage.do">고객지원</a></div>
				<div class="dropdown">
					<img src="resource/img/customer service icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="faqViewpage.do">FAQ</a></div><br>
						<div class="sub"><a href="QnaList.do">Q&A</a></div><br>
						<div class="sub"><a href="addrViewpageAPI.do">오시는길</a></div>
					</div>
				</div>
			<div class="menu"><a href="MyPage_Info.do?cust_no=${cust_no }">마이페이지</a></div>
				<div class="dropdown">
					<img src="resource/img/mypage icon.png" class="menu_icon">
					<div class="subWrapper">
						<div class="sub"><a href="MyPage_Info.do?cust_no=${cust_no}">내정보</a></div><br>
						<div class="sub"><a href="MyPage_Folder.do?cust_no=${cust_no}">나의서재</a></div><br>
						<div class="sub"><a href="optOutCustomer.do">회원탈퇴</a></div>
					</div>
				</div>
			<div class="menu"><a href="siteMap.do">사이트맵</a></div>
		</nav>
	</header>
	
	<div id="content">
	  <aside id="main_aside">
       <h2>마이페이지</h2>
			<ul>
				<li><a href="MyPage_Info.do?cust_no=${c.cust_no}">&nbsp;&nbsp;내정보</a></li>
				<li><a href="MyPage_Folder.do?cust_no=${c.cust_no}">&nbsp;&nbsp;나의서재</a></li>
				<li><a href="optOutCustomer.do">&nbsp;&nbsp;회원탈퇴</a></li>
			</ul>
      </aside>
		<section id="main_section">
		<br>
  		<div style="background-color: #aaa; width: 100% padding: 20px">
    	<img src="img/${c.fname }" width="100" heigth="100" align="left" style="background: white;"><br>
		<p align="left" style="font-size: large; font-weight: bold;">탈주금지 님의 서재</p>
		<p>&nbsp;</p>
        </div>
       	<br>
   		<br>
   		<p align="left">
   		<font style="font-size: x-large; font-weight: bold;" >세줄독후감</font>
   		</p>
   		<hr>
        <br>
        <div class="scroll">
        <p align="center" style="background-color: gray; ">
				<font style="font-weight: bold; color: white; font-size: x-large;">
				${p.p_no % 10000}<br/>
				</font>
        </p>
			<table class="file_list">
				<tr>
	        		<th scope="row">
				  		<img src="img/${p.fname }" width="100" height="100" class="file_css">
	          		</th>
        			<td style="font-size: small; color: gray; text-align: center; padding-top: 50px;"
        			 id="open_button" onclick="pro('${p.p_content}');">${p.p_content}</td>
			  	</tr>
			  	<tr>
          			<th scope="row" style="font-weight: bold;">${p.p_title }</th>
          			<td style="text-align: center; font-size: small;">${p.p_writer }</td>
			  	</tr>
			</table>
			<p align="left">
			<font style="font-size: medium; font-weight: bold;" >
			등록일 : 
			<fmt:formatDate pattern = "yyyy년 MM월 dd일" value ="${p.p_regdate }" />
			</font>
			<button id="btn_save">저장</button>
			</p>
        </div>
	<div class="come_on">
		<div id="a" title="${p.p_title }" class="come_on">
			<h1>수정</h1>
			<textarea rows="50" cols="50" id="event_content" name="event_content">${p.p_content }</textarea>
		</div>
	</div>
		</section>
	</div>
	<footer id="main_footer">
		<p>&copy; 탈주금지조. All rights reserved. | Design by members of 탈주금지조</a>.</p>
		<img alt="" src="img/twitter_icon.png">
		<img alt="" src="img/facebook_icon.png">
		<img alt="" src="img/insta_icon.png">
		<img alt="" src="img/youtube_icon.png">
	</footer>
	
</body>
</html>