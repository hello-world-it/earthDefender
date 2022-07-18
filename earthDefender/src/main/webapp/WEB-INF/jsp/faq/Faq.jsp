<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>
	/* sub background */
	#main_bg { background: url("/images/back_sub.png") center top no-repeat; background-size: cover; position: relative; }
	
	.q_icon { content: "\e887"; font-family: 'Material Icons'; }
	.material-symbols-outlined { margin: 0 10px 20px 10px;
  		font-variation-settings:
 		 'FILL' 0,
 		 'wght' 400,
 		 'GRAD' 0,
 		 'opsz' 48
	}
	.container dl { font-size: 16px; margin: 0 0 0 50px; }
	.container dl .frequently { border-top:1px solid; padding: 20px; }
	.container dl .ans { display: none; border-top:1px dashed; padding: 20px; background-color: rgba(243,247,255,0.7);}
	.container dl .help_icon { float: left; display: block; width: 30px; height: 30px; text-indent: -1000em; background: url("/images/help_FILL0.png") center no-repeat; background-size: cover; }
	.container b { font-size: 18px; padding: 0 10px; }
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jquery 항상 최신버전 사용하기 -->

</head>

<body id="main_bg"> 

<%@ include file="/WEB-INF/jsp/cmm/Header.jsp" %>

<div class="container" >

	<div class="sub_title"><h2>자주묻는질문</h2></div>

	<div id="contents">
	
		<div class="total" style="margin: 0 0 20px 50px;">
			총 게시물 <strong>4</strong>건 | 현재페이지 <strong>1</strong>/ 1
		</div>
	
		<dl>
			<dt class="frequently"><b> 4 </b> 회원가입은 어떻게 하나요? </dt>
			<dd class="ans"><span class="material-symbols-outlined">check_circle</span> 잘하면 됩니다~~ ( ु ´͈ ᵕ `͈ )ु </dd>
		</dl>
		
		<dl>
			<dt class="frequently"><b> 3 </b> 쓰레기통 등록 방법 </dt>
			<dd class="ans"><span class="material-symbols-outlined">check_circle</span> 답변2 </dd>
		</dl>
		
		<dl>
			<dt class="frequently"><b> 2 </b> 포인트 적립 방법 </dt>
			<dd class="ans"><span class="material-symbols-outlined">check_circle</span> 지구방위대활동 게시판에 이미지와 텍스트 nn자 이상 올릴 시 100pt가 적립됩니다. 환경을 보호하는 당신의 사진을 글과 함께 올려주세요~ </dd>
		</dl>
		
		<dl>
			<dt class="frequently"><b> 1 </b> 포인트 사용 방법 </dt>
			<dd class="ans"><span class="material-symbols-outlined">check_circle</span> 기부금으로 연결 할 수 있을까? </dd>
		</dl>
		
		<div id="paging"> 
			1
		</div>
	
	</div>
	
</div>

<br><br><br>
<footer>
	<hr>
	<span class="copyright">Copyright(c) 2022 EARTH DEFENDER. All rights reserved.</span>
	<span class="conection"><a href="https://github.com/hello-world-it" target="_blank;"><img src="/images/index/GitHub-Mark-32px.png" alt="git허브바로가기"></a> &nbsp; <a href="https://hello-world-it.notion.site" target="_blank"><img src="/images/index/notion-logo-no-background.png" alt="노션바로가기" style="width: 32px"></a></span>
</footer>

<script>
	jQuery(function($){
		$('#contents').on('click','.frequently', function(){
			$(this).next(".ans").stop().slideToggle("fast");
		});
	});
	
</script>

</body>
</html>
