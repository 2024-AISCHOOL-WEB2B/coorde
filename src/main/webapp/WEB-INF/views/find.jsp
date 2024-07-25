<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Coordy</title>
<!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="author" content="Phoenixcoded" />

	<link
      rel="stylesheet"
      href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css"
    />

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/assets/css/find.css">
</head>
<body>
 <div class="container">
        <div class="logo">
            <img src="resources/assets/images/browser/LOGO.jpg" alt="logo">
            <div class="FIND">FIND</div>
        </div>

        <div class="top-nav">
            <a href="/login.html">LOGIN</a>
            <a href="/join.html">JOIN</a>
        </div>

        <div class="forms-container">
            <div class="form-box">
                <form id="id-find-form" onsubmit="findId(event)">
                    <label for="name">NAME<input type="text" id="user_name" name="user_name"></label>
                    <label for="birth">BIRTH<input type="text" id="user_birth" name="user_birth"></label>
                    <label for="phone">PHONE<input type="text" id="user_phone" name="user_phone"><button type="button" onclick="openModal()"><span class="lnr lnr-magnifier"></span></button></label>
                    <button type="submit" class="submit-btn">ID FIND</button>
                </form>
            </div>
            <div class="form-box">
                <form id="pw-find-form" onsubmit="findPw(event)">
                    <label for="id">ID<input type="text" id="user_id" name="user_id"></label>
                    <label for="name-pw">NAME<input type="text" id="name-pw" name="user_name"></label>
                    <label for="birth-pw">BIRTH<input type="text" id="birth-pw" name="user_birth"></label>
                    <label for="phone-pw">PHONE<input type="text" id="phone-pw" name="user_phone"><button type="button" onclick="openModal()"><span class="lnr lnr-magnifier"></span></button></label>
                    <button type="submit" class="submit-btn">PW FIND</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Structure -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div class="pass-auth-container">
                <div class="pass-header">
                    <img src="resources/assets/images/browser/pass.jpg" alt="PASS 로고" class="pass-logo">
                    <p>이용 중이신 통신사를 선택해 주세요.</p>
                </div>
                <div class="pass-operators">
                    <div class="operator"><img src="resources/assets/images/browser/sktelecom.jpg" alt="SK telecom"></div>
                    <div class="operator"><img src="resources/assets/images/browser/kt.png" alt="KT"></div>
                    <div class="operator"><img src="resources/assets/images/browser/lg.png" alt="LG U+"></div>
                    <div class="operator"><img src="resources/assets/images/browser/알뜰폰 1.png" alt="알뜰폰"></div>
                </div>
                <div class="pass-consents">
                    <label><input type="checkbox" id="all-consent"> 전체 동의</label>
                    <label><input type="checkbox"> 개인정보이용 동의</label>
                    <label><input type="checkbox"> 서비스이용약관 동의</label>
                    <label><input type="checkbox"> 고유식별정보처리 동의</label>
                    <label><input type="checkbox"> 통신사이용약관 동의</label>
                </div>
                <div class="pass-buttons">
                    <button class="pass-btn">PASS로 인증하기</button>
                    <button class="pass-btn">문자(SMS)로 인증하기</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        const users = [
            { id: 'user1', name: '양준영', birth: '1996-12-05', phone: '010-5090-3484', password: 'password1' },
            { id: 'user2', name: '김철수', birth: '1985-05-05', phone: '010-9876-5432', password: 'password2' },
        ];

        function formatBirthDate(birth) {
            if (birth.length === 8) {
                return birth.slice(0, 4) + '-' + birth.slice(4, 6) + '-' + birth.slice(6);
            }
            return birth;
        }

        function formatPhoneNumber(phone) {
            if (phone.length === 11) {
                return phone.slice(0, 3) + '-' + phone.slice(3, 7) + '-' + phone.slice(7);
            }
            return phone;
        }

        function findId(event) {
            event.preventDefault();
            const name = document.getElementById('user_name').value;
            const birth = formatBirthDate(document.getElementById('user_birth').value);
            const phone = formatPhoneNumber(document.getElementById('user_phone').value);

            const user = users.find(user => user.name === name && user.birth === birth && user.phone === phone);

            if (user) {
                alert('아이디: ' + user.id);
            } else {
                alert('일치하는 아이디가 없습니다.');
            }
        }

        function findPw(event) {
            event.preventDefault();
            const id = document.getElementById('user_id').value;
            const name = document.getElementById('name-pw').value;
            const birth = formatBirthDate(document.getElementById('birth-pw').value);
            const phone = formatPhoneNumber(document.getElementById('phone-pw').value);

            const user = users.find(user => user.id === id && user.name === name && user.birth === birth && user.phone === phone);

            if (user) {
                alert('비밀번호: ' + user.password);
            } else {
                alert('일치하는 비밀번호가 없습니다.');
            }
        }

        // Modal Functions
        function openModal() {
            document.getElementById('modal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('modal').style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target === document.getElementById('modal')) {
                closeModal();
            }
        }
    </script>

</body>
</html>