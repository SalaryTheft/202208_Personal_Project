$(function () {
    $("#btn_submit").on("click", function (e) {
        e.preventDefault();

        if ($("#editor_title").val().length < 3) {
            alert("제목을 3글자 이상 입력해주세요.");
            return false;
        }

        if ($("#editor_content").val().length < 3) {
            alert("내용을 3글자 이상 입력해주세요.");
            return false;
        }

        $("#board_form").trigger("submit");
    });
});