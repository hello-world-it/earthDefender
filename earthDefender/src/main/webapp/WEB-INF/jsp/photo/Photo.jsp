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
<title>주변쓰레기통찾기</title>

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />

<style>
	/* sub background */
	#main_bg { background: url("/images/back_sub.png") center top no-repeat; background-size: cover; position: relative; }
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jquery 항상 최신버전 사용하기 -->
</head>

<body id="main_bg"> 

<%@ include file="/WEB-INF/jsp/cmm/Header.jsp" %>

<div class="container" >

	<div class="sub_title"><h2>지구방위대활동사진</h2></div>

	<div id="contents" >이미지게시판</div>
	<br><br><br><br><br><br><br><br>
	
</div>

<footer>
	<hr>
	<span class="copyright">Copyright(c) 2022 EARTH DEFENDER. All rights reserved.</span>
	<span class="conection"><a href="https://github.com/hello-world-it" target="_blank;"><img src="/images/index/GitHub-Mark-32px.png" alt="git허브바로가기"></a> &nbsp; <a href="https://hello-world-it.notion.site" target="_blank"><img src="/images/index/notion-logo-no-background.png" alt="노션바로가기" style="width: 32px"></a></span>
</footer>
    

</body>
</html>