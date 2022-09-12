<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>로그인 - 모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="src/css/login.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(function () {
           if ($("#id").val() == "") {
               $("#id").trigger("focus");
           } else {
               $("#pw").trigger("focus");
           }
        });
    </script>

    <!-- 아이디 기억 기능 구현(쿠키) -->
    <%
        String save_id = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("SAVE_ID")) {
                    save_id = cookie.getValue();
                    break;
                }
            }
        }
        request.setAttribute("SAVE_ID", save_id);
    %>
</head>

<body>
<div class="container">
    <div class="login_card">
        <h1><a href="/">모두의편의</a></h1>
        <form method="post" id="login_form">
            <input type="text" name="userId" id="id" class="idpw" placeholder="아이디" value="${SAVE_ID}">
            <input type="password" name="userPw" id="pw" class="idpw" placeholder="비밀번호">
            <label><input type="checkbox" name="saveId" id="save_id" ${SAVE_ID ne null ? 'checked' : ''}>아이디 기억</label><br><!-- TODO : 구현 -->
            <a onclick="alert('참 잘했어요')" style="cursor: pointer">비밀번호를 잊으셨나요?</a><br><br> <!-- TODO : 구현 -->
            <input type="submit" value="로그인"><br><br><br>
            <a href="/register">회원가입</a> | <a href="/register#tab_privacy">개인정보 처리방침</a>
        </form>
    </div>
</div>
</body>

</html>