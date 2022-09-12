$(function () {
    // 아이디 중복 확인
    $("#check_id_btn").on("click", function (e) {
        e.preventDefault();
        $("#register_form input").each(function () {
            $(this).val($(this).val().trim());
        });

        let userId = $("input[name='userId']").val();
        if (userId == "") {
            alert("아이디를 입력해주세요.");
            return false;
        } else if (userId.length < 4 || userId.length > 12) {
            alert("아이디는 4자 이상 12자 이하로 입력해주세요.");
            return false;
        }

        $.ajax({
            url: "/register/check_id",
            type: "POST",
            data: {
                "userId" : userId
            },
            dataType: "json",
            success: function (data) {
                if (data["result"] == "success") {
                    alert("사용 가능한 아이디입니다.");
                } else {
                    alert(data["msg"]);
                }
            }
        });
    });

    // 회원가입
    $("#register_form").on("submit", function (e) {
        e.preventDefault();
        $("#register_form input").each(function () {
            $(this).val($(this).val().trim());
        });
        let userId = $("input[name='userId']").val();
        let userPw = $("input[name='userPw']").val();
        let userPwConfirm = $("input[name='userPwConfirm']").val();

        if (userId == "" || userPw == "" || userPwConfirm == "") {
            alert("모든 항목을 입력해주세요.");
            return false;
        } else if (userPw != userPwConfirm) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        } else if (userId.length < 4 || userId.length > 12) {
            alert("아이디는 4자 이상 12자 이하로 입력해주세요.");
            return false;
        } else if (userPw.length < 4 || userPw.length > 12) {
            alert("비밀번호는 4자 이상 12자 이하로 입력해주세요.");
            return false;
        }

        $.ajax({
            url: "register",
            type: "POST",
            data: $("#register_form").serialize(),
            dateType: "json",
            success: function (data) {
                if (data["result"] == "success") {
                    alert("환영합니다! 로그인 후 이용해주세요.");
                    location.href = "/login";
                } else {
                    alert(data["msg"]);
                }
            }
        });
    });
});