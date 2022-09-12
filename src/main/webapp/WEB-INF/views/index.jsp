<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="/src/css/common.css">
    <link rel="stylesheet" href="/src/css/home.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://unpkg.com/type-hangul"></script>
</head>
<body>
<div class="container">
    <%@include file="header.jsp" %>
    <div class="body">
        <div class="title-area">
            <div class="title">
                <h2>뭐 먹을지 고민된다면</h2>
                <h2 style="transition: all 0.5s ease-in-out"><span id="random-food"></span> 어떤가요?</h2>
                <script>
                    function sleep(ms) {
                        return new Promise(resolve => setTimeout(resolve, ms));
                    }

                    let food_list = [
                        "라면",
                        "삼각김밥",
                        "콜라",
                        "김밥",
                        "햄버거",
                        "컵밥",
                        "피자",
                        "치킨",
                        "비빔면"
                    ];

                    function setRandomFood() {
                        let random_food = food_list[Math.floor(Math.random() * food_list.length)];
                        TypeHangul.type("#random-food", {
                            text: random_food
                        });
                    }

                    function removeText(target) {
                        if (target.innerHTML.length > 0) {
                            target.innerHTML = target.innerHTML.substring(0, target.innerHTML.length - 1);
                            sleep(100).then(() => {
                                removeText(target);
                            });
                        }
                    }

                    setRandomFood();
                    setTimeout(function () {
                        removeText(document.querySelector("#random-food"));
                    }, 3500);

                    setInterval(function () {
                        setRandomFood();
                        setTimeout(function () {
                            removeText(document.getElementById("random-food"));
                        }, 3500);
                    }, 4000);
                </script>
            </div>
        </div>
        <div class="main-card-area">
            <div class="card main-card">
                <h3 onclick="location.href='/product/list'" style="cursor: pointer">
                    <ion-icon name="fast-food-outline"></ion-icon>
                    인기 행사 상품
                </h3>
                <div id="word_cloud" style="color: unset; font-size: unset; width: 100%; height: 500px;">

                </div>
                <script src="http://cdnjs.cloudflare.com/ajax/libs/jqcloud/1.0.4/jqcloud.min.js"></script>
                <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jqcloud/1.0.4/jqcloud.min.css"/>
                <script>
                    let word_cloud = [
                        {text: "라면", weight: 13},
                        {text: "삼각김밥", weight: 12},
                        {text: "콜라", weight: 7},
                        {text: "김밥", weight: 2},
                        {text: "아이스크림", weight: 7},
                        {text: "핫바", weight: 7},
                        {text: "소시지", weight: 6},
                        {text: "맛밤", weight: 2},
                        {text: "곰탕", weight: 4},
                        {text: "볶음면", weight: 8},
                        {text: "스팸", weight: 4},
                        {text: "마스크", weight: 5},
                        {text: "숙취해소", weight: 4},
                        {text: "에너지드링크", weight: 8},
                        {text: "감자칩", weight: 2},
                        {text: "커피", weight: 3},
                        {text: "햄버거", weight: 5},
                        {text: "컵밥", weight: 7},
                        {text: "피자", weight: 5},
                        {text: "치킨", weight: 6},
                        {text: "비빔면", weight: 3}
                    ];
                    $(function () {
                        $("#word_cloud").jQCloud(word_cloud, {
                            shape: 'rectangular'
                        });
                        setTimeout(function () {
                            $("#word_cloud > span").on("click", function () {
                                location.href = "/product/list?keyword=" + $(this).text();
                            });
                        }, 100);

                    });
                </script>
                <style>
                    #word_cloud > span {
                        cursor: pointer;
                    }
                </style>
            </div>
            <div class="side-card-container">
                <div class="card side-card">
                    <h3>
                        <ion-icon name="chatbubble-ellipses-outline"></ion-icon>
                        최근 댓글
                    </h3>
                    <c:forEach items="${recentComments}" var="comment">
                        <div class="comment" onclick="location.href='/product/${comment.encodedPrdName}'">
                            <span class="comment-content">${comment.commentContent}</span><br>
                            <span class="comment-writer">${comment.userId} | </span>
                            <span class="comment-product">${comment.prdName}</span>
                        </div>
                    </c:forEach>
                </div>
                <div class="card side-card">
                    <h3 onclick="location.href='/board/list'" style="cursor: pointer">
                        <ion-icon name="reader-outline"></ion-icon>
                        최근 게시글
                    </h3>
                    <c:forEach items="${recentPosts}" var="post">
                        <div class="post" onclick="location.href='/board/${post.postNo}'">
                            <span class="post-category">[${post.postCategoryName}] </span>
                            <span class="post-title">${post.postTitle}</span>
                            <span class="post-comment-count"> (댓글 ${post.commentCount})</span><br>
                            <span class="post-writer">${post.userId} | </span>
                            <span class="post-regdate">${post.postRegdate}</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <div class="text-area">
                    <h1>찾아오시는 길</h1>
                    <a class="shortcut-button" href="/map">자세히 알아보기
                        <ion-icon name="arrow-forward-outline"></ion-icon>
                    </a>
                </div>
            </div>
        </div>
        <div class="more">
            <div class="more-card-area">
                <div class="more-card">
                    <h2>
                        어쩌구
                    </h2>
                    <a class="shortcut-button"
                       href="#">바로가기
                        <ion-icon name="arrow-forward-outline"></ion-icon>
                    </a>
                </div>
            </div>
            <div class="more-card-area">
                <div class="more-card">
                    <h2>저쩌구</h2>
                    <a class="shortcut-button"
                       href="#">바로가기
                        <ion-icon name="arrow-forward-outline"></ion-icon>
                    </a>
                </div>
            </div>
        </div> <!-- END OF BODY -->
    </div>
    <hr>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>