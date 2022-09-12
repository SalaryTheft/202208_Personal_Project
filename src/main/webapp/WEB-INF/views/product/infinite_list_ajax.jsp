<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
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