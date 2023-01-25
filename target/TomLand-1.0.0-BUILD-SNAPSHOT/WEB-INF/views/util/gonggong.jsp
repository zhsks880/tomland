<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>

  <section id="hero" class="d-flex align-items-center freeTable">

    <div class="container">
      <div class="row">
        <div class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
          <div class="usertitle">
            <p>서울시 공공자전거 실시간 대여정보(Feat. 따릉이)</p>
          </div>

          <!-- 지도 폼 : 813f7f7330a907ed9b4c3cc23ab047c9 주소ip로 카카오디벨로퍼 셋팅함-->
          <div id="map_canvas" style="height: 600px;">
            <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=813f7f7330a907ed9b4c3cc23ab047c9"></script>
          </div>

        </div>
      </div>
    </div>

  </section><!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<script>
	
	// # 카카오 맵 실행
	let mapContainer = document.getElementById('map_canvas'),
	mapOption = {
        center: new kakao.maps.LatLng(37.551524478848, 126.9055174893), 
        level: 3 
      };

    let map = new kakao.maps.Map(mapContainer, mapOption); 

    const api_key = '7244416c45646173393478594a724c';
    let url = `http://openapi.seoul.go.kr:8088/` + api_key + `/json/bikeList/1/100/`
	
    let imgSrc = "${pageContext.request.contextPath}/resources/img/free-marker.png";
    let imgSize = new kakao.maps.Size(70, 70);
    let markerImage = new kakao.maps.MarkerImage(imgSrc, imgSize);

    $.ajax({
      url: url,
      dataType: "json", //데이터 타입은 json형태로 받아옵니다.
      success: function (result) {
        console.log(result);
        for (let i = 0; i < result.rentBikeStatus.row.length; i++) {
          console.log(result.rentBikeStatus.row[i].parkingBikeTotCnt);
          console.log(result.rentBikeStatus.row[i].rackTotCnt);
          console.log(result.rentBikeStatus.row[i].shared);
          console.log(result.rentBikeStatus.row[i].stationId);
          console.log(result.rentBikeStatus.row[i].stationLatitude);
          console.log(result.rentBikeStatus.row[i].stationLongitude);
          console.log(result.rentBikeStatus.row[i].stationName);

          let marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(result.rentBikeStatus.row[i].stationLatitude, result
              .rentBikeStatus.row[i].stationLongitude),
            title: result.rentBikeStatus.row[i].stationName,
            image: markerImage,
            clickable: true
          });
          marker.setMap(map);
          let iwContent = '<div style="padding:5px;">남은갯수:' + result.rentBikeStatus.row[i].parkingBikeTotCnt + '</div>',
            iwRemoveable = true;
          let infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: iwRemoveable
          });
          kakao.maps.event.addListener(marker, 'click', function () {
            infowindow.open(map, marker);
          });
        }
      }
    });

</script>