<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>행사 상품 - 모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="../src/css/common.css">
    <link rel="stylesheet" href="../src/css/product.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        let page = 1;

        function add_products(page) {
            $.ajax({
                url: "./infinite_list_ajax",
                type: "post",
                data: {
                    "page": page
                },
                success: function (data) {
                    if (data.trim() == "") {
                        $(window).off("scroll");
                    }

                    $(".product-list").append(data);
                }
            });
        }

        $(function () {
            add_products(page++);
            $(window).on("scroll", function () {
                let scrollHeight = $(document).height();
                let scrollPosition = $(window).height() + $(window).scrollTop();
                if (scrollHeight - scrollPosition < 100) {
                    add_products(page++);
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <%@include file="../header.jsp" %>
    <div class="body">
        <div class="title-area">
            <div class="title">
                <h2>
                    <ion-icon name="fast-food-outline"></ion-icon>
                    행사 상품
                </h2>
                <h3>이달의 행사 상품을 만나보세요</h3>
            </div>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <div class="product-list">
                    <!-- 비동기로 가져옴 -->
                </div>
            </div>
        </div>
    </div>
    <hr>
    <%@include file="../footer.jsp" %>
</div>
</body>

</html>