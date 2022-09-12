<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>${post.postTitle} - 모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="../src/css/common.css">
    <link rel="stylesheet" href="../src/css/board.css">



    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function () {
            $(".btn-comment-edit").on("click", function () {
                let uuid = $(this).closest(".comment").data("uuid");
                let content = $(this).parent().parent().find(".comment-content").text();
                content = window.prompt("수정할 내용을 입력하세요.", content);
                if (content != null) {
                    $.ajax({
                        url: "/board/comment/update",
                        type: "POST",
                        data: {
                            commentUuid: uuid,
                            commentContent: content
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data["result"] == "success") {
                                location.reload();
                            } else {
                                alert(data["msg"]);
                            }
                        }
                    });
                }
            });

            $(".btn-comment-delete").on("click", function () {
                if (confirm("정말 삭제하시겠습니까?")) {
                    let uuid = $(this).closest(".comment").data("uuid");
                    $.ajax({
                        url: "/board/comment/delete",
                        type: "POST",
                        data: {
                            commentUuid: uuid
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data["result"] == "success") {
                                location.reload();
                            } else {
                                alert(data["msg"]);
                            }
                        }
                    });
                }
            });

            $(".btn-comment-reply").on("click", function () {
                let uuid = $(this).closest(".comment").data("uuid");
                let content = window.prompt("댓글에 답글을 달아주세요.");
                if (content != null) {
                    $.ajax({
                        url: window.location,
                        type: "POST",
                        data: {
                            parentUuid: uuid,
                            commentContent: content
                        },
                        success: function () {
                            location.reload();
                        },
                    });
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
                    <ion-icon name="chatbubbles-outline"></ion-icon>
                    게시판
                </h2>
                <h3>자유롭게 의견을 나누는 공간</h3>
            </div>
        </div>
        <div class="tabs-area">
            <ul class="tabs">
                <li class="tab selected"><a href="/board/list">목록</a></li>
                <c:if test="${USER.userId eq post.userId}">
                    <li class="tab"><a href="/board/edit/${post.postNo}">수정</a></li>
                    <li class="tab pink"><a href="/board/delete/${post.postNo}">삭제</a></li>
                </c:if>
                <c:if test="${USER.userId ne post.userId}">
                    <li class="tab"><a style="opacity: 0.5; cursor: unset">수정</a></li>
                    <li class="tab pink"><a style="opacity: 0.5; cursor: unset">삭제</a></li>
                </c:if>

            </ul>
        </div>
        <div class="category-area" id="article-title">
            <h1>${post.postTitle }</h1>
            <p>${post.postCategoryName } | ${post.userId } | ${post.postRegdate }</p>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <div id="board-content">
                    <p>${post.postContent }</p>
                </div>
            </div>
        </div>
        <div class="category-area" id="comments">
            <h2>댓글(${post.commentCount} 개)</h2>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <c:if test="${post.commentCount eq 0}">
                    <p>댓글이 없습니다.</p>
                    <hr>
                </c:if>
                <c:forEach var="c" items="${commentList}">
                    <div class="comment"
                         data-uuid="${c.commentUuid}"
                         style="${c.commentLevel gt 1 ? 'padding-left:' += 20 * (c.commentLevel - 1) += "px;" : ''}">
                            <%--                         style="${c.commentLevel gt 1 ? 'padding-left:25px;' : ''}">--%>
                        <div>
                            <p>${c.userId} | ${c.commentRegdate}
                                <c:if test="${c.userId eq USER.userId}">
                                    |
                                    <a class="btn-comment-edit">수정</a>
                                    |
                                    <a class="btn-comment-delete">삭제</a>
                                </c:if>
                                <c:if test="${USER ne null}">
                                    |
                                    <a class="btn-comment-reply">답글</a>
                                </c:if>
                            </p>
                            <p>
                                <c:if test="${c.commentLevel gt 1}">
                                    <span style="color:deeppink; font-weight: 400;">
                                        @${c.parentUserId}
                                    </span>
                                    &nbsp
                                </c:if>
                                <span class="comment-content">${c.commentContent}</span>
                            </p>
                        </div>
                    </div>
                    <hr>
                </c:forEach>
                <c:if test="${USER eq null}">
                    <p>댓글을 달려면 <a href="/login" style="font-weight: 500; text-decoration: underline">로그인</a>이 필요합니다.</p>
                </c:if>
                <c:if test="${USER ne null}">
                    <form id="comment_form" method="post">
                        <input type="text" name="commentContent" placeholder="댓글을 입력하세요">
                        <input type="submit" value="등록">
                    </form>
                </c:if>
            </div>
        </div>
    </div>
    <hr>
    <%@include file="../footer.jsp" %>
</div>
</body>

</html>
