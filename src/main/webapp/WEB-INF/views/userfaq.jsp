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
    <link rel="stylesheet" href="resources/assets/css/userfaq.css">
</head>
<body>
<div class="wrap">
        <div class="container">
            <div class="header">
                <h1>OOTB</h1>
            </div>
            <div class="faq-section">
                <div class="nav">    
                    <a href="/main.html">LOGOUT</a><br>
                    <a href="/mypage.html">MYPAGE</a>
                </div>
                <div class><h2><span class="lnr lnr-magnifier"></span>자주하는 질문</h2></div>
                <div class="faq-item">
                    <p>주문은 어떻게 하나요?<br><br> <span>답변: 아직 준비중입니다.</span></p>
                </div>
                <div class="faq-item">
                    <p>회원 정보를 수정하고 싶습니다.<br><br> <span>답변: EDIT 화면에서 진행하시면 됩니다.</span></p>
                </div>
                <div class="faq-item">
                    <p>사이즈 추천을 받고 싶습니다.<br><br> <span>답변: 회원가입시 정보를 입력하고 상세페이지,리뷰에 추가로 입력해주시면 됩니다.</span></p>
                </div>
                <div class="faq-item">
                    <p>회원과 비회원의 차이를 알고 싶습니다.<br><br> <span>답변: 비회원은 키와 몸무게만 가지고 옷을 추천 드리고 있습니다.
                        <br> 회원은 키와 몸무게, 다양한 신체 사이즈의 정보를 기입할 수 있습니다. </span></p>
                </div>
                <div class="faq-item">
                    <p>아이디 비밀번호가 기억나지 않아요.<br><br> <span>답변: FIND를 통해 찾으시면 됩니다. </span></p>
                </div>
            </div>
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