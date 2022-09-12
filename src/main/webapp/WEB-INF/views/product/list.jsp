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
        <div class="tabs-area">
            <ul class="tabs">
                <li class="tab ${searchVO.category eq null ? 'selected' : ''}${searchVO.category eq '' ? 'selected' : ''}">
                    <a href="./list?page=1">전체</a></li>
                <li class="tab ${searchVO.category eq '1+1' ? 'selected' : ''}"><a
                        href="./list?page=1&category=1%2B1">1+1</a>
                </li>
                <li class="tab ${searchVO.category eq '2+1' ? 'selected' : ''}"><a
                        href="./list?page=1&category=2%2B1">2+1</a>
                </li>
                <li class="tab ${searchVO.category eq '덤증정' ? 'selected' : ''}"><a
                        href="./list?page=1&category=덤증정">덤증정</a>
                </li>
            </ul>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <div class="product-list">
                    <c:forEach var="item" items="${productList}">
                        <div class="product" onclick="location.href='../product/${item.encodedPrdName}'">
                            <div class="img">
                                <img src="${item.prdImg}"
                                     onerror="this.src='http://hpimg.gsretail.com/_ui/desktop/common/images/gscvs/products/prd_no_img.gif';">
                            </div>
                            <div class="info">
                                <div>
                                    <span class="name">${item.prdName}</span><br>
                                    <span class="price">${item.prdPrice} 원
                                    <span class="event-price">${item.prdEventPrice eq -1 ? ('('+=item.prdGiftName+=' 증정)') : ('('+=item.prdEventPrice+=' 원)')}</span>
                                    </span>
                                    <br>
                                    <span class="event-type ${item.prdEventType eq '1+1' ? 'red' : item.prdEventType eq '2+1' ? 'blue' : 'green'}">${item.prdEventType}</span>
                                    <span class="comments">댓글(${item.commentCount})</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- 5 empty products div -->
                    <c:forEach var="i" begin="1" end="${searchVO.rowsPerPage - fn:length(productList)}">
                        <div class="product mobile-hide"></div>
                    </c:forEach>
                </div>

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
                <form id="search_form" name="search" action="list" method="g">
                    <input type="hidden" name="page" value="${searchVO.page }">
                    <select name="category">
                        <option value="">전체</option>
                        <option value="1+1" ${searchVO.category eq '1+1' ? "selected='selected'" : ""}>1+1</option>
                        <option value="2+1" ${searchVO.category eq '2+1' ? "selected='selected'" : ""}>2+1</option>
                        <option value="덤증정" ${searchVO.category eq '덤증정' ? "selected='selected'" : ""}>덤증정</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색어" value="${searchVO.keyword}">
                    <button type="submit" id="btn_search_submit" class="blue">검색</button>
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