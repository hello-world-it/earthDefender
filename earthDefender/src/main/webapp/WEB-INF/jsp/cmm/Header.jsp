<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<title>header</title>

<link rel="stylesheet" type="text/css" href="/css/style.css">
<link href="/asset/front/css/style.css" rel="stylesheet" />

</head>
<body>

<header id="header">
	<h1 class="logo">
		<a href="/index.do"><img src="/images/index/logo.png" alt="EARTH DEFENDER 로고"></a>
	</h1>
	
	<div style="float: right; text-align: right;">
		<div class="login_logout">
			<c:choose>
				<c:when test="${empty USER_INFO.id}">
					<%-- 아이디가 없으면 로그인 버튼 --%>
					<a href="/login/actionLogin.do" class="login">로그인</a>
				</c:when>
				<c:otherwise>
					<%-- 있으면 로그아웃 버튼을 보여준다 --%>
					<a href="/login/actionLogout.do"><c:out value="${USER_INFO.name}" />님 로그아웃</a>
				</c:otherwise>
			</c:choose>
			| 회원가입
		</div>
		<div>
			<nav class="gnb">
				<ul>
					<li><a href="/search.do">주변쓰레기통찾기</a></li>
					<li><a href="/photo.do">지구방위대활동사진</a></li>
					<li><a href="/notice/selectList.do">지구방위대소식</a></li>
					<li><a href="/faq.do">자주묻는질문</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<hr style="width: 100%;">
	<br>

	<div class="menu-toggle-btn">
		<img src="/images/index/menu_bar.png" alt="menu_bar">
	</div>

	<%-- 로그인 레이어 --%>
	<div class="dim"></div>
	<!-- 로그인 -->
	<div class="layer-popup layer-login" style="display: none;">
		<header class="layer-header">
			<span class="logo_login"> 
				<span class="img-logo">earth defender 지구방위대</span>
			</span>
			<button type="button" class="layer-close">
				<span>팝업 닫기</span>
			</button>
		</header>

		<div class="layer-body">
			<form action="/login/actionLogin.do" id="frmLogin" name="frmLogin" method="post" onsubmit="return vali()">
				<input type="hidden" name="userSe" value="USR" />
				<fieldset>
					<legend>로그인을 위한 아이디/비밀번호 입력</legend>
					<div class="ipt-row">
						<input type="text" id="loginId" name="id" placeholder="아이디" required="required">
						<%-- input태그 속성 required 생략 시 맨 아래의 스크립트(vali())가 실헹 --%>
					</div>
					<div class="ipt-row">
						<input type="password" id="loginPw" name="password"
							placeholder="비밀번호" required="required">
					</div>
					<button type="submit" class="btn-login">
						<span>로그인</span>
					</button>
				</fieldset>
			</form>
		</div>
	</div>

</header>


	
<script>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>	
      
////////// 로그인 //////////
$(document).ready(function(){
		//로그인
		$(".login").click(function() {
			$(".dim, .layer-login").fadeIn();
			return false;
		});

		//레이어닫기
		$(".layer-close").click(function() {
			$(".dim, .layer-login").fadeOut();
			return false;
		});
	});

	function vali() {
		if (!$("#loginId").val()) {
			alert("아이디를 입력해주세요.");
			$("#loginId").focus();
			return false;
		}

		if (!$("#loginPw").val()) {
			alert("비밀번호를 입력해주세요.");
			$("loginPw").focus();
			return false;
		}
	}

	<c:if test="${not empty loginMessage}">
		alert("${loginMessage}");
	</c:if>
</script>
	

</body>
</html>