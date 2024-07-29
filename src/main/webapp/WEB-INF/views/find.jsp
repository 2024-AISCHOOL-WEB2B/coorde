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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <div class="container">
        <div class="logo">
            <a href="/myapp"><img src="resources/assets/images/browser/LOGO.jpg" alt="logo"></a>
            <div class="FIND">FIND</div>
        </div>

        <div class="top-nav">
            <a href="gologin">LOGIN</a>
            <a href="goJoin">JOIN</a>
        </div>

        <div class="forms-container">
            <div class="form-box">
                <form id="id-find-form" action="idFind" method="post">
                    <label for="name">NAME<input type="text" id="user_name" name="user_name"></label>
                    <label for="birth">BIRTH<input type="text" id="user_birth" name="user_birth"></label>
                    <label for="phone">PHONE<input type="text" id="user_phone" name="user_phone"><button type="button" onclick="openModal()"><span class="lnr lnr-magnifier"></span></button></label>
                    <button type="button" class="submit-btn" onclick="submitForm()">ID FIND</button>
                </form>
            </div>
            <div class="form-box">
                <form id="pw-find-form" action="pwFind" method="post">
                    <label for="id">ID<input type="text" id="user_id" name="user_id"></label>
                    <label for="name-pw">NAME<input type="text" id="name-pw" name="user_name"></label>
                    <label for="birth-pw">BIRTH<input type="text" id="birth-pw" name="user_birth"></label>
                    <label for="phone-pw">PHONE<input type="text" id="phone-pw" name="user_phone"><button type="button" onclick="openModal()"><span class="lnr lnr-magnifier"></span></button></label>
                    <button type="button" class="submit-btn" onclick="submitPwForm()">PW FIND</button>
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
		 function submitForm() {
			$.ajax({
			     url: 'idFind',
			     type: 'POST',
			     data: $('#id-find-form').serialize(),
			     success: function(response) {
			         if (response.findId) {
			             alert("찾은 ID: " + response.findId);
			         } else {
			             alert("ID를 찾을 수 없습니다.");
			         }
			     },
			     error: function() {
			         alert("에러가 발생했습니다. 다시 시도해 주세요.");
			     }
			});
		}
		function submitPwForm() {
			$.ajax({
			    url: 'pwFind',
			    type: 'POST',
			    data: $('#pw-find-form').serialize(),
			    success: function(response) {
			        if (response.findPw) {
			            alert("찾은 비밀번호: " + response.findPw);
			        } else {
			            alert("비밀번호를 찾을 수 없습니다.");
			        }
			    },
			    error: function() {
			        alert("에러가 발생했습니다. 다시 시도해 주세요.");
			    }
			});
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