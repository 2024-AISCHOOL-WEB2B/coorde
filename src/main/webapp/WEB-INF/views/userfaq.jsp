<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>OOTB 문의사항</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="author" content="Phoenixcoded" />

<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

<!-- vendor css -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Yellowtail&display=swap')
	;

* {
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	margin: 0;
	padding: 0;
}

.wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.logo img {
	margin-bottom: 20px;
}

.container {
	width: 1280px;
	margin: 50px auto;
	overflow: hidden;
	background-color: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-left: 450px;
	font-family: "Yellowtail", cursive;
}

.nav {
	display: flex;
	flex-direction: column; /* 수직으로 정렬 */
	align-items: flex-end; /* 아이템들을 오른쪽 정렬 (기본값) */
	padding: 10px;
}

.nav a {
	text-decoration: none;
	color: black;
}

.faq-section {
	margin: 20px 0;
}

.faq-section h2 {
	font-size: 20px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.faq-item {
	display: flex;
	padding: 10px 0;
	border-bottom: 1px solid #eee;
}

.faq-item p {
	margin: 0;
}

.faq-item span {
	font-size: 12px;
	color: #a8a2a2;
}

.buttons {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin: 20px 0;
}

.btn {
	padding: 10px 20px;
	margin: 5px;
	background-color: lightgray;
	border: none;
	cursor: pointer;
	border-radius: 10px;
}

.btn.active {
	background-color: gray;
	color: white;
}

.btn:hover {
	background-color: #ddd;
}

.inquiry {
	margin: 20px 0;
	text-align: left;
}

.inquiry p {
	font-size: 14px;
	color: #666;
	margin-bottom: 10px;
}

textarea {
	width: 100%;
	height: 100px;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
}

.inquiry-btn {
	display: block;
	width: 10%;
	background-color: black;
	color: white;
	border: none;
	padding: 10px;
	font-size: 16px;
	border-radius: 20px;
	cursor: pointer; /*마우스 포인터 변경*/
	margin-left: 580px;
}

.inquiry-btn:hover {
	background-color: #333;
}

input {
	border: none;
	outline: none;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="header">
				<img alt="" src="resources/assets/images/browser/LOGO.jpg">
			</div>
			<div class="faq-section">
				<div class="nav">
					<a href="logoutUser">LOGOUT</a><br> 
					<a href="gomyPage">MYPAGE</a>
				</div>
				<div class>
					<h2>
						<span class="lnr lnr-magnifier"></span>자주하는 질문
					</h2>
				</div>
				<div class="faq-item">
					<p>
						주문은 어떻게 하나요?<br>
						<br> <span>답변: 아직 준비중입니다.</span>
					</p>
				</div>
				<div class="faq-item">
					<p>
						회원 정보를 수정하고 싶습니다.<br>
						<br> <span>답변: EDIT 화면에서 진행하시면 됩니다.</span>
					</p>
				</div>
				<div class="faq-item">
					<p>
						사이즈 추천을 받고 싶습니다.<br>
						<br> <span>답변: 회원가입시 정보를 입력하고 상세페이지,리뷰에 추가로 입력해주시면
							됩니다.</span>
					</p>
				</div>
				<div class="faq-item">
					<p>
						회원과 비회원의 차이를 알고 싶습니다.<br>
						<br> <span>답변: 비회원은 키와 몸무게만 가지고 옷을 추천 드리고 있습니다. <br>
							회원은 키와 몸무게, 다양한 신체 사이즈의 정보를 기입할 수 있습니다.
						</span>
					</p>
				</div>
				<div class="faq-item">
					<p>
						아이디 비밀번호가 기억나지 않아요.<br>
						<br> <span>답변: FIND를 통해 찾으시면 됩니다. </span>
					</p>
				</div>
			</div>
			<form action="">
				<div class="buttons">
					<button class="btn" onclick="toggleButton(this, '회원정보')">회원정보</button>
					<button class="btn" onclick="toggleButton(this, '상품확인')">상품확인</button>
					<button class="btn" onclick="toggleButton(this, '서비스')">서비스</button>
				</div>
				<div class="inquiry">
					<p>접수된 문의는 순차적으로 답변을 드리고 있습니다. 문의 내용을 상세히 기재해 주셔야 정확한 답변이 가능합니다</p>
					<textarea id="inquiry-text" placeholder="문의 내용을 입력하세요"></textarea>
					<button class="inquiry-btn" onclick="submitInquiry()">문의하기</button>
				</div>
			</form>
		</div>
	</div>

	<script>
        let selectedOption = '';

        function selectOption(option) {
            selectedOption = option;
        }

        function toggleButton(button, option) {
            // 버튼의 active 클래스를 토글합니다.
            button.classList.toggle('active');

            // 버튼이 active 상태인지 확인합니다.
            if (button.classList.contains('active')) {
                selectedOption = option;
            } else {
                selectedOption = '';
            }
        }

        function submitInquiry() {
            const inquiryText = document.getElementById('inquiry-text').value;
            if (selectedOption === '') {
                alert('옵션을 선택하세요.');
                return;
            }
            if (inquiryText.trim() === '') {
                alert('문의 내용을 입력하세요.');
                return;
            }

            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '/managerfaq'; // 여기에 실제 서버 URL을 입력하세요.
            form.target = '_blank'; // 새 창에서 열기

            const optionInput = document.createElement('input');
            optionInput.type = 'hidden';
            optionInput.name = 'option';
            optionInput.value = selectedOption;
            form.appendChild(optionInput);

            const textInput = document.createElement('input');
            textInput.type = 'hidden';
            textInput.name = 'inquiry';
            textInput.value = inquiryText;
            form.appendChild(textInput);

            document.body.appendChild(form);
            form.submit();
            document.body.removeChild(form);
        }
    </script>

</body>
</html>