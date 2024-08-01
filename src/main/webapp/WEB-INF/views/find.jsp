<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>OOTB ID/PW찾기</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="author" content="Phoenixcoded" />

<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

<!-- vendor css -->
<link rel="stylesheet" href="resources/assets/css/find.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
input {
	border: none;
	outline: none;
}

@import
	url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap')
	;


input {
	border: none;
	outline: none;
}

    * {
    margin: 0;
    padding: 0;
}

a {
    text-decoration: none;
    color: inherit;
}

.logo {
    border-bottom: 1px solid #ddd;
    margin-bottom: 20px;
}

.FIND {
    font-size: 20px;
    margin-bottom: 20px;
    margin-top: 20px;
}

body {
    font-family: Arial, sans-serif;
    text-align: center;
    margin: 0;
    padding: 0;
}

.container {
    width: 1280px;
    margin: 50px auto;
    overflow: hidden;
}

.top-nav {
    display: flex;
    font-size: 20px;
    margin-right: 20px;
    flex-direction: column; /* 수직 정렬 */
    align-items: flex-end; /* 오른쪽 정렬 */
    gap: 15px;
}

/* 마지막 링크의 아래쪽 여백을 제거 */
.top-nav a:last-child {
    margin-bottom: 0;
}

.top-nav a {
    text-decoration: none;
    color: black;
}

.forms-container {
    display: flex;
    justify-content: space-around;
    margin-bottom: 30px;
}

.form-box {
    width: 45%;
    text-align: center;
}

.form-box:nth-child(1) {
    margin-top: 5%;
}

.form-box label {
    display: block;
    margin: 10px 0 5px;
}

.form-box input {
    width: 50%;
    padding: 10px;
    margin-bottom: 20px;
    border: none;
    border-bottom: 1px solid black;
}

.submit-btn {
    width: 100px;
    padding: 10px;
    background: none;
    color: black;
    border: none;
    cursor: pointer;
    font-size: 16px;
    border-radius: 15px;
    margin-left: 10%;
}

button {
    border: none;
    background-color: white;
}

.lnr.lnr-magnifier {
    font-size: 20px;
    background: none; /* 배경 제거 */
    border: none; /* 테두리 제거 */
    color: black; /* 색상 설정 */
    background-color: white;
    cursor: pointer;
}

#user_phone{
    margin:0px 0px 20px 10px;
}

#user_phone input {
    border-bottom: 1px solid black;
    margin-left: 20px; /* 선을 오른쪽으로 이동 */
}



.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 600px;
    text-align: center;
}

.pass-phone {
    background-color: whitesmoke;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 60px; /* 높이를 키움 */
    width: 100%; /* 너비를 전체로 설정 */
    margin: 20px 0; /* 위아래 마진 추가 */
}

.pass-phone label {
    width: 50%; /* 라벨 너비를 전체로 설정 */
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    text-align: center; /* 라벨 텍스트 가운데 정렬 */
}

.pass-phone input {
    width: 40%; /* 입력 필드 너비 조정 */
    padding: 10px;
    font-size: 16px;
    text-align: center; /* 입력 필드 텍스트 가운데 정렬 */
}

#modal-phone {
margin-left : 20px
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.pass-auth-container {
    text-align: center;
}

.pass-header {
    margin-bottom: 20px;
}

.pass-logo {
    width: 80px;
    margin-bottom: 10px;
}

.pass-operators {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
}

.operator img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    border: 1px solid #ddd;
}

.pass-consents {
    text-align: left;
    margin-bottom: 20px;
}

.pass-consents label {
    display: block;
    margin: 5px 0;
}

.pass-buttons {
    display: flex;
    justify-content: space-around;
}

.pass-btn {
    width: 45%;
    padding: 10px;
    border: 1px solid #ddd;
    background-color: #f8f8f8;
    cursor: pointer;
}

.pass-btn:hover {
    background-color: #ddd;
}

.operator img.selected {
    border: 2px solid blue;
}
}
</style>
</head>
<body>
	<div class="container">
		<div class="logo">
			<a href="/myapp"><img
				src="resources/assets/images/browser/LOGO.png" alt="logo"></a>
			<div class="FIND">FIND</div>
		</div>

		<div class="top-nav">
			<a href="gologin">LOGIN</a> <a href="goJoin">JOIN</a>
		</div>

		<div class="forms-container">
			<div class="form-box">
			    <form id="id-find-form" action="idFind" method="post">
			        <label for="name">NAME<input type="text" id="user_name" name="user_name" required placeholder="이름을 입력하세요"></label>
			        <label for="birth">BIRTH<input type="text" id="user_birth" name="user_birth" required placeholder="YYYYMMDD"></label>
			        <label for="phone">PHONE
			            <input type="text" id="user_phone" name="user_phone" required placeholder="01012345678">
			            <button type="button" id="id-phone-auth-button" onclick="openModal()">
			                <span class="lnr lnr-magnifier"></span>
			            </button>
			        </label>
			        <button type="submit" class="submit-btn">ID FIND</button>
			    </form>
			</div>
			<div class="form-box">
			    <form id="pw-find-form" action="pwFind" method="post">
			        <label for="id">ID<input type="text" id="user_id" name="user_id" required></label>
			        <label for="name-pw">NAME<input type="text" id="name-pw" name="user_name" required></label>
			        <label for="birth-pw">BIRTH<input type="text" id="birth-pw" name="user_birth" placeholder="YYYYMMDD" required></label>
			        <label for="phone-pw">PHONE
			            <input type="text" id="phone-pw" name="user_phone" placeholder="01012345678" required>
			            <button type="button" id="pw-phone-auth-button" onclick="openModal()">
			                <span class="lnr lnr-magnifier"></span>
			            </button>
			        </label>
			        <button type="submit" class="submit-btn">PW FIND</button>
			    </form>
			</div>
		</div>
	</div>

	<!-- 모달창을 통한 pass api 인증화면 및 기능 구현-->
	<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<div class="pass-auth-container">
				<div class="pass-header">
					<img src="resources/assets/images/browser/pass.jpg" alt="PASS 로고"
						class="pass-logo">
					<p>이용 중이신 통신사를 선택해 주세요.</p>
				</div>
				<div class="pass-operators">
					<div class="operator">
						<img src="resources/assets/images/browser/sktelecom.jpg"
							alt="SK telecom">
					</div>
					<div class="operator">
						<img src="resources/assets/images/browser/kt.png" alt="KT">
					</div>
					<div class="operator">
						<img src="resources/assets/images/browser/lg.png" alt="LG U+">
					</div>
					<div class="operator">
						<img src="resources/assets/images/browser/알뜰폰 1.png" alt="알뜰폰">
					</div>
				</div>
				<div class="pass-phone">
					<label for="modal-phone">PHONE<input type="text"
						id="modal-phone" name="modal_phone"></label>
				</div>
				<div class="pass-consents">
					<label><input type="checkbox" id="all-consent"> 전체
						동의</label> <label><input type="checkbox"> 개인정보이용 동의</label> <label><input
						type="checkbox"> 서비스이용약관 동의</label> <label><input
						type="checkbox"> 고유식별정보처리 동의</label> <label><input
						type="checkbox"> 통신사이용약관 동의</label>
				</div>
				<div class="pass-buttons">
					<button class="pass-btn" onclick="authPass()">PASS로 인증하기</button>
					<button class="pass-btn">문자(SMS)로 인증하기</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	
	/* 숫자가 아닌 문자를 제거 : 생년월일*/
	function formatBirth(input) {
	    input.value = input.value.replace(/[^0-9]/g, '').slice(0, 8);
	}

	/* 앞에서부터 11자리 설정 : 전화번호 입력  */
	function formatPhone(input) {
	    let value = input.value.replace(/[^0-9]/g, '').slice(0, 11);
	    if (!value.startsWith('010')) {
	        value = '010' + value.slice(3);
	    }
	    input.value = value;
	}

	
	/* 폼 유효성 검사 */
	function validateForm(formId) {
	    const form = document.getElementById(formId);
	    const inputs = form.querySelectorAll('input[type="text"]');
	    let isValid = true;
	
	    for (let input of inputs) {
	        if (!input.value.trim()) {
	            const labelText = input.closest('label').textContent.split(input.name)[0].trim();
	            alert(`${labelText}을(를) 입력해주세요.`);
	            input.focus();
	            isValid = false;
	            break;
	        }
	    }
	
	    return isValid;
	}

	function submitForm() {
	    if (validateForm('id-find-form')) {
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
	}

	function submitPwForm() {
	    if (validateForm('pw-find-form')) {
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
	}

	function submitForm() {
	    if (document.getElementById('id-find-form').checkValidity()) {
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
	    } else {
	        alert("모든 필드를 올바르게 입력해주세요.");
	    }
	}

	function submitPwForm() {
	    if (document.getElementById('pw-find-form').checkValidity()) {
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
	    } else {
	        alert("모든 필드를 올바르게 입력해주세요.");
	    }
	}

	// 이벤트 리스너 추가
	document.addEventListener('DOMContentLoaded', function() {
	    const birthInputs = document.querySelectorAll('#user_birth, #birth-pw');
	    const phoneInputs = document.querySelectorAll('#user_phone, #phone-pw');

	    birthInputs.forEach(input => {
	        input.addEventListener('input', function() { formatBirth(this); });
	    });

	    phoneInputs.forEach(input => {
	        input.addEventListener('input', function() { formatPhone(this); });
	    });
	});

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

        function authPass() {
            const selectedOperator = document.querySelector('.pass-operators .operator img.selected');
            const phone = document.getElementById('modal-phone').value;

            if (!selectedOperator) {
                alert('통신사를 선택해 주세요.');
                return;
            }

            if (!phone) {
                alert('전화번호를 입력해 주세요.');
                return;
            }

            const data = {
                operator: selectedOperator.alt,
                phone: phone
            };

            // PASS 인증 API 연동 부분
            $.ajax({
                url: 'https://yourPassApiEndpoint.com', // 실제 PASS API 엔드포인트로 변경
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function(response) {
                    if (response.success) {
                        alert("인증 성공: " + response.message);
                        closeModal();
                    } else {
                        alert("인증 실패: " + response.message);
                    }
                },
                error: function() {
                    alert("에러가 발생했습니다. 다시 시도해 주세요.");
                }
            });
        }

        document.querySelectorAll('.operator img').forEach(function(img) {
            img.onclick = function() {
                document.querySelectorAll('.operator img').forEach(function(i) {
                    i.classList.remove('selected');
                });
                img.classList.add('selected');
            };
        });

        document.getElementById('all-consent').onclick = function() {
            const checkboxes = document.querySelectorAll('.pass-consents input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        }
        
        document.getElementById('id-find-form').addEventListener('submit', function(e) {
            e.preventDefault();
            if (this.checkValidity()) {
                submitForm();
            }
        });
        
        document.getElementById('pw-find-form').addEventListener('submit', function(e) {
            e.preventDefault(); // 기본 제출 동작 방지
            if (this.checkValidity()) {
                submitPwForm();
            }
        });
    </script>
</body>
</html>
