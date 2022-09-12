<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>게시판 - 모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="../src/css/common.css">
    <link rel="stylesheet" href="../src/css/board.css">

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
                    게시판
                </h2>
                <h3>자유롭게 의견을 나누는 공간</h3>
            </div>
        </div>
        <div class="tabs-area">
            <ul class="tabs">
                <li class="tab ${searchVO.category eq null ? 'selected' : ''}"><a href="./list?page=1">전체</a></li>
                <li class="tab ${searchVO.category eq 'notice' ? 'selected' : ''}"><a
                        href="./list?page=1&category=notice">공지사항</a>
                </li>
                <li class="tab ${searchVO.category eq 'general' ? 'selected' : ''}"><a
                        href="./list?page=1&category=general">일반</a>
                </li>
                <li class="tab ${searchVO.category eq 'qna' ? 'selected' : ''}"><a
                        href="./list?page=1&category=qna">질문</a>
                </li>
                <li class="tab pink"><a href="/board/write">글 작성</a></li>
            </ul>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <table id="board-table">
                    <colgroup>
                        <col class="mobile-hide">
                        <col>
                        <col class="col-title">
                        <col class="mobile-hide">
                        <col>
                        <col>
                        <col class="mobile-hide">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="mobile-hide">번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th class="mobile-hide">댓글</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th class="mobile-hide">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${noticeList }" var="notice">
                        <tr class="notice">
                            <td class="mobile-hide">${notice.postNo}</td>
                            <td>${notice.postCategoryName }</td>
                            <td class="post-title"><a href="/board/${notice.postNo}">${notice.postTitle }</a>${notice.isRecent eq true ? " <span class='new'>&nbsp;N&nbsp;</span>" : ""}</td>
                            <td class="mobile-hide">${notice.commentCount }</td>
                            <td>${notice.userId }</td>
                            <td>${notice.postRegdateShort }</td>
                            <td class="mobile-hide">${notice.postHit}</td>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${postList }" var="post">
                        <tr>
                            <td class="mobile-hide">${post.postNo}</td>
                            <td>${post.postCategoryName }</td>
                            <td class="post-title"><a href="/board/${post.postNo}">${post.postTitle }</a>${post.isRecent eq true ? " <span class='new'>&nbsp;N&nbsp;</span>" : ""}</td>
                            <td class="mobile-hide">${post.commentCount }</td>
                            <td>${post.userId }</td>
                            <td>${post.postRegdateShort }</td>
                            <td class="mobile-hide">${post.postHit}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <!-- 페이징 시작 -->
                <div class="board-paging">
                    <!-- 이전 페이지 버튼  -->
                    <c:if test="${searchVO.page ne 1 }">
                        <a class="prev"
                           href="list?page=${searchVO.page - 1 }${searchVO.category ne null ? '&category='+=searchVO.category : '' }">
                            &lt;
                        </a>
                    </c:if>
                    <c:if test="${searchVO.page eq 1 }">
                        <a class="prev" style="opacity: 0.5">
                            &lt;
                        </a>
                    </c:if>

                    <c:if test="${searchVO.pageSize eq 4 }">
                        <c:if test="${searchVO.firstPage ne 1 }">
                            <a href="list?page=1${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                               class="page">1</a>
                            <a class="page">...</a>
                        </c:if>
                        <c:forEach begin="${searchVO.firstPage }" end="${searchVO.lastPage }" var="c">
                            <a href="list?page=${c }${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                               class="page" style="${c eq searchVO.page ? 'font-weight: 500' : ''}">${c }</a>
                        </c:forEach>
                        <c:if test="${searchVO.lastPage ne searchVO.totalPages }">
                            <a class="page">...</a>
                            <a href="list?page=${searchVO.totalPages }${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                               class="page">${searchVO.totalPages }</a>
                        </c:if>
                    </c:if>
                    <c:if test="${searchVO.pageSize eq 1 }">
                        <a href="list?page=1${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                           class="page">1</a>
                        <a class="page">...</a>
                        <c:forEach begin="${searchVO.firstPage - 1 }" end="${searchVO.lastPage + 1 }" var="c">
                            <a href="list?page=${c }${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                               class="page" style="${c eq searchVO.page ? 'font-weight: 500' : ''}">${c }</a>
                        </c:forEach>
                        <a class="page">...</a>
                        <a href="list?page=${searchVO.totalPages }${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                           class="page">${searchVO.totalPages }</a>
                    </c:if>

                    <!-- 다음 페이지 버튼 -->
                    <c:if test="${searchVO.page ne searchVO.totalPages}">
                        <a class="next"
                           href="list?page=${searchVO.page + 1 }${searchVO.category ne null ? '&category='+=searchVO.category : '' }">
                            &gt;
                        </a>
                    </c:if>
                    <c:if test="${searchVO.page eq searchVO.totalPages }">
                        <a class="next" style="opacity: 0.5">
                            &gt;
                        </a>
                    </c:if>
                </div>
                <!-- 페이징 끝 -->
                <form id="search_form" name="search" action="list" method="get">
                    <input type="hidden" name="page" value="${searchVO.page }">
                    <select name="category">
                        <option value="">전체</option>
                        <option value="general" ${searchVO.category eq 'general' ? "selected='selected'" : ""}>일반
                        </option>
                        <option value="qna" ${searchVO.category eq 'qna' ? "selected='selected'" : ""}>질문</option>
                        <option value="notice" ${searchVO.category eq 'notice' ? "selected='selected'" : ""}>공지</option>
                    </select>
                    <select name="type">
                        <option value="title" ${searchVO.type eq 'title' ? "selected='selected'" : ""}>제목</option>
                        <option value="content" ${searchVO.type eq 'content' ? "selected='selected'" : ""}>내용</option>
                        <option value="writer" ${searchVO.type eq 'writer' ? "selected='selected'" : ""}>작성자</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색어" value="${searchVO.keyword}">
                    <button type="submit" id="btn_search_submit" class="pink">검색</button>
                    <button type="button" id="btn_search_rst">초기화</button>
                </form>

                <script>
                    $(function () {
                        let $searchForm = document.querySelector('form[name="search"]');
                        let $currentPage = document.querySelector('input[name="page"]');

                        $(".page").click(function (e) {
                            e.preventDefault();
                            $currentPage.value = $(this).text();
                            $searchForm.submit();
                        });

                        $("#btn_search_submit").click(function (e) {
                            e.preventDefault();
                            $currentPage.value = 1;
                            $searchForm.submit();
                        });

                        $("#btn_search_rst").click(function (e) {
                            e.preventDefault();
                            $currentPage.value = 1;
                            $searchForm.querySelector("input[name='keyword']").value = "";
                            $("select[name='category'] > option:first-child").prop("selected", true);
                            $("select[name='type'] > option:first-child").prop("selected", true);
                            $searchForm.submit();
                        });
                    });
                </script>
            </div>
        </div>
    </div>
    <hr>
    <%@include file="../footer.jsp" %>
</div>
</body>

</html>