<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>게시판 - 모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="/src/css/common.css">
    <link rel="stylesheet" href="/src/css/board.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/src/js/board_editor.js"></script>
</head>

<body>
<div class="container">
    <%@include file="../header.jsp" %>
    <div class="body">
        <div class="title-area">
            <div class="title">
                <h2>
                    <ion-icon name="chatbubbles-outline"></ion-icon>
                    게시판
                </h2>
                <h3>자유롭게 의견을 나누는 공간</h3>
            </div>
        </div>
        <div class="tabs-area">
            <ul class="tabs">
                <li class="tab selected">
                    <a href="javascript:history.back()">취소</a>
                </li>
                <li class="tab pink">
                    <a id="btn_submit">등록</a>
                </li>
            </ul>
        </div>
        <form id="board_form" action="${post eq null ? '/board/write' : '/board/edit/'+=post.postNo}" method="post">
            <div class="category-area" id="article_title">
                <input type="text" name="postTitle" id="editor_title"
                       placeholder="제목을 입력하세요" value="${post.postTitle }" required>
                <br>
                <select name="postCategory" id="editor_category">
<%--                    <option value="general" ${post.postCategory eq 'general' ? 'selected' : '' }>일반</option>--%>
<%--                    <option value="qna" ${post.postCategory eq 'qna' ? 'selected' : '' }>질문</option>--%>
<%--                    <option value="notice" ${post.postCategory eq 'notice' ? 'selected' : '' } ${USER.userId eq 'admin' ? '' : 'disabled'}>공지</option>--%>
                    <option value="general" ${post.selected('general') }>일반</option>
                    <option value="qna" ${post.selected('qna') }>질문</option>
                    <option value="notice" ${post.selected('notice') } ${USER.userId eq 'admin' ? '' : 'disabled'}>공지</option>
                </select>
                <p id="editor_writer_viewonly"> | ${USER.userId }(으)로 작성 중</p>
            </div>
            <div class="wide-card-area">
                <div class="wide-card">
                        <textarea name="postContent" id="editor_content"
                                  placeholder="글 작성 시 다른 이를 존중해주세요">${post.postContent }</textarea>
                </div>
            </div>
        </form>
        <div class="tools-category-area" id="tab_password">
            <h2>유의사항</h2>
            <p>저작권 침해, 광고, 음란물, 비하 및 차별, 혐오성 등의 내용은 삭제될 수 있습니다.</p>
        </div>
    </div>
    <hr>
    <%@include file="../footer.jsp" %>
</div>
</body>

</html>
