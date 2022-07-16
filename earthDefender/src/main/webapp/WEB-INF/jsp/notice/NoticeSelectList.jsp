<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<%-- 기본 URL --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50" />
	<c:if test="${not empty searchVO.searchCondition}">
		<c:param name="searchCondition" value="${searchVO.searchCondition}" />
	</c:if>
	<c:if test="${not empty searchVO.searchKeyword}">
		<c:param name="searchKeyword" value="${searchVO.searchKeyword}" />
	</c:if>
</c:url>

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
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jquery 항상 최신버전 사용하기 -->

<style>
	/* sub background */
	#main_bg { background: url("/images/back_sub.png") center top no-repeat; background-size: cover; position: relative; }
</style>
    
</head>

<body id="main_bg"> 

<%@ include file="/WEB-INF/jsp/cmm/Header.jsp" %>

<div class="container" >

	<div class="sub_title"><h2>지구방위대소식</h2></div>

	<div id="contents" >
	
		<%-- 검색영역 
		<div id="bbs_search" >
			<form name="frm" method="post" action="/notice/selectList.do">
				<fieldset>
					<legend>검색조건입력폼</legend>
					<label for="ftext" class="hdn">검색분류선택</label>
					<select name="searchCondition" id="ftext">
						<option value="0" <c:if test="${searchVO.searchCondition eq '0'}">selected="selected"</c:if>>제목</option>
						<option value="1" <c:if test="${searchVO.searchCondition eq '1'}">selected="selected"</c:if>>내용</option>
						<option value="2" <c:if test="${searchVO.searchCondition eq '2'}">selected="selected"</c:if>>작성자</option>
					</select>
					
					<label for="inp_text" class="hdn">검색어입력</label>
					<input name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}" />" type="text" class="inp_s" id="inp_text" />
					<span class="bbtn_s">
						<input type="submit" value="검색" title="검색(수업용 게시판 게시물 내)" />
					</span>
				</fieldset>
			</form>
		</div> --%>
		
		<%-- 목록 영역 --%>
		<div id="bbs_wrap">
			<div class="total" style="float: left;">
				총 게시물 <strong><c:out value="${paginationInfo.totalRecordCount}" /></strong>건 | 현재페이지 <strong><c:out value="${paginationInfo.currentPageNo}" /></strong>/ <c:out value="${paginationInfo.totalPageCount}" />
			</div>
			<div style="float: right; padding-bottom: 2em;">
			<form name="frm" method="post" action="/notice/selectList.do">
				<fieldset>
					<legend>검색조건입력폼</legend>
					<label for="ftext" class="hdn">검색분류선택</label>
					<select name="searchCondition" id="ftext">
						<option value="0" <c:if test="${searchVO.searchCondition eq '0'}">selected="selected"</c:if>> 제목 </option>
						<option value="1" <c:if test="${searchVO.searchCondition eq '1'}">selected="selected"</c:if>> 내용 </option>
						<option value="2" <c:if test="${searchVO.searchCondition eq '2'}">selected="selected"</c:if>> 작성자 </option>
					</select>
					
					<label for="inp_text" class="hdn">검색어입력</label>
					<input name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}" />" type="text" class="inp_s" id="inp_text" />
					<span class="bbtn_s">
						<input type="submit" value="검색" title="검색(수업용 게시판 게시물 내)" />
					</span>
				</fieldset>
			</form>
			</div>
			<div class="bss_list">
				<table class="list_table">
					<thead>
						<tr>
							<th class="num" scope="col">번호</th>
							<th class="tit" scope="col">제목</th>
							<th class="writer" scope="col">작성자</th>
							<th class="date" scope="col">작성일</th>
							<th class="hits" scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<%-- 공지 글 --%>
						<c:forEach var="result" items="${signResultList}" varStatus="status">
							<tr class="notice">
								<td class="num"><span class="label-bbs spot">공지</span></td>
								<td class="tit">
									<c:url var="viewUrl" value="/notice/select.do${_BASE_PARAM}">
											<c:param name="boardId" value="${result.boardId}" />
											<c:param name="pageIndex" value="${searchVO.pageIndex}" />
									</c:url>
									<a href="${viewUrl}"><c:out value="${result.boardSj}" /></a>
								</td>
								<td class="writer" data-cell-header="작성자: ">
									<c:out value="${result.frstRegisterId}" />
								</td>
								<td class="date" data-cell-header="작성일: ">
									<fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd" />
								</td>
								<td class="hits" data-cell-header="조회수: ">
									<c:out value="${result.inqireCo}" />
								</td>
							</tr>				
						</c:forEach>
						
						<%-- 일반 글 --%>
						<c:forEach var="result"  items="${resultList}" varStatus="status"> <%-- varStatus: foreach 속성. 포이치에 대한 변수명 (이중포문 시 변수명 중복X) --%>
							<tr>
								<td class="num"> <%-- ★게시글번호. 최근 게시글이 제일 큰 번호를 갖게 / 회원목록에서도 사용 (->desc) / 선착순 예약시스템은 반대(->asc) --%>
									<c:out value="${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit) - (status.count - 1)}" />
																<%-- 올라온 총 글의 갯수		   현재 글의 페이지 번호 - 1    *	한 페이지 당 보여줄 글의 수★	 count는 1부터(index는 0부터)  --%>
								</td>
								<td class="tit">
								
									<!-- 썸네일 -->
									<c:if test="${not empty result.atchFileNm}">
										<c:url var="thumbUrl" value="/cmm/fms/getThumbImage.do">
											<c:param name="thumbYn" value="Y" />
											<c:param name="atchFileNm" value="${result.atchFileNm}" />
										</c:url>
										<img alt="" src="${thumbUrl}">
									</c:if>
									
								
									<c:url var="viewUrl" value="/notice/select.do${_BASE_PARAM}">
										<c:param name="boardId" value="${result.boardId}" />
										<c:param name="pageIndex" value="${searchVO.pageIndex}" />
									</c:url>
									<a href="${viewUrl}">
										<c:if test="${result.othbcAt eq 'Y'}"> <!-- 비밀글일 경우 -->
											<img src="/asset/BBSTMP_0000000000001/images/ico_board_lock.gif" alt="비밀 글 아이콘" />
										</c:if>
									<c:out value="${result.boardSj}" />
									</a>
								</td>
								<td class="writer" data-cell-header="작성자: ">
									<c:out value="${result.frstRegisterId}" />
								</td>
								<td class="date" data-cell-header="작성일: ">
									<fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/>
								</td>
								<td class="hits" data-cell-header="조회수: ">
									<c:out value="${result.inqireCo}" />
								</td>
							</tr>
						</c:forEach>
						
						<%-- 게시 글이 없을 경우 --%>
						<c:if test="${fn:length(resultList) == 0}"> 
							<tr class="empty">
								<td colspan="5">검색 데이터가 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			
			<div id="paging"> <!-- 페이징네이션은 spring - com - context-common 63줄 For Pagination Tag -->
				<c:url var="pageUrl" value="/notice/selectList.do${_BASE_PARAM}" />
				<c:set var="pagingParam"><c:out value="${pageUrl}" /></c:set>
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
			</div>

		</div>
	
		<div class="btn-cont ar">
			<a href="/notice/noticeRegist.do" class="btn spot">
				<i class="ico-check-spot"></i> 글쓰기
			</a>
		</div>		
		
	</div>
</div>


<!-- <script> /* forward 시 액션에 맞는 프로세서가 정상적으로 종료 시 메세지(등록되었습니다. 삭제되었습니다 등)를 보내주는 역할 */
<c:if test="${not empty message}">
	alert("${message}");
</c:if>	
      
      
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
</c:if> -->
</script>
</body>
</html>