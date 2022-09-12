<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=1.0">
    <title>${code} 오류 - 모두의편의</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        html {
            background-color: black;
        }

        .container {
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container > div {
            width: 100%;
            display: block;
        }

        .container * {
            color: white;
            text-align: center;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div>
        <img src="https://http.cat/${code}" alt="${code}">
        <br>
        <p>사이트 오류라고 생각될 경우 관리자에게 문의해주세요.</p>
        <a href="/">홈으로</a>
    </div>
</div>

</body>
</html>
