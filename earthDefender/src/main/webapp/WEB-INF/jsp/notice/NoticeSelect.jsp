<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<title>지구방위대소식</title> 

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

<%-- 기본 URL --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50" />
	<c:param name="pageIndex" value="${searchVO.pageIndex}" />
	
	<c:if test="${not empty searchVO.searchCondition}">
		<c:param name="searchCondition" value="${searchVO.searchCondition}" />
	</c:if>
	<c:if test="${not empty searchVO.searchKeyword}">
		<c:param name="searchKeyword" value="${searchVO.searchKeyword}" />
	</c:if>
</c:url>

<div class="container">
	<div id="contents">
		<div id="bbs_wrap">
		
			<div class="board_view">
				<dl class="tit_view">
					<dt>제목</dt>
					<dd><c:out value="${result.boardSj}" /></dd>
				</dl>
				
				<dl class="info_view2">
					<dt>작성자ID</dt>
					<dd><c:out value="${result.frstRegisterId}" /></dd>
					<dt>작성일</dt>
					<dd><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd" /></dd>
					<dt>조회수</dt>
					<dd><c:out value="${result.inqireCo}" /></dd>
				</dl>
				
				<!-- 상세보기 -->
				<dl class="tit_view">
					<dt>첨부파일목록</dt>
					<dd> <!-- import에 있는 소스를 가지고 온다 / 모듈을 가지고 불러다 사용 -->
						<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
							<c:param name="param_atchFileId" value="${result.atchFileId}" />
						</c:import>
					</dd>
				</dl>
				
				<div class="view_cont">
					<c:out value="${result.boardCn}" escapeXml="false" />
				</div>
			</div>
			
			<div class="btn-cont ar">
				<c:choose>
					<c:when test="${not empty searchVO.boardId}">
						<c:url var="uptUrl" value="/notice/noticeRegist.do${_BASE_PARAM}">
							<c:param name="boardId" value="${result.boardId}" />
						</c:url>
						<a href="${uptUrl}" class="btn">수정</a>
						
						<c:url var="delUrl" value="/notice/delete.do${_BASE_PARAM}">
							<c:param name="boardId" value="${result.boardId}" />
						</c:url>
						<a href="${delUrl}" id="btn-del" class="btn"><i class="ico-del"></i> 삭제</a>
					</c:when>
					
					<c:otherwise>
						<a href="#none" id="btn-reg" class="btn spot">등록</a>
					</c:otherwise>
				</c:choose>
				
				<c:url var="listUrl" value="/notice/selectList.do${_BASE_PARAM}" />
				<a href="${listUrl}" class="btn">목록</a>
				
			</div>
		</div>
	</div>
</div>

<footer>
	<hr>
	<span class="copyright">Copyright(c) 2022 EARTH DEFENDER. All rights reserved.</span>
	<span class="conection"><a href="https://github.com/hello-world-it" target="_blank;"><img src="/images/index/GitHub-Mark-32px.png" alt="git허브바로가기"></a> &nbsp; <a href="https://hello-world-it.notion.site" target="_blank"><img src="/images/index/notion-logo-no-background.png" alt="노션바로가기" style="width: 32px"></a></span>
</footer>


<script>
$(document).ready(function(){
	//게시글 삭제
	$("#btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	});
});
</script>

</body>
</html>

<!-- 404오류는 보통 controller의 문제 -->