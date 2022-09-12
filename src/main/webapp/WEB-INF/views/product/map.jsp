<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>찾아오시는 길 - 모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="/src/css/common.css">
    <link rel="stylesheet" href="/src/css/product.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<div class="container">
    <%@include file="../header.jsp" %>
    <div class="body">
        <div class="title-area">
            <div class="title">
                <h2>
                    <ion-icon name="chatbubbles-outline"></ion-icon>
                    찾아오시는 길
                </h2>
            </div>
        </div>
        <div class="category-area" id="article-title">
            <h1>GS25 대전 용두점</h1>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <!-- * 카카오맵 - 지도퍼가기 -->
                <!-- 1. 지도 노드 -->
                <div id="daumRoughmapContainer1660640858205" class="root_daum_roughmap root_daum_roughmap_landing"></div>

                <!--
                    2. 설치 스크립트
                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                -->
                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                <!-- 3. 실행 스크립트 -->
                <script charset="UTF-8">
                    new daum.roughmap.Lander({
                        "timestamp" : "1660640858205",
                        "key" : "2bdwi",
                        "mapWidth" : "640",
                        "mapHeight" : "360"
                    }).render();
                </script>
            </div>
        </div>
    </div>
    <hr>
    <%@include file="../footer.jsp" %>
</div>
</body>

</html>
