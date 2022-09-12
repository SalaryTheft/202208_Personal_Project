<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>${prd.prdName} - 모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="/src/css/common.css">
    <link rel="stylesheet" href="/src/css/product.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function () {
            $(".btn-comment-edit").on("click", function () {
                let uuid = $(this).closest(".comment").data("uuid");
                let content = $(this).parent().siblings(".comment-content").text();
                content = window.prompt("수정할 내용을 입력하세요.", content);
                if (content != null) {
                    $.ajax({
                        url: "/product/comment/update",
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
                        url: "/product/comment/delete",
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
                    행사 상품
                </h2>
                <h3>이달의 행사 상품을 만나보세요</h3>
            </div>
        </div>
        <div class="tabs-area">
            <ul class="tabs">
                <li class="tab selected"><a onclick="window.history.back()" style="cursor:pointer">목록</a></li>
            </ul>
        </div>
        <div class="category-area" id="article-title">
            <h1>${prd.prdName}</h1>
            <!-- <p>어쩌구저쩌구</p> -->
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <div id="board-content" style="line-height: 8px">
                    <img src="${prd.prdImg}" alt=""
                         onerror="this.src='http://hpimg.gsretail.com/_ui/desktop/common/images/gscvs/products/prd_no_img.gif';">
                    <br>
                    <br>

                    <p>상품명</p>
                    <p style="font-size: 24px; font-weight: 400">${prd.prdName}</p>
                    <br>

                    <p>가격</p>
                    <p style="font-size: 24px; font-weight: 400">${prd.prdPrice}원</p>
                    <br>

                    <p>행사 종류</p>
                    <p style="font-size: 24px; font-weight: 400">${prd.prdEventType}</p>
                    <br>

                    <c:if test="${prd.prdEventType ne '덤증정'}">
                        <p>행사 가격(개당)</p>
                        <p style="font-size: 24px; font-weight: 400">${prd.prdEventPrice}원</p>
                    </c:if>
                    <c:if test="${prd.prdEventType eq '덤증정'}">
                        <p>증정 상품</p>
                        <p style="font-size: 24px; font-weight: 400">${prd.prdGiftName}</p>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="category-area" id="comments">
            <h2>댓글(${prd.commentCount} 개)</h2>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <c:if test="${prd.commentCount eq 0}">
                    <p>댓글이 없습니다.</p>
                    <hr>
                </c:if>
                <c:forEach var="c" items="${commentList}">
                    <div class="comment" data-uuid="${c.commentUuid}">
                        <p>${c.userId} | ${c.commentRegdate}
                            <c:if test="${c.userId eq USER.userId}">
                                |
                                <a class="btn-comment-edit">수정</a>
                                |
                                <a class="btn-comment-delete">삭제</a>
                            </c:if></p>
                        <p class="comment-content">${c.commentContent}</p>
                    </div>
                    <hr>
                </c:forEach>
                <c:if test="${USER eq null}">
                    <p>댓글을 달려면 <a href="/login" style="font-weight: 500; text-decoration: underline">로그인</a>이 필요합니다.</p>
                </c:if>
                <c:if test="${USER ne null}">
                    <form id="comment_form" method="post">
                        <input type="text" name="content" placeholder="댓글을 입력하세요">
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
