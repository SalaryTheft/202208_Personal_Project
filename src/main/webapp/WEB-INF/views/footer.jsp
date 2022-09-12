<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="footer">
    <div class="footer-area">
        <!-- copyright -->
        <p>Copyright &copy;모두의편의. All rights reserved.</p>
    </div>
    <div class="footer-button-area">
        <ion-icon name="arrow-up-circle-outline" id="go-top-btn"></ion-icon>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#go-top-btn").click(function () {
            window.scrollTo(0, 0);
        });
    });
</script>