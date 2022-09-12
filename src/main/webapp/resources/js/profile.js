$(function () {
    $("#updatePw_form").on("submit", function (e) {
        e.preventDefault();
        $("input").each(function () {
            $(this).val($(this).val().trim());
        });

        let userPw = $("#updatePw_form input[name='userPw']").val();
        let userPwConfirm = $("#updatePw_form input[name='userPwConfirm']").val();
        let userPwOld = $("#updatePw_form input[name='userPwOld']").val();

        if (userPwOld.length < 4) {
            alert("현재 비밀번호를 4글자 이상 입력해주세요.");
            return false;
        }

        if (userPw.length < 4) {
            alert("변경할 비밀번호를 4글자 이상 입력해주세요.");
            return false;
        }

        if (userPw != userPwConfirm) {
            alert("변경할 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }

        $.ajax({
            url: "/profile/update",
            type: "POST",
            data: {
                "userPwOld": userPwOld,
                "userPw": userPw,
            },
            dataType: "json",
            success: function (data) {
                if (data["result"] == "success") {
                    alert("비밀번호가 변경되었습니다.");
                    location.href = "/profile";
                } else {
                    alert(data["msg"]);
                }
            }
        });
    });

    $("#del_form").on("submit", function (e) {
        e.preventDefault();
        $("input").each(function () {
            $(this).val($(this).val().trim());
        });

        let userPw = $("#del_form input[name='userPw']").val();

        if (userPw.length < 4) {
            alert("현재 비밀번호를 4글자 이상 입력해주세요.");
            return false;
        }

        if (confirm("정말로 탈퇴하시겠습니다? 탈퇴는 취소가 불가능합니다.")) {
            if (!$('#agree-chkbox').is(":checked")) {
                alert("탈퇴 유의 사항을 읽고 동의해주세요.");
                return false;
            }

            $.ajax({
                url: "/profile/delete",
                type: "POST",
                data: {
                    "userPw": userPw
                },
                dataType: "json",
                success: function (data) {
                    if (data["result"] == "success") {
                        alert("탈퇴되었습니다.");
                        location.href = "/";
                    } else {
                        alert(data["msg"]);
                    }
                }

            })
        }
    });

});