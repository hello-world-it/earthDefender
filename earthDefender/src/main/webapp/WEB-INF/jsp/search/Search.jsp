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

	<div id="contents" >
		<div id="map" style="width:800px; height:500px;"></div>
	</div>
	
	<p id="data"></p>
	
</div>

    
<script>
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

</script>

</body>
</html>





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <div id="map" style="width: 100%; height: 100vh"></div>
    <script
      type="text/javascript"
      src="https://dapi.kakao.com/v2/maps/sdk.js?appkey={해당apikey}&libraries=clusterer"
    ></script>
    
    <script>
      const url =
        "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=284&serviceKey={해당serviceKey}";

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
          center: new kakao.maps.LatLng(37.60504, 127.05591), // 지도의 중심좌표
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
[출처] 공공데이터를 통한 api 활용 (예방접종센터 위치정보)|작성자 공들이

