<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>회원가입 - 모두의편의</title>

    <!-- CSS -->
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/register.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="src/js/register.js"></script>
</head>

<body>
<div class="container">
    <%@include file="../header.jsp" %>
    <div class="body">
        <div class="title-area">
            <div class="title">
                <h2>
                    <ion-icon name="person-add-outline"></ion-icon> 회원가입
                </h2>
                <h3>회원 약관 및 개인정보 처리 방침에 동의해주세요</h3>
            </div>
        </div>
        <div class="tabs-area">
            <ul class="tabs">
                <li class="tab">
                    <a href="#tab_terms">회원 약관</a>
                </li>
                <li class="tab">
                    <a href="#tab_privacy">개인정보 처리방침</a>
                </li>
                <li class="tab">
                    <a href="#tab_form">회원정보</a>
                </li>
            </ul>
        </div>
        <div class="category-area" id="tab_terms">
            <h1>회원 약관</h1>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                    <pre>제 1 장 총칙
제 1 조 (목적)

본 약관은 모두의편의(이하 “사이트”라 합니다)이 운영하는 웹사이트에서 제공하는 온라인 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
제 2 조 (용어의 정의)

본 약관에서 사용하는 용어는 다음과 같이 정의한다.

“웹사이트”란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래 할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
“이용자”란 “웹사이트”에 접속하여 서비스를 이용하는 회원 및 비회원을 말합니다.
“회원”이라 함은 “웹사이트”에 개인정보를 제공하여 회원등록을 한 자로서, “웹사이트”의 정보를 지속적으로 제공받으며, “웹사이트”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
“비회원”이라 함은 회원에 가입하지 않고, “웹사이트”이 제공하는 서비스를 이용하는 자를 말합니다.
“ID”라 함은 이용자가 회원가입당시 등록한 사용자 “개인이용문자”를 말합니다.
“멤버십”이라 함은 회원등록을 한 자로서, 별도의 온/오프라인 상에서 추가 서비스를 제공 받을 수 있는 회원을 말합니다.

제 3 조 (약관의 공시 및 효력과 변경)

본 약관은 회원가입 화면에 게시하여 공시하며 회사는 사정변경 및 영업상 중요한 사유가 있을 경우 약관을 변경할 수 있으며 변경된 약관은 공지사항을 통해 공시한다
본 약관 및 차후 회사사정에 따라 변경된 약관은 이용자에게 공시함으로써 효력을 발생한다.

제 4 조 (약관 외 준칙)

본 약관에 명시되지 않은 사항이 전기통신기본법, 전기통신사업법, 정보통신촉진법, ‘전자상거래등에서의 소비자 보호에 관한 법률’, ‘약관의 규제에관한법률’, ‘전자거래기본법’, ‘전자서명법’, ‘정보통신망 이용촉진등에 관한 법률’, ‘소비자보호법’ 등 기타 관계 법령에 규정되어 있을 경우에는 그 규정을 따르도록 한다.
제 2 장 이용계약
제 5 조 (이용신청)

이용신청자가 회원가입 안내에서 본 약관과 개인정보보호정책에 동의하고 등록절차(회사의 소정 양식의 가입 신청서 작성)를 거쳐 ‘확인’ 버튼을 누르면 이용신청을 할 수 있다.
이용신청자는 반드시 실명과 실제 정보를 사용해야 하며 1개의 생년월일에 대하여 1건의 이용신청을 할 수 있다.
실명이나 실제 정보를 입력하지 않은 이용자는 법적인 보호를 받을 수 없으며, 서비스 이용에 제한을 받을 수 있다.

제 6 조 (이용신청의 승낙)

회사는 제5조에 따른 이용신청자에 대하여 제2항 및 제3항의 경우를 예외로 하여 서비스 이용을 승낙한다.
회사는 아래 사항에 해당하는 경우에 그 제한사유가 해소될 때까지 승낙을 유보할 수 있다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 회사 사정상 필요하다고 인정되는 경우
회사는 아래 사항에 해당하는 경우에 승낙을 하지 않을 수 있다.
가. 다른 사람의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 회사가 정한 이용신청 요건이 미비한 경우.</pre>
            </div>
        </div>
        <div class="tools-category-area" id="tab_privacy">
            <h1>개인정보 처리방침</h1>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                    <pre>본 사이트('cvsone.com'이하 '사이트')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

○ 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.

제1조(개인정보의 처리 목적)

본 사이트는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

    1. 홈페이지 회원가입 및 관리

    회원 가입의사 확인, 회원자격 유지·관리, 서비스 부정이용 방지 목적으로 개인정보를 처리합니다.



제2조(개인정보의 처리 및 보유 기간)

① 본 사이트는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.

② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.

    1.홈페이지 회원가입 및 관리
    홈페이지 회원가입 및 관리와 관련한 개인정보는 수집.이용에 관한 동의일로부터 지체없이 파기까지 위 이용목적을 위하여 보유.이용됩니다.
    보유근거 : 무슨무슨법
    관련법령 :
    예외사유 :



제3조(처리하는 개인정보의 항목)

① 본 사이트은(는) 다음의 개인정보 항목을 처리하고 있습니다.

    1 홈페이지 회원가입 및 관리
    필수항목 : 로그인 아이디, 비밀번호
    선택항목 :



제4조(개인정보의 파기절차 및 파기방법)


</pre>
            </div>
        </div>
        <div class="tools-category-area" id="tab_form">
            <h1>회원정보</h1>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <form method="post" id="register_form">
                    <label>아이디<br>
                        <input type="text" name="userId" placeholder="4글자 이상 입력" required>
                    </label><button id="check_id_btn">중복확인</button><br>
                    <label>비밀번호<br>
                        <input type="password" name="userPw" placeholder="4글자 이상 입력" required>
                    </label><br>
                    <label>비밀번호 확인<br>
                        <input type="password" name="userPwConfirm" placeholder="입력하신 비밀번호 확인" required><br>
                    </label>
                    <!--
                    <label>보안 질문<br>
                        <select name="memSq" id="memSq" required>
                            <option value="">-- 선택하세요 --</option>
                            <option value="q1">가장 좋아하는 음식은?</option>
                            <option value="q2">가장 좋아하는 색상은?</option>
                            <option value="q3">내가 가장 아끼는 보물 1호는?</option>
                        </select>
                    </label><br>
                    <label>보안 질문 정답<br>
                        <input type="text" name="memSa" placeholder="비밀번호 초기화에 사용됨" required>
                    </label><br>
                    -->
                    <label>
                        <input type="checkbox" id="agree-chkbox" required> 본인은 회원 약관 및 개인정보 처리 방침에 동의합니다.
                    </label><br>
                    <input type="submit" value="회원가입">
                </form>
            </div>
        </div>
    </div>
    <hr>
    <%@include file="../footer.jsp" %>
</div>
</body>

</html>