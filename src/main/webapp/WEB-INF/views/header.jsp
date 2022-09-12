<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="/src/js/header.js"></script>
<div class="header">
    <div class="logo-area">
        <h3>
            <a href="/">모두의편의</a>
        </h3>
    </div>
    <div class="menu-area">
        <a href="/">홈</a>
        <a href="/product/list">행사 상품</a>
        <a href="/board/list">게시판</a>
    </div>
    <div class="icon-area">
        <ion-icon name="search-outline" id="search-toggle"></ion-icon>
        <c:if test="${USER ne null}">
            <ion-icon name="person-outline" id="profile-btn"></ion-icon>
            <ion-icon name="log-out-outline" id="logout-btn"></ion-icon>
        </c:if>
        <c:if test="${USER eq null}">
            <ion-icon name="person-add-outline" id="signup-btn"></ion-icon>
            <ion-icon name="log-in-outline" id="login-btn"></ion-icon>
        </c:if>
        <ion-icon name="menu-outline" id="hamburger-toggle"></ion-icon>
    </div>
</div>
<div class="hamburger-menu">
    <a href="/">홈</a>
    <a href="/product/list">행사 상품</a>
    <a href="/board/list">게시판</a>
</div>
<div class="search">
    <form action="">
        <input type="text" placeholder="통합 검색" id="search-input">
        <button type="submit">
            <ion-icon name="search-outline"></ion-icon>
        </button>
    </form>
</div>

<script>
    $(function () {
        $("#login-btn").on("click", function () {
            location.href = "/login";
        });

        $("#profile-btn").on("click", function () {
            location.href = "/profile";
        });

        $("#signup-btn").on("click", function () {
            location.href = "/register";
        });

        $("#logout-btn").on("click", function () {
            if (confirm("로그아웃 하시겠습니까?")) {
                location.href = "/logout";
            }
        });
    });
</script>