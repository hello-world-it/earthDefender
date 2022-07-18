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

<script src="http://code.jquery.com/jquery-latest.min.js"></script> 

<!-- kakao 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14987472b0fe0c7863fde6eb78f06f0f"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer"></script>

</head>

<body id="main_bg"> 

<%@ include file="/WEB-INF/jsp/cmm/Header.jsp" %>

<div class="container" >

	<div class="sub_title"><h2>주변쓰레기통찾기</h2></div>

	<div id="contents">
		<div >
			<table style="margin-left:auto; margin-right:auto; margin-bottom:30px; width: 900px;">
				<tr>
					<th style="background:none; text-align:left; padding-bottom:15px; color:#296c82;">쓰레기통등록</th>
					<th style="background:none; text-align:left; padding-bottom:15px; color:#296c82;">쓰레기통찾기</th>
				</tr>
				<tr>
					<td rowspan="2" style="padding-bottom:5px;">쓰레기통 등록 기능 작업 중</td>
					<td style="padding-bottom:5px;"><input type="text" placeholder="읍/면/동 주소를 입력해주세요." style=" width:443px; border:2px solid gray"></td>
				</tr>
				<tr>
					<td><select style="width: 140px"><option>광역시도 선택</option></select> &nbsp; <select style="width: 140px"><option>시/군/구 선택</option></select> &nbsp; <select style="width: 140px"><option>읍/면/동 선택</option></select></td>
				</tr>
			</table>
		</div>
		<div id="map" style="width:800px; height:500px; margin: auto;"></div>
	</div>
	
	<p id="data"></p>
	
</div>

<br>
<footer>
	<hr>
	<span class="copyright">Copyright(c) 2022 EARTH DEFENDER. All rights reserved.</span>
	<span class="conection"><a href="https://github.com/hello-world-it" target="_blank;"><img src="/images/index/GitHub-Mark-32px.png" alt="git허브바로가기"></a> &nbsp; <a href="https://hello-world-it.notion.site" target="_blank"><img src="/images/index/notion-logo-no-background.png" alt="노션바로가기" style="width: 32px"></a></span>
</footer>
    
<!-- <script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴


	const url = "https://api.odcloud.kr/api/15087731/v1/uddi:9b511773-7947-46ec-9639-ab72cdc0f3db?page=1&perPage=10&serviceKey=dS8CvjgAvtcYaABLi4tcYr3YhyEWzV4LjrfniBtLZlDU0d9VLuDwa6JOeqbWvq7%2F5Xr1NwE%2B1AJheoowGMN6VQ%3D%3D";
	
	fetch(url)
		.then((res) => res.json())
		.then((myJson) => { document.getElementById("data").innerText = JSON.stringify(myJson, null, 1); });
</script> -->

    <script>
	const url = "https://api.odcloud.kr/api/15087731/v1/uddi:9b511773-7947-46ec-9639-ab72cdc0f3db?page=1&perPage=10&serviceKey=dS8CvjgAvtcYaABLi4tcYr3YhyEWzV4LjrfniBtLZlDU0d9VLuDwa6JOeqbWvq7%2F5Xr1NwE%2B1AJheoowGMN6VQ%3D%3D";

      // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
      function makeOverListener(map, marker, infowindow) {
        return function () {
          infowindow.open(map, marker);
        };
      }

      // 인포윈도우를 닫는 클로저를 만드는 함수입니다
      function makeOutListener(infowindow) {
        return function () {
          infowindow.close();
        };
      }

      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(36.3508586, 127.454463), // 지도의 중심좌표
          level: 3, // 지도의 확대 레벨
        };

      var map = new kakao.maps.Map(mapContainer, mapOption);

      var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 5, // 클러스터 할 최소 지도 레벨
      });

      
      fetch(url)
        .then((res) => res.json())
        .then((myJson) => {
          var markers = [];
          const stores = myJson.data;
          console.log(JSON.stringify(myJson, null, 1));

          console.log(stores);
          for (var i = 0; i < stores.length; i++) {
            var marker = new kakao.maps.Marker({
              position: new kakao.maps.LatLng(stores[i]["lat"], stores[i]["lng"]),
              map: map,
            });

            var infowindow = new kakao.maps.InfoWindow({
              content: stores[i]["centerName"],
            });

            markers.push(marker);

            kakao.maps.event.addListener(marker, "mouseover", makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, "mouseout", makeOutListener(infowindow));
          }

          clusterer.addMarkers(markers);
        });
    </script>
    
</body>
</html>