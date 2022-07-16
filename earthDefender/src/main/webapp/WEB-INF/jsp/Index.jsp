<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<%--
<jsp:forward page="/cmm/main/mainPage.do"/>
<script type="text/javaScript">document.location.href="<c:url value='/cmm/main/mainPage.do'/>"</script> 
--%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Language" content="ko">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지구방위대</title>

    <link rel="stylesheet" type="text/css" href="/css/style.css">
	<link href="/asset/front/css/style.css" rel="stylesheet" />

    <style>
        /* main background */
        #main_bg { background: url("/images/index/back_main.png") center top no-repeat; background-size: cover; position: relative; }
    </style>

	<%-- 구글 font --%>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

	<%-- 구글 icon --%>
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">

	<%-- main image slider --%>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>

<body id="main_bg">

    <div class="logo_hr">
        <hr>
    </div>

    <header id="header">
        <div class="logo">
        	<h1><a href="/index.do"><img src="/images/index/logo.png" alt="EARTH DEFENDER 로고"></a></h1>
        </div>
        <div style="float: right; text-align: right;">
            <div class="login_logout"> 
            	<c:choose>
					<c:when test="${empty USER_INFO.id}"> <%-- 아이디가 없으면 로그인 버튼 --%>
						<a href="/login/actionLogin.do" class="login">로그인</a>
					</c:when>
					<c:otherwise> <%-- 있으면 로그아웃 버튼을 보여준다 --%>
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
        <div class="menu-toggle-btn"><img src="/images/index/menu_bar.png" alt="menu_bar"></div>
    </header>
    

    <i class="xi-angle-left-thin" style="display: none;"></i>
    <i class="xi-angle-right-thin" style="display: none;"></i>

    <section class="bx-wrapper" style="width: 88.3%;">
        <div class="slider">
            <div><img src="/images/index/main1.png" alt="비쥬얼이미지1"></div>
            <div><img src="/images/index/main2.png" alt="비쥬얼이미지2"></div>
            <div><img src="/images/index/main3.png" alt="비쥬얼이미지3"></div>
        </div>

        <div class="m_btn controls">
            <div><button class="play"><img src="/images/index/play_circle.png" alt="재생"></button></div>
            <div><button class="pause"><img src="/images/index/pause_circle.png" alt="정지"></button></div>
        </div>
    </section>
    
    
    
    
    <%-- 로그인 레이어 --%>
	<div class="dim"></div>
	<!-- 로그인 -->
	<div class="layer-popup layer-login" style="display: none;">
		<header class="layer-header">
			<span class="logo_login">
				<span class="img-logo">earth defender 지구방위대</span>
			</span>
			<button type="button" class="layer-close"><span>팝업 닫기</span></button>
		</header>
		
		<div class="layer-body">
			<form action="/login/actionLogin.do" id="frmLogin" name="frmLogin" method="post" onsubmit="return vali()">
				<input type="hidden" name="userSe" value="USR" />
				<fieldset>
					<legend>로그인을 위한 아이디/비밀번호 입력</legend>
					<div class="ipt-row">
						<input type="text" id="loginId" name="id" placeholder="아이디" required="required"> <%-- input태그 속성 required 생략 시 맨 아래의 스크립트(vali())가 실헹 --%>
					</div>
					<div class="ipt-row">
						<input type="password" id="loginPw" name="password" placeholder="비밀번호" required="required">
					</div>
					<button type="submit" class="btn-login"><span>로그인</span></button>
				</fieldset>
			</form>
		</div>	
	</div>

	<footer></footer>
    
    
    <script>

/*    $('.bx_slider').bxSlider({
        slideWidth: 1000,
        minSlides: 4,
        maxSlides: 4,
        moveSlides: 1,
        slideMargin: 60,
        auto: true,
        autoControls: true,
        autoHover: true,
        adaptiveHeight: true,
        pager: false
      }); */

    $(document).ready(function () {
        var slide1 = $('.slider').bxSlider({
            auto: true,
            pause: 3000
        });

        $('.controls .play').on('click', function () {
            slide1.startAuto();
        })
        $('.controls .pause').on('click', function () {
            slide1.stopAuto();
        })
    });
      
      
      
////////// 로그인 //////////
$(document).ready(function(){
	//로그인
	$(".login").click(function(){
		$(".dim, .layer-login").fadeIn();
		return false;
	});
	
	//레이어닫기
	$(".layer-close").click(function(){
		$(".dim, .layer-login").fadeOut();
		return false;
	});
});

function vali() {
	if(!$("#loginId").val()) {
		alert("아이디를 입력해주세요.");
		$("#loginId").focus();
		return false;
	}
	
	if(!$("#loginPw").val()) {
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